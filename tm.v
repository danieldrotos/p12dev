module tm;
   reg clk= 0;
   reg reset= 0;
   reg [3:0] test_sel= 4'd0;

   wire [31:0] tout;
   
   defparam comp.WIDTH= 32;
   defparam comp.PROGRAM="light2.hex";
   computer comp
     (
      .clk(clk),
      .reset(reset),
      .test_sel(test_sel),
      .test_out(tout)
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
