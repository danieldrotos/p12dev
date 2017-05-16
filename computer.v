module computer //(clk, reset, test_sel, test_out);
  #(
    parameter WIDTH= 32,
    parameter PROGRAM= ""
    )
   (
    // base signals
    input wire 		    clk,
    input wire 		    reset,
    // ports
    input wire [WIDTH-1:0]  porti,
    input wire [WIDTH-1:0]  portj,
    output wire [WIDTH-1:0] porta,
    output wire [WIDTH-1:0] portb,
    output wire [WIDTH-1:0] portc,
    output wire [WIDTH-1:0] portd,
    
    // test the CPU
    input wire [3:0] 	    test_sel,
    output wire [WIDTH-1:0] test_out
    );
   
   // Memory bus
   wire [WIDTH-1:0] 	    bus_data_in;
   wire [WIDTH-1:0] 	    bus_data_out;
   wire [WIDTH-1:0] 	    bus_memory_out;
   wire [WIDTH-1:0] 	    bus_porti_out;
   wire [WIDTH-1:0] 	    bus_portj_out;
   wire [WIDTH-1:0] 	    bus_portabcd_out;
   wire [WIDTH-1:0] 	    bus_address;
   wire 		    bus_wen;
      
   //defparam cpu.WIDTH= WIDTH;
   cpu #(.WIDTH(WIDTH)) cpu
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

   wire [15:0] 		    chip_selects;
   decoder #(.ADDR_SIZE(4)) addr_decoder
     (
      .addr(bus_address[15:12]),
      .sel(chip_selects)
      );
   // select signals for bus slaves
   wire 		    cs_mem;
   wire 		    cs_porti;
   wire 		    cs_portj;
   wire 		    cs_portabcd;

   assign cs_mem= chip_selects[0];
   assign cs_porti= chip_selects[13];
   assign cs_portj= chip_selects[14];
   assign cs_portabcd= chip_selects[15];
   
   wire [WIDTH-1:0] 	    mtest;
   //defparam mem.WIDTH= 32;
   //defparam mem.ADDR_SIZE= 14;
   //defparam mem.CONTENT= PROGRAM;
   memory_1in_1out
     #(
       .WIDTH(WIDTH),
       .ADDR_SIZE(14),
       .CONTENT(PROGRAM)
       )
   mem
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

   gpio_in #(.WIDTH(WIDTH)) gpio_ini
     (
      .clk(clk),
      .cs(cs_porti),
      .wen(bus_wen),
      .din(bus_data_out),
      .dout(bus_porti_out),
      .io_in(porti)
      );
   
   gpio_in #(.WIDTH(WIDTH)) gpio_inj
     (
      .clk(clk),
      .cs(cs_portj),
      .wen(bus_wen),
      .din(bus_data_out),
      .dout(bus_portj_out),
      .io_in(portj)
      );

   gpio_out4 #(.WIDTH(WIDTH)) gpio_out
     (
      .clk(clk),
      .reset(reset),
      .cs(cs_portabcd),
      .wen(bus_wen),
      .addr(bus_address[1:0]),
      .din(bus_data_out),
      .dout(bus_portabcd_out),
      .porta(porta),
      .portb(portb),
      .portc(portc),
      .portd(portd)
      );
   
   assign bus_data_in
     = ( {WIDTH{cs_mem     }} & bus_memory_out   ) |
       ( {WIDTH{cs_porti   }} & bus_porti_out    ) |
       ( {WIDTH{cs_portj   }} & bus_portj_out    ) |
       ( {WIDTH{cs_portabcd}} & bus_portabcd_out )
       ;
   
endmodule // computer

	   
