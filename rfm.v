module rfm(clk, reset, wen, cen, link,
	   wa, din,
	   ra, da,
	   rb, db,
	   rd, dd,
	   rt, dt,
	   last);
   parameter WIDTH= 32;
   parameter ADDR_SIZE= 4;
   
   input wire clk;
   input wire reset;
   input wire wen;
   input wire cen;
   input wire link;
   
   input wire [ADDR_SIZE-1:0] wa;
   input wire [WIDTH-1:0]     din;
   input wire [ADDR_SIZE-1:0] ra;
   input wire [ADDR_SIZE-1:0] rb;
   input wire [ADDR_SIZE-1:0] rd;
   input wire [ADDR_SIZE-1:0] rt;
   
   output wire [WIDTH-1:0] da;
   output wire [WIDTH-1:0] db;
   output wire [WIDTH-1:0] dd;
   output wire [WIDTH-1:0] dt;
   output [WIDTH-1:0] 	   last;
   /*
   wire [31:0] 		   ro0;
   wire [31:0] 		   ro1;
   wire [31:0] 		   ro2;
   wire [31:0] 		   ro3;
   wire [31:0] 		   ro4;
   wire [31:0] 		   ro5;
   wire [31:0] 		   ro6;
   wire [31:0] 		   ro7;
   wire [31:0] 		   ro8;
   wire [31:0] 		   ro9;
   wire [31:0] 		   ro10;
   wire [31:0] 		   ro11;
   wire [31:0] 		   ro12;
   wire [31:0] 		   ro13;
   wire [31:0] 		   ro14;
   wire [31:0] 		   ro15;
    */
   /*
   wire 		   wen0;
   wire 		   wen1;
   wire 		   wen2;
   wire 		   wen3;
   wire 		   wen4;
   wire 		   wen5;
   wire 		   wen6;
   wire 		   wen7;
   wire 		   wen8;
   wire 		   wen9;
   wire 		   wen10;
   wire 		   wen11;
   wire 		   wen12;
   wire 		   wen13;
   wire 		   wen14;
   wire 		   wen15;
   */
   /*
   assign wen0 = !wa[3] & !wa[2] & !wa[1] & !wa[0];
   assign wen1 = !wa[3] & !wa[2] & !wa[1] &  wa[0];
   assign wen2 = !wa[3] & !wa[2] &  wa[1] & !wa[0];
   assign wen3 = !wa[3] & !wa[2] &  wa[1] &  wa[0];
   assign wen4 = !wa[3] &  wa[2] & !wa[1] & !wa[0];
   assign wen5 = !wa[3] &  wa[2] & !wa[1] &  wa[0];
   assign wen6 = !wa[3] &  wa[2] &  wa[1] & !wa[0];
   assign wen7 = !wa[3] &  wa[2] &  wa[1] &  wa[0];
   assign wen8 =  wa[3] & !wa[2] & !wa[1] & !wa[0];
   assign wen9 =  wa[3] & !wa[2] & !wa[1] &  wa[0];
   assign wen10=  wa[3] & !wa[2] &  wa[1] & !wa[0];
   assign wen11=  wa[3] & !wa[2] &  wa[1] &  wa[0];
   assign wen12=  wa[3] &  wa[2] & !wa[1] & !wa[0];
   assign wen13=  wa[3] &  wa[2] & !wa[1] &  wa[0];
   assign wen14=  wa[3] &  wa[2] &  wa[1] & !wa[0];
   assign wen15=  wa[3] &  wa[2] &  wa[1] &  wa[0];
   */
   /*
   regm r0 (clk, reset, wen0 , din, ro0 );
   regm r1 (clk, reset, wen1 , din, ro1 );
   regm r2 (clk, reset, wen2 , din, ro2 );
   regm r3 (clk, reset, wen3 , din, ro3 );
   regm r4 (clk, reset, wen4 , din, ro4 );
   regm r5 (clk, reset, wen5 , din, ro5 );
   regm r6 (clk, reset, wen6 , din, ro6 );
   regm r7 (clk, reset, wen7 , din, ro7 );
   regm r8 (clk, reset, wen8 , din, ro8 );
   regm r9 (clk, reset, wen9 , din, ro9 );
   regm r10(clk, reset, wen10, din, ro10);
   regm r11(clk, reset, wen11, din, ro11);
   regm r12(clk, reset, wen12, din, ro12);
   regm r13(clk, reset, wen13, din, ro13);
   regm r14(clk, reset, wen14, din, ro14);
   regm r15(clk, reset, wen15, din, ro15);
    */

   wire [WIDTH-1:0] 	   pc_out;
   reg [WIDTH-1:0] 	   reg_array[0:(1<<ADDR_SIZE)-1-1];
   cntreg pc_reg
     (
      .clk(clk),
      .reset(reset),
      .cen(cen),
      .wen(wen & (wa==((1<<ADDR_SIZE)-1))),
      .din(din),
      .dout(pc_out)
      );
   
   integer 		   i;
   initial
     begin
	for (i= 0; i < (1<<ADDR_SIZE)-1-1; i= i+1)
	  reg_array[i]= 0;
     end
   
   always @(posedge clk)
     begin
	if (link)
	  begin
	     reg_array[(1<<ADDR_SIZE)-1-1]<= pc_out;
	  end
	else if (wen)
	  begin
	     reg_array[wa]<= din;
	  end
     end
   /*   
   mx16wp mx(ra,
	     ro0,
	     ro1,
	     ro2,
	     ro3,
	     ro4,
	     ro5,
	     ro6,
	     ro7,
	     ro8,
	     ro9,
	     ro10,
	     ro11,
	     ro12,
	     ro13,
	     ro14,
	     ro15,
	     dout);
   defparam mx.WIDTH=32;
   */
   assign da= reg_array[ra];
   assign db= reg_array[rb];
   assign dd= reg_array[rd];
   assign dt= reg_array[rt];
   assign last= pc_out;
   
endmodule // rfm
