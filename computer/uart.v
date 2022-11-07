module uart
  #(
    parameter WIDTH=32
    )
   (
    input wire clk,
    input wire reset,
    input wire cs,
    input wire wen,
    input wire [3:0] addr,
    input wire [WIDTH-1:0] din,

    output [WIDTH-1:0] dout,

    input wire RxD,
    output wire TxD
    );

   reg [WIDTH-1:0] regs [3:0];
   wire 	regs_wen;
   assign regs_wen= cs & wen & addr[3:2]==2'b11;
   
   initial
     begin
	regs[0]= 0;
	regs[1]= 0;
	regs[2]= 0;
	regs[3]= 0;
     end

   always @(posedge clk, posedge reset)
     begin
	if (reset)
	  begin
	     regs[0]<= 0;
	     regs[1]<= 0;
	     regs[2]<= 0;
	     regs[3]<= 0;
	  end
	else if (regs_wen)
	  begin
	     regs[addr[1:0]]<= din;
	  end
     end

   wire utx_wen;
   assign utx_wen= cs & wen & (addr==3'h0);
   
   uart_tx utx
     (
      .clk (clk),
      .resetn (!reset),
      .uart_txd (TxD),
      .uart_tx_en (utx_wen),
      .uart_tx_data (din[7:0])
      );
   
endmodule // uart
