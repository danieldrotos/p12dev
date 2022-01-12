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

module tm
  (
   input wire  i,
   output wire o
   );
   reg 	       clk= 0;
   reg 	       ioclk= 0;
   reg 	       reset= 0;
   reg [3:0]   test_sel= 4'd0;
   reg [31:0]  btn= 0;
   reg [31:0]  sw= 0;
   
   wire [31:0] tout;
   wire [31:0] porta, portb, portc, portd;

   // 1 utasitas 8 ciklus ideig tart (4 orajel)
   always #1 clk= !clk;
   always #20 ioclk= ~ioclk;
   
   comp
     #(
       .WIDTH(32),
       .MEM_ADDR_SIZE(`AW),
       .PROGRAM( `PRG )
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
      .TRS/*test_sel*/(test_sel),
      .TR/*test_out*/(tout),
      .clk10m(ioclk)
      );

   // Test kimenet kivalasztasa
   // RESET jel eloallitasa
   initial
     begin
	test_sel= 4'd14;
	#2 reset= 1;
	#10 reset= 0;
     end

   // Gombnyomas szimulalasa
   initial
    begin
       #5000 btn= 1;
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
