`unconnected_drive pull0

module tm(input wire i, output wire o);
   reg clk= 0;
   reg ioclk= 0;
   reg reset= 0;
   reg [3:0] test_sel= 4'd0;
   reg [31:0] btn= 0;
   
   wire [31:0] tout;

   always #1 clk= !clk;
   always #1 ioclk= ~ioclk;
   
   defparam comp.WIDTH= 32;
   defparam comp.PROGRAM="blink_tmr.hex";
   comp comp
     (
      .CLK(clk),
      .RESET(reset),
      .PORTI(btn),
      .TRS/*test_sel*/(test_sel),
      .TR/*test_out*/(tout),
      .mem_test(1'b0),
      .clk10m(ioclk)
      );

   
   initial
     begin
	$dumpfile("tm.vcd");
	$dumpvars;
	test_sel= 4'd2;
	#2 reset= 1;
	#10 reset= 0;
	#100 btn= 32'd4;
	#100 btn= 32'd0;
	#100 btn= 32'd4;
	#100 btn= 32'd0;
	#10000 $finish;
     end
   
endmodule // tm
