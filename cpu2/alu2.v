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

   // classes of inst sets
   wire 		    op_2reg;
   wire 		    op_2im;
   wire 		    op_1;
   assign op_1= op[5];
   assign op_2im= !op_1 & op[4];
   assign op_2reg= !op_1 & !op[4];

   // second operand
   wire [WIDTH-1:0] 	    op2;
   wire [WIDTH-1:0] 	    zex_im;
   wire [WIDTH-1:0] 	    sex_im;
   wire [WIDTH-1:0] 	    oex_im;
   assign zex_im= {16'h0, im};
   assign sex_im= {
		   im[15],
		   im[15],
		   im[15],
		   im[15],
		   im[15],
		   im[15],
		   im[15],
		   im[15],
		   im[15],
		   im[15],
		   im[15],
		   im[15],
		   im[15],
		   im[15],
		   im[15],
		   im[15],
		   im
		   };
   assign oex_im= {16'hffff, im};
   assign op2= op_2reg?bi:
	       (op[3:2]=={2'b00})?zex_im:
	       (op[3:0]=={4'b1111})?oex_im:
	       (op[3:2]=={2'b11})?zex_im:
	       sex_im;
   
endmodule // alu2
