module memory_1in_1out //(clk, din, wen, wa, ra, dout/*, rb, db*/);
  #(
    parameter WIDTH	= 8,	// cell size in bits
    parameter ADDR_SIZE	= 10,	// in bits
    parameter CONTENT	= ""	// name of hex file
    )
   (
    input wire 		       clk,
    //input wire 		       reset, 
    input wire [WIDTH-1:0]     din,
    input wire 		       wen,
    input wire [ADDR_SIZE-1:0] ra,
    //input wire [ADDR_SIZE-1:0] wa,
    input wire 		       cs,
    
    output reg [WIDTH-1:0]     dout
    );
   
   reg [WIDTH-1:0] 	      mem_array[0:(1<<ADDR_SIZE)-1];

   integer 		      i;
   initial
     begin
	for (i= 0; i < (1<<ADDR_SIZE); i= i+1)
	  mem_array[i]= 0;
	if (CONTENT != "")
	  $readmemh(CONTENT, mem_array);
	dout= 0;	
     end
  
   always @(posedge clk)
     begin
	if (cs & wen)
	  mem_array[/*wa*/ra]<= din;
     end

   //assign dout= mem_array[ra];
   always @(posedge clk)
     // (cs)
       dout<= mem_array[ra];
   
endmodule // memory_1in_1out
