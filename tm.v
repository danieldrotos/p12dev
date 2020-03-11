`unconnected_drive pull0
`ifndef PRG
 `define PRG "counter.asc"
`endif

module tm
  (
    input wire i, output wire o);
   reg 	       clk= 0;
   reg 	       ioclk= 0;
   reg 	       reset= 0;
   reg [3:0]   test_sel= 4'd0;
   reg [31:0]  btn= 0;
   
   wire [31:0] tout;
   
   always #1 clk= !clk;
   always #20 ioclk= ~ioclk;
   
   comp
     #(
       .WIDTH(32),
       .MEM_ADDR_SIZE(12),
       .PROGRAM( `PRG )
       )
   comp
     (
      .clk(clk),
      .reset(reset),
      .PORTI(btn),
      .TRS/*test_sel*/(test_sel),
      .TR/*test_out*/(tout),
    .clk10m(ioclk)
      );

   
   initial
     begin
	$dumpfile("tm.vcd");
	$dumpvars;
	test_sel= 4'd14;
	#2 reset= 1;
	#10 reset= 0;
	#100 btn= 32'd4;
	#100 btn= 32'd0;
	#100 btn= 32'd4;
	#100 btn= 32'd0;
	#10000 $finish;
     end
   
endmodule // tm
