module regm(clk, reset, cen, din, dout);
   parameter WIDTH= 32;
   
   input clk;
   input reset;
   input cen;
   input [WIDTH-1:0] din;
   output [WIDTH-1:0] dout;

   reg [WIDTH-1:0]    r;

   always @(posedge clk, posedge reset)
     begin
	if (reset)
	  r <= 0;
	else
	  begin
	     if (cen)
	       r <= din;
	  end
     end
   
   assign dout= r;
   
endmodule // regm
