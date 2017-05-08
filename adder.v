module adder(ci,ai,bi,res,co,vo);
   parameter WIDTH=8;
     
   input wire ci;
   input wire [WIDTH-1:0] ai;
   input wire [WIDTH-1:0] bi;
   output wire [WIDTH-1:0] res;
   output wire 		   co;
   output wire 		   vo;

   wire [WIDTH:0]  r;

   assign r= {1'b0,ai} + {1'b0,bi} + ci;

   assign res= r[WIDTH-1:0];
   assign co= r[WIDTH];
   assign vo= (ai[WIDTH-1] & bi[WIDTH-1] & ~r[WIDTH-1]) |
	      (~ai[WIDTH-1] & ~bi[WIDTH-1] & r[WIDTH-1]);
   
endmodule // adder

module subber(ci,ai,bi,res,co,vo);
   parameter WIDTH=8;
   
   input wire ci;
   input wire [WIDTH-1:0] ai;
   input wire [WIDTH-1:0] bi;
   output wire [WIDTH-1:0] res;
   output wire 		   co;
   output wire 		   vo;
   
   adder #(WIDTH) a(.ci(ci), .ai(ai), .bi(~bi),
	   .res(res), .co(co), .vo(vo));
   
endmodule // subber
