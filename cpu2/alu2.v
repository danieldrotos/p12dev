`include "defs.v"

module alu2
  #(
    parameter WIDTH=32,
    parameter IWIDTH=16
    )
   (
    input wire [5:0] 	    op,
    
    input wire [7:0] 	    fi,
    input wire [WIDTH-1:0]  bi,
    input wire [WIDTH-1:0]  di,
    input wire [IWIDTH-1:0] im,
    
    output wire [WIDTH-1:0] res,
    output wire [7:0] 	    fo,

    output wire 	    wb_en, 
    output wire 	    flag_en
    );

   wire [WIDTH-1:0] 	    op2;
   
endmodule // alu2
