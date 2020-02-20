module display
  (
   input wire 	     clk,
   input wire [31:0] di,
   output wire [7:0] seg,
   output wire [3:0] an
   );
   
   parameter PRE=9;
   
   reg [31:0] 	     data;
   reg [1:0] 	     cnt;
   reg [PRE:0] 	     pre_cnt;
   wire [7:0] 	     digit;
   
   initial
     begin
	cnt<= 0;
	pre_cnt<= 0;
     end
   
   always @(posedge clk)
     begin
	pre_cnt<= pre_cnt + 1;
     end
   
   always @(posedge pre_cnt[PRE])
     begin
	cnt<= cnt+1;
	data<= di;
     end
   
   assign digit=
		(cnt==2'd0)?{data[ 7: 0]}:
		(cnt==2'd1)?{data[15: 8]}:
		(cnt==2'd2)?{data[23:16]}:
		(cnt==2'd3)?{data[31:24]}:
		0;      
   
   assign an[0]= ~(cnt == 0);
   assign an[1]= ~(cnt == 1);
   assign an[2]= ~(cnt == 2);
   assign an[3]= ~(cnt == 3);
   
   assign seg= digit;

endmodule // seg7
