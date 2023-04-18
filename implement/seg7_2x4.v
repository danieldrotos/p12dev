module seg7_2x4
  (
   input wire	     clk,
   input wire	     reset,
   input wire [31:0] di,
   output wire [7:0] segl,
   output wire [3:0] anl,
   output wire [7:0] segh,
   output wire [3:0] anh
   );
   
   seg7_1x4 dl
     (
      .clk(clk),
      .reset(reset),
      .di(di[15:0]),
      .seg(segl),
      .an(anl)
      );
   
   seg7_1x4 dh
     (
      .clk(clk),
      .reset(reset),
      .di(di[31:16]),
      .seg(segh),
      .an(anh)
      );
   
endmodule // seg7_2x4
