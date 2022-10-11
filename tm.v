`include "defs.v"

`unconnected_drive pull0
`ifndef PRG
 `define PRG "counter.asc"
`endif

`ifndef AW
 `define AW 12
`endif

`ifndef INSTS
 `define INSTS 1000
`endif

`ifndef CPU_TYPE
 `define CPU_TYPE 1
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
   
   comp
     #(
       .WIDTH(32),
       .MEM_ADDR_SIZE(`AW),
       .PROGRAM( `PRG ),
       .CPU_TYPE(`CPU_TYPE)
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
      .clk10m(ioclk)
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
       #5000 sw= 1;
    end

   initial
     begin
	#1000 btn= 1;
	#1000 btn= 0;
	#1000 btn= 1;
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
