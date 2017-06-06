module tm_clk_gen;
   reg clk= 0;

   always #1 clk= ~clk;

   wire c10MHz;
   wire c1MHz, t1MHz;
   
   clk_gen c
     (
      .f100MHz(clk),
      .f10MHz(c10MHz),
      .f1MHz(c1MHz)
      );

   div10 d(.i(c10MHz), .o(t1MHz));
   
   initial
     begin
	$dumpfile("tm_clk_gen.vcd");
	$dumpvars;
	#10000 $finish;
     end
   
endmodule // tm_clk_gen
