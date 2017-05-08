module cpu(clk, reset,
	   mbus_aout, mbus_din, mbus_dout, mbus_wen,
	   test_sel, test_out);
   parameter WIDTH= 32;
   parameter ADDR_SIZE= 32;

   // basic inputs
   input wire clk;
   input wire reset;

   // bus
   input wire [WIDTH-1:0] mbus_din;
   output wire [ADDR_SIZE-1:0] mbus_aout;
   output wire [WIDTH-1:0]     mbus_dout;
   output wire 		       mbus_wen;

   // test
   input wire [3:0] 	       test_sel;
   output wire [WIDTH-1:0]     test_out;

   // internal signals
   wire [WIDTH-1:0] 	       ic;	// output of IC register
   wire [WIDTH-1:0] 	       pc;	// output of PC register 
   // phase signals
   wire 		       phf;	// fetch
   wire 		       phe;	// PC increment; execute
   wire 		       phm;	// memory r/w; link
   wire 		       phwb;	// writeback
   // selected data as parameteres
   wire [WIDTH-1:0] 	       opa;
   wire [WIDTH-1:0] 	       opb;
   // output sources
   wire [WIDTH-1:0] 	       alu_res;
   // selected data to use in writeback
   wire [WIDTH-1:0] 	       wbd;	// writeback data
   
   // scheduler generates phase signals
   schedm scheduler
     (
      .clk(clk),
      .reset(reset),
      .phf(phf),	// phase 1
      .phe(phe),	// phase 2
      .phm(phm),	// phase 3
      .phwb(phwb),	// phase 4
      .clk_stat()
      );

   // Instruction Register contains instruction code
   defparam reg_ic.WIDTH= WIDTH;
   regm reg_ic
     (
      .clk(clk),
      .reset(reset),
      .cen(phf), // phe?
      .din(mbus_din),
      .dout(ic)
      );

   // Register file: R0..R15 (R14=Link,R15=PC)
   defparam regs.WIDTH= WIDTH;
   defparam regs.ADDR_SIZE= 4;
   rfm regs
     (
      .clk(clk),
      .reset(reset),
      .cen(phe),
      .wen(phwb),
      .link(1'b0),
      .wa(ic[23:20]),
      .din(/*wbd*/alu_res),
      .ra(ic[19:16]),
      .da(opa),
      .rb(ic[15:12]),
      .db(opb),
      .rd(ic[23:20]),
      .dd(),
      .last(pc)
      );

   // ALU
   defparam alu.WIDTH= WIDTH;
   alu alu
     (
      .op(ic[11:7]),
      .ci(),
      .ai(opa),
      .bi(opb),
      .res(alu_res),
      .co(),
      .vo(),
      .zo(),
      .so()
      );

   // select data for writeback
   assign wdb= alu_res;
   assign mbus_aout= pc;
   
endmodule // cpu
