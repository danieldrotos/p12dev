module uart
  #(
    parameter WIDTH=32
    )
   (
    input wire		   clk,
    input wire		   reset,
    input wire		   cs,
    input wire		   wen,
    input wire [3:0]	   addr,
    input wire [WIDTH-1:0] din,

    output [WIDTH-1:0]	   dout,

    input wire		   RxD,
    output wire		   TxD
    );

   // Addresses of registers
   localparam		   REG_DR= 4'd0; // data
   localparam		   REG_CTRL= 4'd1; // Control
   localparam		   REG_RSTAT= 4'd2; // Receive Status
   localparam		   REG_TSTAT= 4'd3; // Transmit Status
   localparam		   REG_CPB= 4'd4; // Cycles per bit
   
   // Bits of RX status register
   localparam		   STAT_RXNE= 0;
   localparam		   STAT_BREAK= 1;
   localparam		   STAT_RXVALID= 2;
   // Bits of TX status register
   localparam		   STAT_TC= 0;
   
   // Bits of control register
   localparam		   CTRL_RX_EN= 0;
   localparam		   CTRL_TX_EN= 1;

   wire			   wr= cs & wen;

   // CONTROL register
   reg [WIDTH-1:0]	   control;
   always @(posedge clk)
     begin
	if (reset) control<= 0;
	else if (wr & (addr==REG_CTRL))
	  control<= din;
     end

   
   // Parameter registers
   reg [WIDTH-1:0] cycles_per_bit= 32'd217; // 25MHz -> 115200 Baud
   always @(posedge clk)
     begin
	if (reset)
	  cycles_per_bit<= 32'd217;
	else
	  if (wr & (addr==REG_CPB))
	    cycles_per_bit<= din;
     end
   
   
   // Storage registers
   reg [WIDTH-1:0] regs [3:0];
   wire		   regs_wen;
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

   localparam FSM_IDLE= 2'b00;
   localparam FSM_GOT= 2'b01;
   localparam FSM_READOUT= 2'b10;
   
   reg [1:0]  rx_fsm= FSM_IDLE;
   wire       rx_readout;
   wire       rx_not_empty;
   assign rx_readout= cs & !wen & (addr==REG_DR); 
   
   always @(posedge clk)
     begin
	if (reset)
	  rx_fsm<= FSM_IDLE;
	else
	  case (rx_fsm)
	    FSM_IDLE   : rx_fsm<= rx_valid   ? FSM_GOT     : FSM_IDLE;
	    FSM_GOT    : rx_fsm<= rx_readout ? FSM_READOUT : FSM_GOT;
	    FSM_READOUT: rx_fsm<= !rx_valid  ? FSM_IDLE    : FSM_READOUT;
	    default    : rx_fsm<= FSM_IDLE;
	  endcase
     end
   assign rx_not_empty= rx_fsm==FSM_GOT;

   wire [WIDTH-1:0] rstat_value;
   wire [WIDTH-1:0] tstat_value;
   assign rstat_value= {29'd0,
			rx_valid,
			rx_break,
			rx_not_empty
			};
   assign tstat_value= {31'd0,
			!tx_busy
			};
   
   // Output data
   assign dout= (addr==REG_DR)?{24'd0,rx_data}:
		(addr==REG_CTRL)?control:
		(addr==REG_RSTAT)?rstat_value:
		(addr==REG_TSTAT)?tstat_value:
		(addr==REG_CPB)?cycles_per_bit:
		(addr[3:2]==2'b11)?regs[addr[1:0]]:
		0;
   
endmodule // uart
