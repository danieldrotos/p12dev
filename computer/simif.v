module simif
  #(
    parameter WIDTH= 32
    )
   (
    input wire 	       clk,
    input wire 	       reset,
    input wire 	       cs,
    input wire 	       wen,
    input wire [0:0]   addr,
    input [WIDTH-1:0]  din
    );

   reg [7:0] 	       cmd;
   reg [7:0] 	       param;
   reg 		       param_en;

   always @(posedge clk, posedge reset)
     begin
	if (reset)
	  param_en<= 0;
	else if (cs & wen)
	  begin
	     param_en<= !param_en;
	  end
     end

   always @(posedge clk)
     begin
	if (cs & wen & param_en)
	  begin
	     param<= din[7:0];
	     if (cmd==8'h70)
	       begin
`ifdef IVERILOG
		  $write("%c", din[7:0]);
		  $fflush();
`endif
	       end
	  end
     end
   
   always @(posedge clk)
     begin
	if (cs & wen & !param_en)
	  begin
	     cmd<= din[7:0];
	  end
     end
   
   initial
     begin
	param_en= 0;
     end
	
endmodule // simif

     
