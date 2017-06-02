`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2017 02:40:11 PM
// Design Name: 
// Module Name: comptest_n4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module comptest_n4
  (
   input wire 	      CLK,
   input wire 	      RESET,
   input wire [15:0]  SW,
   input wire BTNC,
   input wire BTNU,
   input wire BTND,
   input wire BTNL,
   input wire BTNR,
   output wire [15:0] LEDS,
   output wire [7:0]  seg,
   output wire [7:0]  an
   );
   
   wire res;
   assign res= ~RESET;
   
   wire f100MHz;
   wire f50MHz;
   wire f25MHz;
   wire f20MHz;
   wire f10MHz;
   wire f1MHz;
   wire f100kHz;
   wire f10kHz;
   wire f1kHz;
   wire f100Hz;
   wire f10Hz;
   wire f1Hz;
   
   reg btnc;
   reg btnu;
   reg btnd;
   reg btnl;
   reg btnr;
   reg [15:0] switches;

   assign f100MHz= CLK;
    clk_gen clock_generator
    (
            .f100MHz(f100MHz),
            .f50MHz(f50MHz),
            .f25MHz(f25MHz),
            .f20MHz(f20MHz),
            .f10MHz(f10MHz),
            .f1MHz(f1MHz),
            .f100kHz(f100kHz),
            .f10kHz(f10kHz),
            .f1kHz(f1kHz),
            .f100Hz(f100Hz),
            .f10Hz(f10Hz),
            .f1Hz(f1Hz)
    );
       
       wire selected_clk;
       reg [31:0] clk_test;
       assign selected_clk= (SW[15:12]==4'h0)?f1Hz:
                        (SW[15:12]==4'h1)?f10Hz:
                        (SW[15:12]==4'h2)?f100Hz:
                        (SW[15:12]==4'h3)?f1kHz:
                        (SW[15:12]==4'h4)?f10kHz:
                        (SW[15:12]==4'h5)?f100kHz:
                        (SW[15:12]==4'h6)?f1MHz:
                        (SW[15:12]==4'h7)?f10MHz:
                        (SW[15:12]==4'h8)?f20MHz:
                        (SW[15:12]==4'h9)?f25MHz:
                        (SW[15:12]==4'ha)?f50MHz:
                        (SW[15:12]==4'hb)?f100MHz:
                        btnc;
                        
        always @(posedge selected_clk, posedge res)
          if (res)
            clk_test<= 0;
          else
            clk_test<= clk_test+1;
            
            
       always @(posedge f100Hz)
         begin
           btnc= BTNC;
           btnu= BTNU;
           btnd= BTND;
           btnl= BTNL;
           btnr= BTNR;
           switches= SW;
         end
         
   wire [31:0] porta;
   wire [31:0] portb;
   wire [31:0] portc;
   wire [31:0] portd;
   wire [31:0] tmr;
   wire [31:0] ctr;
   wire [31:0] arr;
   wire        ar_reached;
   wire [31:0] tr;
   wire [31:0] treg;
   wire [31:0] mdi;
   wire [31:0] mdo;
   wire [31:0] addr;
   
   wire [31:0] irqs;
   wire [31:0] porti;
   wire [31:0] portj;
   assign porti= {27'd0, btnl, btnr, btnu, btnd, btnc};
   assign portj= {16'd0, switches};
   comp
     #(
       .PROGRAM        ("blink_tmr.hex")
       )
   computer
     (
      .CLK            (selected_clk),
      .RESET          (res),
      .clk10m         (f1MHz),
      
      .PORTI          (porti),
      .PORTJ          (portj),
      .PORTA          (porta),
      .PORTB          (portb),
      .PORTC          (portc),
      .PORTD          (portd),
      
      .TRS            (switches[3:0]),
      .TR             (tr),
      .CLKstat        (),
      
      .ADDR           (addr),
      .MDO            (mdo),
      .MDI            (mdi),
      .MWE            (),
      .TREG           (treg),
      .mem_test       (1'b0),
      .tmr            (tmr),
      .ctr            (ctr),
      .arr	      (arr),
      .ar_reached     (ar_reached),
      .irqs           (irqs)
      );
   
   wire [31:0] display_data;
   wire [3:0]  display_sel;
   assign display_sel= switches[7:4];
   assign display_data=    (display_sel==4'h0)?porta:
                           (display_sel==4'h1)?portb:
                           (display_sel==4'h2)?portc:
                           (display_sel==4'h3)?portd:
                           (display_sel==4'h4)?clk_test:
                           (display_sel==4'h5)?arr:
                           (display_sel==4'h6)?tmr:
                           (display_sel==4'h7)?ctr:
                           (display_sel==4'h8)?tr:
                           (display_sel==4'h9)?treg:
                           (display_sel==4'ha)?porti:
                           (display_sel==4'hb)?portj:
                           (display_sel==4'hc)?32'd0:
                           (display_sel==4'hd)?mdi:
                           (display_sel==4'he)?mdo:
                           (display_sel==4'hf)?addr:
                           32'd0;
   
   seg7 #(4) seg7drv
     (
      .clk            (f1MHz),
      .di             (display_data),
      .seg            (seg),
      .an             (an)
      );
   
   assign LEDS= //portb[15:0];
   { 12'd0, ar_reached, portb[0], portc[1], portc[0] };
   
endmodule // comptest_n4
