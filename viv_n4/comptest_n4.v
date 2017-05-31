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


module comptest_n4(
        input wire CLK,
        input wire RESET,
        input wire [15:0] SW,
        output wire [15:0] LEDS,
        output wire [7:0] seg,
        output wire [7:0] an
    );

        wire f10MHz;
        wire f1MHz;
        
        reg [3:0] div10;
        always @(posedge CLK)
        begin
                if (div10==4'd9)
                        div10<= 0;
                else
                        div10<= div10+1;
        end
        assign f10MHz= div10==4'd9;

        reg [3:0] div1;
        always @(posedge f10MHz)
        begin
                if (div1==4'd9)
                        div1<= 0;
                else
                        div1<= div1+1;
        end
        assign f1MHz= div1==4'd9;
                    
        wire [31:0] porta;
        wire [31:0] portb;
        wire [31:0] portc;
        wire [31:0] portd;
        wire [31:0] tmr;
        wire [31:0] ctr;
        wire [31:0] tr;
        wire [31:0] treg;
        wire [31:0] mdi;
        wire [31:0] mdo;
        wire [31:0] addr;
        
        comp
        #(
                .PROGRAM        ("blink_tmr.hex")
        )
        computer
        (
                .CLK            (f10Mhz),
                .RESET          (RESET),
                .clk10m         (f1MHz),
                
                .PORTI          (),
                .PORTJ          (),
                .PORTA          (porta),
                .PORTB          (portb),
                .PORTC          (portc),
                .PORTD          (portd),
                
                .TRS            (),
                .TR             (tr),
                .CLKstat        (),
                
                .ADDR           (addr),
                .MDO            (mdo),
                .MDI            (mdi),
                .MWE            (),
                .TREG           (treg),
                .mem_test       (1'b0),
                .tmr            (tmr),
                .ctr            (ctr)
        );
        
        wire [31:0] display_data;
        wire [3:0] display_sel;
        assign display_sel= SW[7:4];
        assign display_data=    (display_sel==4'h0)?porta:
                                (display_sel==4'h1)?portb:
                                (display_sel==4'h2)?portc:
                                (display_sel==4'h3)?portd:
                                (display_sel==4'h6)?tmr:
                                (display_sel==4'h7)?ctr:
                                (display_sel==4'h8)?tr:
                                (display_sel==4'h9)?treg:
                                (display_sel==4'hd)?mdi:
                                (display_sel==4'he)?mdo:
                                (display_sel==4'hf)?addr:
                                32'd0;
                                
        seg7 seg7drv
        (
                .clk            (CLK),
                .di             (display_data),
                .seg            (seg),
                .an             (an)
        );
        
endmodule
