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
   // selected data to use in writeback
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
   assign addr_phm= /*(inst_ld|inst_st)?aof_ldst:*/pc;
   assign addr_phw= /*(inst_br&ena)?wb_data:*/pc;
   assign mbus_aout= phf?addr_phf:
		     phe?addr_phe:
		     phm?addr_phm:
		     phw?addr_phw:
		     pc;

   // produce data outpouts   
   assign mbus_dout= opd;
   assign mbus_wen = 1'b0;//ena & (phm/*|phe*/) & inst_st;
   
endmodule // cpu3
