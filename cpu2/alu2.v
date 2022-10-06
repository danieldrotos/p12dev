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

   // input flags
   wire 		    ci= fi[`CIDX];
   wire 		    vi= fi[`VIDX];
   wire 		    zi= fi[`ZIDX];
   wire 		    si= fi[`SIDX];
   
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

   // central adder
   wire 		    cin;
   assign cin= (op[3:0]==4'h4)?  0 : // add
	       (op[3:0]==4'h5)? ci : // adc
	       (op[3:0]==4'h6)?  1 : // sub
	       (op[3:0]==4'h7)? ci : // sbb
	       (op[3:0]==4'h8)?  1 : // cmp
	       (op[3:0]==4'ha)?  0 : // plus
	       ci;
   wire [WIDTH-1:0] 	    adder_op2;
   assign adder_op2= (op[3:0]==4'h4)?  op2 : // add
		     (op[3:0]==4'h5)?  op2 : // adc
		     (op[3:0]==4'h6)? ~op2 : // sub
		     (op[3:0]==4'h7)? ~op2 : // sbb
		     (op[3:0]==4'h8)? ~op2 : // cmp
		     (op[3:0]==4'ha)?  op2 : // plus
		     op2;
   
   wire [WIDTH-1:0] 	    res_adder;
   wire 		    c_adder;
   wire 		    v_adder;
   adder #(.WIDTH(WIDTH)) adder
     (
      .ci(cin),
      .ai(di),
      .bi(adder_op2),
      .res(res_adder),
      .co(c_adder),
      .vo(v_adder)
      );
   
   // results
   wire [WIDTH-1:0] 	    res_2im;
   wire [WIDTH-1:0] 	    res_2reg;
   wire [WIDTH-1:0] 	    res_2;
   wire [WIDTH-1:0] 	    res_1;

   wire [WIDTH-1:0] 	    res_sed;
   assign res_sed= {
		    op2[15],
		    op2[15],
		    op2[15],
		    op2[15],
		    op2[15],
		    op2[15],
		    op2[15],
		    op2[15],
		    op2[15],
		    op2[15],
		    op2[15],
		    op2[15],
		    op2[15],
		    op2[15],
		    op2[15],
		    op2[15],
		    op2[15:0]
		    };
   
   assign res_2reg= (op[3:0]==4'h0)? op2 :
		    (op[3:0]==4'h1)? di :
		    (op[3:0]==4'h2)? di :
		    (op[3:0]==4'h3)? res_sed :
		    di;
   
   wire [WIDTH-1:0] 	    res_mvl;
   wire [WIDTH-1:0] 	    res_mvh;
   wire [WIDTH-1:0] 	    res_mvzl;
   wire [WIDTH-1:0] 	    res_mvs;
   assign res_mvl = { di[31:16], op2[15:0] };
   assign res_mvh = { op2[15:0], di[15:0] };
   assign res_mvzl= { 16'd0, op2[15:0] };
   assign res_mvs = { res_sed };		     
   assign res_2im=  (op[3:0]==4'h0)? res_mvl :
		    (op[3:0]==4'h1)? res_mvh :
		    (op[3:0]==4'h2)? res_mvzl :
		    (op[3:0]==4'h3)? res_mvs :
		    di;

   assign res_2= (op[3:2]==2'b00)? ((op_2reg?res_2reg:res_2im)) :
		 (op[3:0]==4'h4)? res_adder :
		 (op[3:0]==4'h5)? res_adder :
		 (op[3:0]==4'h6)? res_adder :
		 (op[3:0]==4'h7)? res_adder :
		 (op[3:0]==4'h8)? res_adder :
		 (op[3:0]==4'h9)? di * op2 :
		 (op[3:0]==4'ha)? res_adder :
		 (op[3:0]==4'hb)? di :
		 (op[3:0]==4'hc)? di & op2 :
		 (op[3:0]==4'hd)? di | op2 :
		 (op[3:0]==4'he)? di ^ op2 :
		 (op[3:0]==4'hf)? di & op2 :
		 di;

   // Produce outputs
   assign res= (op_1)? res_1 :
	       res_2;
   
endmodule // alu2
