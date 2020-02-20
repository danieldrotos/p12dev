module dword2seg
  (
   input wire [31:0] i,
   input wire s,
   output wire [31:0] dout
   );

   wire [7:0] 	     d0, d1, d2, d3;

   wire [15:0] 	     selected_d;

   assign selected_d
     =
      (s)?i[31:16]:
      i[15:0];

   bin2seg b2s0 (.di(selected_d[ 3: 0]), .seg(d0));
   bin2seg b2s1 (.di(selected_d[ 7: 4]), .seg(d1));
   bin2seg b2s2 (.di(selected_d[11: 8]), .seg(d2));
   bin2seg b2s3 (.di(selected_d[15:12]), .seg(d3));

   assign dout= {d3[7:0], d2[7:0], d1[7:0], d0[7:0]};
   
endmodule // dword2seg
