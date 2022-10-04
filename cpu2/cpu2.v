module cpu2
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
   // output sources
   wire [WIDTH-1:0] 	       alu_res;
   wire 		       c_res;
   wire 		       z_res;
   wire 		       s_res;
   wire 		       v_res;
   wire 		       p_res;
   wire 		       u_res;
   // results
   wire [WIDTH-1:0] 	       res_alu;
   wire [5:0] 		       res_flags;
   wire [WIDTH-1:0] 	       res_call;
   wire [WIDTH-1:0] 	       res_ld;
   
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

   // FLAG register
   wire [5:0] 		       flags;
   wire 		       flag_c;
   wire 		       flag_s;
   wire 		       flag_z;
   wire 		       flag_v;
   wire 		       flag_p;
   wire 		       flag_u;
   
   regm #(.WIDTH(6)) reg_flag
     (
      .clk(clk),
      .reset(reset/*1'b0*/),
      .cen(flagwb_en),
      .din (ers_flags),
      .dout(flags)
      );
   assign flag_c= flags[CIDX];
   assign flag_s= flags[SIDX];
   assign flag_z= flags[ZIDX];
   assign flag_v= flags[VIDX];
   assign flag_p= flags[PIDX];
   assign flag_u= flags[UIDX];
      
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
   wire 		       cond= ic[23:20];
   wire [2:0] 		       inst= ic[27:25];
   wire 		       inst_param= ic[24];
   wire [3:0] 		       rd= ic[23:20];
   wire [4:0] 		       alu_op= {ic[24],ic[19:16]};
   wire [3:0] 		       rb= ic[11:8];
   wire [15:0] 		       im16= ic[15:0];
   wire [23:0] 		       im24= ic[23:0];
   wire [19:0] 		       im20= ic[19:0];
   wire 		       u= ic[15];
   wire 		       p= ic[14];

   // decode instructions
   wire 		       inst_alu2= inst==0;
   wire 		       inst_alu1= inst==1;
   wire 		       inst_call= inst==2;
   wire 		       inst_ext = inst==3;
   wire 		       inst_st_r= inst==4;
   wire 		       inst_ld_r= inst==5;
   wire 		       inst_st_i= inst==6;
   wire 		       inst_ld_i= inst==7;

   // decode condition
   wire 		       ena;

   // ALU
   alu2 alu
     (
      .op(alu_op),
      .fi({1'b0,1'b0,flags}),
      .bi(),
      .di(),
      .im(im16),
      .res(),
      .fo({1'b0,1'b0,res_flags}),
      .flag_we()
      );
   	    
endmodule // cpu2
