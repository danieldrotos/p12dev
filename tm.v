module tm;
   reg clk= 0;
   reg reset= 0;
   
   computer comp(.clk(clk), .reset(reset));
   defparam comp.WIDTH= 32;
   
   initial
     begin
	$dumpfile("tm.vcd");
	$dumpvars;
	#1000 $finish;
     end
   
endmodule // tm
