module tm(input wire i, output wire o);
   reg clk= 0;
   reg reset= 0;
   reg [3:0] test_sel= 4'd0;

   wire [31:0] tout;
   
   defparam comp.WIDTH= 32;
   defparam comp.PROGRAM="light2.hex";
   comp comp
     (
      .CLK(clk),
      .RESET(reset),
      .TRS/*test_sel*/(test_sel),
      .TR/*test_out*/(tout),
      .mem_test(1'b0)
      );

   always #1 clk= !clk;
   
   initial
     begin
	$dumpfile("tm.vcd");
	$dumpvars;
	test_sel= 4'd2;
	#2 reset= 1;
	#10 reset= 0;
	
	#1000 $finish;
     end
   
endmodule // tm
