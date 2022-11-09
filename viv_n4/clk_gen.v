module d10
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
     begin
	if (last)
	  c<= 0;
	else
	  c<= c+1;
     end
   
   assign o= (c==0) || (c==1) || (c==2) || (c==3) || (c==4)
/*
	     ((~c[3] & ~c[2]) & (~c[1] & ~c[0])) |
	     ((~c[3] & ~c[2]) & (~c[1] &  c[0])) |
             ((~c[3] & ~c[2]) & ( c[1] & ~c[0])) |
             ((~c[3] & ~c[2]) & ( c[1] &  c[0])) |
             ((~c[3] &  c[2]) & (~c[1] & ~c[0]))
             */
        ;
   
endmodule // div10

module d2
  (
   input wire i,
   output reg o
   );
   
   initial
     o= 0;
   
   always @(posedge i)
     o<= ~o;
   
endmodule

module d5
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
      
  assign o= (c==0) || (c==1) || (c==2)
	   //(~c[2] & ~c[1] & ~c[0]) |
           //(~c[2] & ~c[1] &  c[0]) |
           //(~c[2] &  c[1] & ~c[0])
             ;
            
endmodule

module clk_gen
  (
   input wire  f100MHz,
   output wire f50MHz,
   output wire f25MHz,
   output wire f20MHz,
   output wire f10MHz,
   output wire f1MHz,
   output wire f2MHz,
   output wire f100kHz,
   output wire f10kHz,
   output wire f1kHz,
   output wire f100Hz,
   output wire f10Hz,
   output wire f1Hz
   );
    
   d2  i100_50 (.i(f100MHz), .o(f50MHz));
   d2  i50_25  (.i(f50MHz),  .o(f25MHz));
   d5  i100_20 (.i(f100MHz), .o(f20MHz));
   d10 i100_10 (.i(f100MHz), .o(f10MHz));
   
   d5  i10_2   (.i(f10MHz),  .o(f2MHz));
   d10 i10_1   (.i(f10MHz),  .o(f1MHz));
   
   d10 i4    (.i(f1MHz),   .o(f100kHz));
   d10 i5    (.i(f100kHz), .o(f10kHz));
   d10 i6    (.i(f10kHz),  .o(f1kHz));
   d10 i7    (.i(f1kHz),   .o(f100Hz));
   d10 i8    (.i(f100Hz),  .o(f10Hz));
   d10 i9    (.i(f10Hz),   .o(f1Hz));
   
endmodule // clk_gen
