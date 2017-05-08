module computer(clk, reset);
   parameter WIDTH= 32;
   parameter PROGRAM= "";
   
   input wire clk;
   input wire reset;
   
   cpu cpu
     (
      .clk(clk),
      .reset(reset)
      );
   defparam cpu.WIDTH= WIDTH;

   memory_1in_1out mem(.clk(clk));
   defparam mem.WIDTH= 32;
   parameter ADDR_SIZE= 14;
   parameter CONTENT= PROGRAM;
   
endmodule // computer

	   
