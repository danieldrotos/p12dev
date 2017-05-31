`unconnected_drive pull0

module test_rfm();
   reg clk= 0;
   reg reset= 0;
   reg [3:0] ra= 4'd0;

   always #2 clk= ~clk;
   always #5 ra<= ra+1;

   wire [31:0] da;
   
   rfm regs
     (
      .clk(clk),
      .reset(reset),
      .din(32'd0),
      .ra(ra),
      .da(da),
      .rb(4'd0),
      .rd(4'd0)
      );

   initial
     begin
	$dumpfile("test_rfm.vcd");
	$dumpvars;
	#2 reset= 1;
	#5 reset= 0;
	#150 $finish;
     end
   
endmodule // test_rfm
