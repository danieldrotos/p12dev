module tm;
   reg clk= 0;
   reg reset= 0;
   
   defparam comp.WIDTH= 32;
   defparam comp.PROGRAM="t1.hex";
   computer comp(.clk(clk), .reset(reset));

   always #1 clk= !clk;
   
   initial
     begin
	$dumpfile("tm.vcd");
	$dumpvars;
	#2 reset= 1;
	#10 reset= 0;
	
	#1000 $finish;
     end
   
endmodule // tm
