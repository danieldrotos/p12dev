module computer(clk, reset);
   parameter WIDTH= 32;
   parameter PROGRAM= "";
   
   input wire clk;
   input wire reset;

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
      .test_sel(),
      .test_out()
      );

   defparam mem.WIDTH= 32;
   defparam mem.ADDR_SIZE= 14;
   defparam mem.CONTENT= PROGRAM;
   memory_1in_1out mem
     (
      .clk(clk),
      .din(bus_data_out),
      .wen(1'b0/*bus_wen*/),
      .wa(bus_address[13:0]),
      .ra(bus_address[13:0]),
      .dout(bus_memory_out)
      );

   assign bus_data_in= bus_memory_out;
   
endmodule // computer

	   
