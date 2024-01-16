module getb_putb
  #(
    parameter WIDTH= 32
    )
   (
    input wire [WIDTH-1:0]  opd,
    input wire [WIDTH-1:0]  opa,
    input wire [WIDTH-1:0]  opb,
    input wire [WIDTH-1:0]  ic,
    output wire [WIDTH-1:0] res
    );

   wire [1:0]		    byte_idx= ic[15] ? ic[1:0] : opa[1:0];

   wire [7:0]		    g_byte;
   assign g_byte= (byte_idx==2'b00)?opb[7:0]:
		  (byte_idx==2'b01)?opb[15:8]:
		  (byte_idx==2'b10)?opb[23:16]:
		  (byte_idx==2'b11)?opb[31:24]:
		  7'b0;
   wire [WIDTH-1:0]	    g_res;
   assign g_res= {24'b0, g_byte};
   
endmodule // getb_putb
