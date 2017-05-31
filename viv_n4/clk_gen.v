module div10
  (
   input wire i,
   output wire o
   );

   reg [3:0]   c;

   initial
     reg= 4'd0;

   wire last;
   assign last= c==4'd9;
   
   always @(posedge i)
     if (last)
       c<= 0;
     else
       c<= c+1;

   assign o= last;
   
endmodule // div10

module clk_gen
  (
   input wire f100MHz,
   output wire f10MHz,
   output wire f1MHz,
   output wire f100kHz,
   output wire f10kHz,
   output wire f1kHz,
   output wire f10Hz,
   output wire f1Hz
   );

   div10 d1(.i(f100MHz), .o(f10MHz));
   div10 d2(.i(f10MHz), .o(f1MHz));
   div10 d3(.i(f1MHz), .o(f100kHz));
   div10 d4(.i(f100kHz), .o(f10kHz));
   div10 d5(.i(f10kHz), .o(f1kHz));
   div10 d6(.i(f1kHz), .o(f100Hz));
   div10 d7(.i(f100Hz), .o(f10Hz));
   div10 d8(.i(f10Hz), .o(f1Hz));
      
endmodule // clk_gen
