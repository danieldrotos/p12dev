module simif
  #(
    parameter WIDTH= 32
    )
   (
    input wire 	       clk,
    input wire 	       reset,
    input wire 	       cs,
    input wire 	       wen,
    input wire [0:0]   addr,
    input [WIDTH-1:0]  din,

    output [WIDTH-1:0] dout,
    
    output [WIDTH-1:0] porta,
    output [WIDTH-1:0] portb,
    output [WIDTH-1:0] portc,
    output [WIDTH-1:0] portd
    );

   reg 		       got_p;

   always @(posedge clk, posedge reset)
     begin
	if (reset)
	  got_p<= 0;
	else if (cs & wen)
	  begin
	     if (got_p)
	       begin
`ifdef IVERILOG
		  $write("%c", din[7:0]);
`endif
	       end
	     got_p<= din=="p";
	  end
     end
   
   initial
     begin
	got_p= 0;
     end
	
endmodule // simif

     
