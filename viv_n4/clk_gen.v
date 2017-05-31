module div10
  (
   input wire i,
   output wire o
   );

   reg [3:0]   c;

   initial
     c= 4'd0;

   wire last;
   assign last= c==4'd9;
   
   always @(posedge i)
     if (last)
       c<= 0;
     else
       c<= c+1;

   assign o=    (~c[3] & ~c[2] & ~c[1] & ~c[0]) |
                (~c[3] & ~c[2] & ~c[1] &  c[0]) |
                (~c[3] & ~c[2] &  c[1] & ~c[0]) |
                (~c[3] & ~c[2] &  c[1] &  c[0]) |
                (~c[3] &  c[2] & ~c[1] & ~c[0])
         ;
   
endmodule // div10

module div2
  (
   input wire i,
   output reg o
  );
  
  always @(posedge i)
    o<= ~o;
    
endmodule

module div5
  (
   input wire i,
   output wire o
  );
  
  reg [2:0] c;
  
  initial
    c= 3'd0;
    
  always @(posedge i)
    if (c==3'd4)
      c<= 0;
    else
      c<= c+1;
      
  assign o= (~c[2] & ~c[1] & ~c[0]) |
            (~c[2] & ~c[1] &  c[0]) |
            (~c[2] &  c[1] & ~c[0])
            ;
            
endmodule

module clk_gen
  (
   input wire f100MHz,
   output wire f50MHz,
   output wire f25MHz,
   output wire f20MHz,
   output wire f10MHz,
   output wire f1MHz,
   output wire f100kHz,
   output wire f10kHz,
   output wire f1kHz,
   output wire f100Hz,
   output wire f10Hz,
   output wire f1Hz
   );

   div2  d0(.i(f100MHz), .o(f50MHz));
   div2  db(.i(f50MHz),  .o(f25MHz));
   div5  da(.i(f100MHz), .o(f20MHz));
   div10 d1(.i(f100MHz), .o(f10MHz));
   div10 d2(.i(f10MHz),  .o(f1MHz));
   div10 d3(.i(f1MHz),   .o(f100kHz));
   div10 d4(.i(f100kHz), .o(f10kHz));
   div10 d5(.i(f10kHz),  .o(f1kHz));
   div10 d6(.i(f1kHz),   .o(f100Hz));
   div10 d7(.i(f100Hz),  .o(f10Hz));
   div10 d8(.i(f10Hz),   .o(f1Hz));
      
endmodule // clk_gen
