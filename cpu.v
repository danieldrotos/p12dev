module cpu(clk, reset);
   parameter WIDTH= 32;

   input wire clk;
   input wire reset;

   schedm scheduler(.clk(clk), .reset(reset));

   regm ic(.clk(clk), .reset(reset));
   defparam ic.WIDTH= WIDTH;

   rfm regs(.clk(clk), .reset(reset));
   defparam regs.WIDTH= WIDTH;
   defparam regs.ADDR_SIZE= 4;

   cntreg pc(.clk(clk), .reset(reset));
   defparam pc.WIDTH= WIDTH;

   alu alu();
   defparam alu.WIDTH= WIDTH;
   
endmodule // cpu
