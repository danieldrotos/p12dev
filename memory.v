module memory_1in_1out(clk, din, wen, wa, ra, dout/*, rb, db*/);
   parameter WIDTH	= 8;	// cell size in bits
   parameter ADDR_SIZE	= 10;	// in bits
   parameter CONTENT	= "";	// name of hex file
   
   input wire clk;
   input wire [WIDTH-1:0] din;
   input wire 		  wen;
   input wire [ADDR_SIZE-1:0] ra;
   input wire [ADDR_SIZE-1:0] wa;
   
   output wire [WIDTH-1:0]    dout;

   // test
   //input wire [ADDR_SIZE-1:0] rb;
   //output wire [WIDTH-1:0]    db;
   
   reg [WIDTH-1:0] 	      mem_array[(1<<ADDR_SIZE)-1:0];

   //integer 		      i;
   initial
     begin
	//for (i= 0; i < (1<<ADDR_SIZE); i= i+1)
	  //mem_array[i]= 0;
	if (CONTENT != "")
	  $readmemh(CONTENT, mem_array);
     end
  
   always @(posedge clk)
     begin
	if (wen)
	  mem_array[wa]<= din;
     end

   assign dout= mem_array[ra];
   //assign db= mem_array[rb];
   
endmodule // memory_1in_1out
