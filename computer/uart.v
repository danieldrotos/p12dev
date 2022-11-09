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

   // Addresses of registers
   localparam REG_DR= 4'd0; // data
   localparam REG_STAT= 4'd1; // Status
   localparam REG_CTRL= 4'd2; // Control
   localparam REG_CPB= 4'd3; // Cycles per bit
   
   // Bits of status register
   localparam STAT_RXNE= 0;
   localparam STAT_TC= 1;
   localparam STAT_BREAK= 2;
   
   // Bits of control register
   localparam CTRL_RX_EN= 0;
   localparam CTRL_TX_EN= 1;

   wire 	wr= cs & wen;

   // CONTROL register
   reg [WIDTH-1:0] control;
   always @(posedge clk)
     begin
	if (reset) control<= 0;
	else if (wr & (addr==REG_CTRL))
	  control<= din;
     end

   
   // Parameter registers
   reg [WIDTH-1:0] cycles_per_bit= 32'd16;
   always @(posedge clk)
     begin
	if (reset)
	   cycles_per_bit<= 32'd16;
	else
	  if (wr & (addr==REG_CPB))
	    cycles_per_bit<= din;
     end
   
   
   // Storage registers
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
   
   always @(posedge clk)
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
   assign utx_wen= control[CTRL_TX_EN]
		   & cs
		   & wen
		   & (addr==REG_DR);
   wire tx_busy;
   
   uart_tx utx
     (
      .clk (clk),
      .resetn (!reset),
      .uart_txd (TxD),
      .uart_tx_busy (tx_busy),
      .uart_tx_en (utx_wen),
      .uart_tx_data (din[7:0]),
      .cycles_per_bit (cycles_per_bit)
      );

   
   wire rx_en;
   wire rx_break;
   wire rx_valid;
   wire [7:0] rx_data;
   assign rx_en= control[CTRL_RX_EN];
   
   uart_rx urx
     (
      .clk (clk),
      .resetn (!reset),
      .uart_rxd (RxD),
      .uart_rx_en (rx_en),
      .uart_rx_break(rx_break),
      .uart_rx_valid(rx_valid),
      .uart_rx_data (rx_data),
      .cycles_per_bit (cycles_per_bit)
      );


   // Output data
   assign dout= (addr==REG_DR)?{24'd0,rx_data}:
		(addr==REG_STAT)?{29'd0,
				  rx_break,
				  !tx_busy,
				  rx_valid
				  }:
		(addr==REG_CTRL)?control:
		(addr==REG_CPB)?cycles_per_bit:
		(addr[3:2]==2'b11)?regs[addr[1:0]]:
		0;
   
endmodule // uart
