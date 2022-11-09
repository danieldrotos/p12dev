module cpu3
  #(
    parameter WIDTH= 32,
    parameter ADDR_SIZE= 32
    )
  (
   // basic inputs
   input wire 		       clk,
   input wire 		       reset,
   // bus
   output wire [ADDR_SIZE-1:0] mbus_aout,
   input wire [WIDTH-1:0]      mbus_din,
   output wire [WIDTH-1:0]     mbus_dout,
   output wire 		       mbus_wen,
   // test
   input wire [3:0] 	       test_sel,
   output wire [WIDTH-1:0]     test_out,
   input wire [3:0] 	       test_rsel,
   output wire [WIDTH-1:0]     test_reg,
   output wire [2:0] 	       clk_stat
   );

   // internal signals
   wire [WIDTH-1:0] 	       ic;	// output of IC register
   wire [WIDTH-1:0] 	       pc;	// output of PC register 
   // phase signals
   wire 		       phf;	// fetch
   wire 		       phe;	// PC increment; execute
   wire 		       phm;	// memory r/w; link
   wire 		       phw;	// writeback
   wire 		       ena;
   // selected data as parameteres
   wire [WIDTH-1:0] 	       opa;
   wire [WIDTH-1:0] 	       opb;
   wire [WIDTH-1:0] 	       opd;
   // results
   wire [WIDTH-1:0] 	       res_alu;
   wire [7:0] 		       res_flags;
   wire [WIDTH-1:0] 	       res_call;
   wire [WIDTH-1:0] 	       res_ld;
   // selected data to use in writeback
   wire [3:0] 		       wb_address;
   wire [WIDTH-1:0] 	       wb_data;	// writeback data
   wire 		       wb_en;
   reg [WIDTH-1:0] 	       mr_data;

   
   // scheduler generates phase signals
   schedm scheduler
     (
      .clk(clk),
      .reset(reset),
      .phf(phf),	// phase 1: FETCH (stores fetched code into IC reg)
      .phe(phe),	// phase 2: EXEC (signals go through ALU)
      .phm(phm),	// phase 3: MEM (LD/ST read/write)
      .phw(phw),	// phase 4: WRITEBACK (store back result to register)
      .clk_stat(clk_stat)
      );
 

   // Instruction Register contains instruction code
   regm #(.WIDTH(WIDTH)) reg_ic
     (
      .clk(clk),
      .reset(reset),
      .cen(phf), // phe?
      .din(mbus_din),
      .dout(ic)
      );


   // pick parts of the IC
   wire [3:0]		       cond= ic[31:28];
   wire [2:0] 		       inst= ic[27:25];
   wire 		       inst_param= ic[24];
   wire [5:0] 		       alu_op= {ic[25:24],ic[19:16]};
   wire [3:0] 		       ra= ic[19:16];
   wire [3:0] 		       rb= ic[11:8];
   wire [3:0] 		       rd= ic[23:20];
   wire [15:0] 		       im16= ic[15:0];
   wire [23:0] 		       im24= ic[23:0];
   wire [19:0] 		       im20= ic[19:0];
   wire 		       u= ic[15];
   wire 		       p= ic[14];
   wire 		       w= ic[24];

   wire 		       flag_wb_en;
   wire 		       alu_flag_en;
   wire 		       alu_wb_en;

   // decode instructions
   wire 		       inst_alu2= inst==0;
   wire 		       inst_alu1= inst==1;
   wire 		       inst_call= inst==2;
   wire 		       inst_ext = inst==3;
   wire 		       inst_st_r= inst==4;
   wire 		       inst_ld_r= inst==5;
   wire 		       inst_st_i= inst==6;
   wire 		       inst_ld_i= inst==7;
   wire 		       inst_alu;
   wire 		       inst_ld;
   wire 		       inst_st;
   wire 		       inst_mem;
   wire 		       inst_br;
   wire 		       inst_wb;
   assign inst_ld= inst_ld_r | inst_ld_i;
   assign inst_st= inst_st_r | inst_st_i;
   assign inst_mem= inst_st | inst_ld;
   assign inst_alu= inst_alu1 | inst_alu2;
   assign inst_br= inst_call | ((inst_alu | inst_ld) & (rd==4'd15));
   assign inst_wb= (inst_alu & alu_wb_en) |
		   inst_br |
		   inst_ld;

   // decode condition
   assign ena= (cond==4'h0)? 1 : // always
	       (cond==4'h1)? flag_z : // EQ
		     (cond==4'h2)? !flag_z : // NE
		     (cond==4'h3)? flag_c : // CS HS
		     (cond==4'h4)? !flag_c : // CC LO
		     (cond==4'h5)? flag_s : // MI
		     (cond==4'h6)? !flag_s : // PL
		     (cond==4'h7)? flag_o : // VS
		     (cond==4'h8)? !flag_o : // VC
		     (cond==4'h9)? flag_c & !flag_z : // HI
		     (cond==4'ha)? !flag_c | flag_z : // LS
		     (cond==4'hb)? !(flag_s ^ flag_o): // GE
		     (cond==4'hc)? flag_s ^ flag_o : // LT
		     (cond==4'hd)? !flag_z & !(flag_s ^ flag_o) : // GT
		     (cond==4'he)? flag_z | (flag_s ^ flag_o): // LE
		     (cond==4'hf)? 1 : // uncond
		     0;


   // Register file
   rfm2 #(.WIDTH(WIDTH)) regs
     (
      .clk(clk),
      .reset(reset),
      .ra(/*ra*/4'b0),
      .rb(/*rb*/4'b0),
      .rd(/*inst_call?4'd15:rd*/4'b0),
      .rt(/*test_rsel*/4'b0),
      .fn_inc_pc(phe),
      .fn_link(/*ena & inst_call & phe*/1'b0),
      .fn_ra_change(/*ena & inst_mem & w & phm*/1'b0),
      .fn_wb(/*ena & inst_wb & phw*/1'b0),
      .wb_data(/*wb_data*/32'b0),
      .ra_changed(/*opa_changed*/32'b0),
      .da(opa),
      .db(opb),
      .dd(opd),
      .dt(test_reg),
      .pc(pc)
      );

   
   // FLAG register
   wire [7:0] 		       flags;
   wire 		       flag_c;
   wire 		       flag_s, flag_n;
   wire 		       flag_z;
   wire 		       flag_v, flag_o;
   wire 		       flag_p;
   wire 		       flag_u;
   
   regm #(.WIDTH(8)) reg_flag
     (
      .clk(clk),
      .reset(reset),
      .cen(/*flag_wb_en*/1'b0),
      .din (res_flags),
      .dout(flags)
      );
   assign flag_c= flags[`CIDX];
   assign flag_s= flags[`SIDX];
   assign flag_z= flags[`ZIDX];
   assign flag_v= flags[`VIDX];
   assign flag_p= flags[`PIDX];
   assign flag_u= flags[`UIDX];
   assign flag_o= flag_v;
   assign flag_n= flag_s;
   assign flag_wb_en= ena & alu_flag_en & phw;

   // memory interface
   
   // handle input data lines
   wire 		       en_mr_data;
   assign en_mr_data= phm /*& inst_ld*/;
   // latched data read from memory
   always @(posedge clk)
     begin
	if (en_mr_data)
	  mr_data<= mbus_din;
     end

   // produce address outputs
   wire [WIDTH-1:0] addr_phf;
   wire [WIDTH-1:0] addr_phe;
   wire [WIDTH-1:0] addr_phm;
   wire [WIDTH-1:0] addr_phw;

   assign addr_phf= pc;
   assign addr_phe= /*inst_ld?aof_ldst:*/pc;
   assign addr_phm= /*(inst_ld|inst_st)?aof_ldst:*//*pc*/32'h0000f000;
   assign addr_phw= /*(inst_br&ena)?wb_data:*/pc;
   assign mbus_aout= phf?addr_phf:
		     phe?addr_phe:
		     phm?addr_phm:
		     phw?addr_phw:
		     pc;

   // produce data outpouts   
   assign mbus_dout= /*opd*/ic;
   assign mbus_wen = phm;//1'b0;//ena & (phm/*|phe*/) & inst_st;
   
endmodule // cpu3