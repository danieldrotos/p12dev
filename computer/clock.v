`timescale 10ns/1ns

module clock
  #(
    parameter WIDTH=32
    )
   (
    input wire		    clk,
    input wire		    reset,
    input wire [WIDTH-1:0]  addr,
    input wire [WIDTH-1:0]  din,
    input wire		    wen,
    input wire		    cs,
    output wire [WIDTH-1:0] dout
   );

   reg [WIDTH-1:0]	    pre;
   reg [WIDTH-1:0]	    precnt;
   reg [WIDTH-1:0]	    clock;

   wire			    en;
   assign en= |pre;
   
   always @(posedge clk)
     begin
	if (reset)
	  pre<= 0;
	else if (cs & wen & addr[0])
	  pre<= din;
     end

   wire reached;
   assign reached= precnt == pre;

   always @(posedge clk)
     begin
	if (reset | reached | (cs & wen & addr[0]))
	  precnt<= 0;
	else if (en)
	  precnt<= precnt+1;
     end

   always @(posedge clk)
     begin
	if (reset)
	  clock<= 0;
	else if (reached & en)
	  clock<= clock+1;
	else if (cs & wen & !addr[0])
	  clock<= din;
     end

   assign dout= addr[0]?pre: clock ;
   
endmodule // clock
