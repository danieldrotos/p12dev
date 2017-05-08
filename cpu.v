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

   regm reg_ic
     (
      .clk(clk),
      .reset(reset),
      .cen(phf), // phe?
      .din(mbus_din),
      .dout(ic)
      );
   defparam reg_ic.WIDTH= WIDTH;

   rfm regs
     (
      .clk(clk),
      .reset(reset),
      .cen(phe),
      .wen(),
      .din(wbd),
      .last(pc)
      );
   defparam regs.WIDTH= WIDTH;
   defparam regs.ADDR_SIZE= 4;

   /*
   cntreg reg_pc
     (
      .clk(clk),
      .reset(reset),
      .cen(),
      .wen(),
      .din(),
      .dout(pc)
      );
   defparam reg_pc.WIDTH= WIDTH;
    */
   
   alu alu();
   defparam alu.WIDTH= WIDTH;
   
endmodule // cpu
