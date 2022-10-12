module comp //(clk, reset, test_sel, test_out);
  #(
    parameter WIDTH= 32,
    parameter PROGRAM= "",
    parameter MEM_ADDR_SIZE= 12,
    parameter CPU_TYPE= 2
    )
   (
    // base signals
    input wire 		    clk,
    input wire 		    reset,
    // ports
    input wire [WIDTH-1:0]  PORTI,
    input wire [WIDTH-1:0]  PORTJ,
    output wire [WIDTH-1:0] PORTA,
    output wire [WIDTH-1:0] PORTB,
    output wire [WIDTH-1:0] PORTC,
    output wire [WIDTH-1:0] PORTD,
    
    // test the CPU
    input wire [3:0] 	    test_sel,
    output wire [WIDTH-1:0] test_out,
    input wire [3:0] 	    test_rsel,
    output wire [WIDTH-1:0] test_reg,
    output wire [2:0] 	    CLKstat,
    //output wire [WIDTH-1:0] dummy
    output wire [WIDTH-1:0] ADDR,
    output wire [WIDTH-1:0] MDO,
    output wire [WIDTH-1:0] MDI,
    output wire 	    MWE,
    output wire [WIDTH-1:0] tmr,
    output wire [WIDTH-1:0] ctr,
    output wire [WIDTH-1:0] arr,
    output wire 	    ar_reached,
    
    input wire 		    clk10m,
    output wire [31:0] 	    irqs 
    );
  
   // Memory bus
   wire [WIDTH-1:0] 	    bus_data_in;
   wire [WIDTH-1:0] 	    bus_data_out;
   wire [WIDTH-1:0] 	    bus_mem_code_out;
   wire [WIDTH-1:0] 	    bus_mem_data_out;
   wire [WIDTH-1:0] 	    bus_timer_out;
   wire [WIDTH-1:0] 	    bus_porti_out;
   wire [WIDTH-1:0] 	    bus_portj_out;
   wire [WIDTH-1:0] 	    bus_portabcd_out;
   wire [WIDTH-1:0] 	    bus_address;
   wire 		    bus_wen;
      
   wire irq_timer;
   
   generate
      case (CPU_TYPE)
	1: cpu1
	  #(.WIDTH(WIDTH)) cpu
	    (
	     .clk(clk),
	     .reset(reset),
	     .mbus_aout(bus_address),
	     .mbus_din(bus_data_in),
	     .mbus_dout(bus_data_out),
	     .mbus_wen(bus_wen),
	     .test_sel(test_sel),
	     .test_out(test_out),
	     .test_rsel(test_rsel),
	     .test_reg(test_reg),
	     .clk_stat(CLKstat)
	     );
	2: cpu2
	  #(.WIDTH(WIDTH)) cpu
	    (
	     .clk(clk),
	     .reset(reset),
	     .mbus_aout(bus_address),
	     .mbus_din(bus_data_in),
	     .mbus_dout(bus_data_out),
	     .mbus_wen(bus_wen),
	     .test_sel(test_sel),
	     .test_out(test_out),
	     .test_rsel(test_rsel),
	     .test_reg(test_reg),
	     .clk_stat(CLKstat)
	     );
      endcase // case (CPU_TYPE)
   endgenerate
   
   wire [15:0] 		    chip_selects;
	
   decoder #(.ADDR_SIZE(4)) addr_decoder
     (
      .addr(bus_address[15:12]),
      .sel(chip_selects)
      );
		
   // select signals for bus slaves
   wire 		    cs_mem;
   wire 		    cs_timer;
   wire 		    cs_porti;
   wire 		    cs_portj;
   wire 		    cs_portabcd;
   wire 		    cs_simif;
   
   wire addr_64k;
   assign addr_64k= (bus_address[31:16] == 16'd0);

   // 4*4= 16k (max)
   assign cs_mem_code= addr_64k &
		       (chip_selects[0]|
			chip_selects[1]|
			chip_selects[2]|
			chip_selects[3]);
   assign cs_timer= addr_64k & chip_selects[12];
   assign cs_portj= addr_64k & chip_selects[13];
   assign cs_porti= addr_64k & chip_selects[14];
   assign cs_portabcd= addr_64k & chip_selects[15];
   assign cs_simif= addr_64k & (bus_address[15:0]==16'hffff);
   
   memory_1in_1out
     #(
       .WIDTH(WIDTH),
       .ADDR_SIZE(MEM_ADDR_SIZE),
       .CONTENT(PROGRAM)
       )
   mem
     (
      .clk(clk),
      .cs(cs_mem_code),
      .din(bus_data_out),
      .wen(bus_wen),
      .ra(bus_address[MEM_ADDR_SIZE-1:0]),
      .dout(bus_mem_code_out)//,
      );

   timer #(.WIDTH(32)) tmr1
     (
      .clk(clk),
      .reset(reset),
      .din(bus_data_out),
      .wen(bus_wen),
      .cs(cs_timer),
      .addr(bus_address[2:0]),

      .io_clk(clk10m),
      .dout(bus_timer_out),
      .irq(irq_timer),
      .tmr(tmr),
      .ctr(ctr),
      .arr(arr),
      .ar_reached(ar_reached)
      );
   
   gpio_in #(.WIDTH(WIDTH)) gpio_ini
     (
      .clk(clk),
      .cs(cs_porti),
      .wen(bus_wen),
      .din(bus_data_out),
      .dout(bus_porti_out),
      .io_in(PORTI)
      );
   
   gpio_in #(.WIDTH(WIDTH)) gpio_inj
     (
      .clk(clk),
      .cs(cs_portj),
      .wen(bus_wen),
      .din(bus_data_out),
      .dout(bus_portj_out),
      .io_in(PORTJ)
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
      .porta(PORTA),
      .portb(PORTB),
      .portc(PORTC),
      .portd(PORTD)
      );

   // write only, no data out
   simif #(.WIDTH(WIDTH)) sim_interface
     (
      .clk(clk),
      .reset(reset),
      .cs(cs_simif),
      .wen(bus_wen),
      .addr(bus_address[0:0]),
      .din(bus_data_out)
      );

   assign bus_data_in
     = cs_mem_code?bus_mem_code_out:
       cs_timer?bus_timer_out:
       cs_porti?bus_porti_out:
       cs_portj?bus_portj_out:
       cs_portabcd?bus_portabcd_out:
       bus_mem_code_out
       ;
   
   assign ADDR= bus_address;
   assign MDO= bus_data_out;
   assign MDI= bus_data_in;
   assign MWE= bus_wen;
   assign irqs= { 30'd0, irq_timer };
   
endmodule // computer
