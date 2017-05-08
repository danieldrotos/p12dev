module schedm
  (
   input wire 	     clk,
   input wire 	     reset,

   output wire 	     phf,
   output wire 	     phe,
   output wire 	     phm,
   output wire 	     phwb,

   output wire [2:0] clk_stat
   );
   
   reg 		     ff0, ff1, ff2;

   assign phf= !ff0 & !ff1 & !ff2;
   
   always @(negedge clk, posedge reset)
     begin
	if (reset)
	  begin
	     ff0 <= 0;
	     ff1 <= 0;
	     ff2 <= 0;
	  end
	else
	  begin
	     ff0 <= phf;
	     ff1 <= ff0;
	     ff2 <= ff1;
	  end
     end

   assign phe = ff0;
   assign phm = ff1;
   assign phwb= ff2;

   assign clk_stat[0]= phe | phwb;
   assign clk_stat[1]= phm | phwb;
   assign clk_stat[2]= 1'b0;
   
endmodule // schedm
