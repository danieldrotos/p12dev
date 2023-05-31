`include "defs.v"
`include "hwconf.v"

`unconnected_drive pull0
`ifndef PRG
 `define PRG "counter.asc"
`endif

`ifndef AW
 `define AW 17
`endif

`ifndef INSTS
 `define INSTS 1000
`endif

`ifndef CPU_TYPE
 `define CPU_TYPE 1
`endif

`ifdef IVERILOG
module BUFG
(
 input wire I,
 output wire O
 );
   assign O=I;
endmodule
`endif

module tm
  (
   input wire  i,
   output wire o
   );
   reg 	       clk= 0;
   reg 	       ioclk= 0;
   reg 	       reset= 0;
   reg [3:0]   test_sel;
   reg [3:0]   test_rsel;
   reg [31:0]  btn= 0;
   reg [31:0]  sw= 0;
   wire [31:0] test_out, test_reg;
   wire [31:0] porta, portb, portc, portd;

   // 1 utasitas 8 ciklus ideig tart (4 orajel)
   always #1 clk= !clk;
   always #20 ioclk= ~ioclk;

   reg	       ucs= 0;
   reg	       uwen= 1;
   reg [3:0]   uaddr= 0;
   reg [7:0]   udin= 0;
   wire	       utx;
   uart sender(.clk(clk),.reset(reset),
	       .cs(ucs),
	       .wen(uwen),
	       .addr(uaddr),
	       .din({24'b0,udin}),
	       .RxD(1'b1),
	       .TxD(utx));
   initial
     begin
	#50 udin=3; uaddr=1; ucs=1; #2 ucs=0;
	#5000 udin=8'h41; uaddr=0; ucs=1; #2 ucs=0;
	#4370 udin=8'h62; uaddr=0; ucs=1; #2 ucs=0;
	#4370 udin=8'h49; uaddr=0; ucs=1; #2 ucs=0;
	#4370 udin=8'h70; uaddr=0; ucs=1; #2 ucs=0;
	#4370 udin=8'h42; uaddr=0; ucs=1; #2 ucs=0;
     end
   
   comp
     #(
       .WIDTH(32),
       .MEM_ADDR_SIZE(`AW),
       .PROGRAM( `PRG ),
       .CPU_TYPE(`CPU_TYPE),
       .COMP_TYPE(`COMP_TYPE)
       )
   comp
     (
      .clk(clk),
      .reset(reset),
      .PORTI(btn),
      .PORTJ(sw),
      .PORTA(porta),
      .PORTB(portb),
      .PORTC(portc),
      .PORTD(portd),
      .test_sel(test_sel),
      .test_out(test_out),
      .test_rsel(test_rsel),
      .test_reg(test_reg),
      .clk10m(ioclk),
      .RxD(utx)
      );

   // Test kimenet kivalasztasa
   // RESET jel eloallitasa
   initial
     begin
	test_sel= 4'd3;
	test_rsel= 4'd12;
	reset= 1;
	#10 reset= 0;
     end

   // Gombnyomas szimulalasa
   initial
    begin
       #5000 btn= 1;
       #100 btn= 0;
    end

   /*
   initial
     begin
	#99000 rxd= 0;
	#2000 rxd= 1;
     end
   */
   
   initial
     begin
	#100000 btn= 1;
	#10000 btn= 0;
     end
   
   // Kimeneti file eloallitasa
   // Leallitas INSTS szamu utasitas utan
   initial
     begin
	$dumpfile("tm.vcd");
	$dumpvars;
	#(`INSTS*8 + 14) $finish;
     end
   
endmodule // tm
