module computer(clk, reset, test_sel, test_out);
   parameter WIDTH= 32;
   parameter PROGRAM= "";
   
   input wire clk;
   input wire reset;

   // test the CPU
   input wire [3:0] test_sel;
   output wire [WIDTH-1:0] test_out;
   
   // Memory bus
   wire [WIDTH-1:0] bus_data_in;
   wire [WIDTH-1:0] bus_data_out;
   wire [WIDTH-1:0] bus_memory_out;
   wire [WIDTH-1:0] bus_address;
   wire 	    bus_wen;
      
   defparam cpu.WIDTH= WIDTH;
   cpu cpu
     (
      .clk(clk),
      .reset(reset),
      .mbus_aout(bus_address),
      .mbus_din(bus_data_in),
      .mbus_dout(bus_data_out),
      .mbus_wen(bus_wen),
      .test_sel(test_sel),
      .test_out(test_out)
      );

   wire [WIDTH-1:0] mtest;
   
   defparam mem.WIDTH= 32;
   defparam mem.ADDR_SIZE= 14;
   defparam mem.CONTENT= PROGRAM;
   memory_1in_1out mem
     (
      .clk(clk),
      .din(bus_data_out),
      .wen(bus_wen),
      .wa(bus_address[13:0]),
      .ra(bus_address[13:0]),
      .dout(bus_memory_out),
      .rb(14'd100),
      .db(mtest)
      );

   assign bus_data_in= bus_memory_out;
   
endmodule // computer

	   
