`timescale 1ns / 1ps


module comptest_n2(
	input wire clk,
	input wire sw0,
	input wire sw1,
	input wire sw2,
	input wire sw3,
	input wire sw4,
	input wire sw5,
	input wire sw6,
	input wire sw7,
	input wire btn0,
	input wire btn1,
	input wire btn2,
	input wire btn3,
	output wire led0,
	output wire led1,
	output wire led2,
	output wire led3,
	output wire led4,
	output wire led5,
	output wire led6,
	output wire led7,
	output wire an0,
	output wire an1,
	output wire an2,
	output wire an3,
	output wire seg0,
	output wire seg1,
	output wire seg2,
	output wire seg3,
	output wire seg4,
	output wire seg5,
	output wire seg6,
	output wire dp,
	
	output wire [7:0] JA,
	output wire [7:0] JB
    );

// CLOCKS
/////////
wire f50MHz;
wire f25MHz;
wire f10MHz;
wire f1MHz;
wire f100kHz;
wire f1kHz;
wire f100Hz, c100Hz;
wire f10Hz;
wire f1Hz;

assign f50MHz= clk;
clk_gen clock_generator
	(
	.f50MHz(clk),
	.f25MHz(f25MHz),
	.f10MHz(f10MHz),
	.f1MHz(f1MHz),
	.f100kHz(f100kHz),
	.f10kHz(f10kHz),
	.f1kHz(f1kHz),
	.f100Hz(f100Hz),
	.f10Hz(f10Hz),
	.f1Hz(f1Hz)
	);
BUFG buf100Hz (.I(f100Hz), .O(c100Hz));


// de-bounce input, drive CTRL register
///////////////////////////////////////
reg B3, B2, B1, B0;
reg [7:0] S;

always @(posedge c100Hz)
	{B3,B2,B1,B0}<= {btn3,btn2,btn1,btn0};
always @(posedge c100Hz)
	S<= {sw7,sw6,sw5,sw4,sw3,sw2,sw1,sw0};
	
reg [7:0] ctrl;

BUFG bufb1 (.I(B1), .O(cB1));

always @(posedge cB1)
	if (B2)
		ctrl<= {sw7,sw6,sw5,sw4,sw3,sw2,sw1,sw0};

initial
	begin
		{B3,B2,B1,B0}= 4'd0;
		S= 0;
		ctrl= 0;
	end
	
	
// Select processor clock
/////////////////////////
wire selected_clk, SYS_CLK, bufed_1MHz;
assign selected_clk=
	(ctrl[2:0]==3'd0)?f10MHz:
	(ctrl[2:0]==3'd1)?f1MHz:
	(ctrl[2:0]==3'd2)?f10kHz:
	(ctrl[2:0]==3'd3)?f1kHz:
	(ctrl[2:0]==3'd4)?f100Hz:
	(ctrl[2:0]==3'd5)?f10Hz:
	(ctrl[2:0]==3'd6)?f25MHz:
	(ctrl[2:0]==3'd7)?B0:
	0;
BUFG clk_bufg(.I(f10MHz), .O(SYS_CLK));
BUFG m1_bufg (.I(f1MHz) , .O(bufed_1MHz));


// Computer
///////////
wire [31:0] ADDR, MDO, MDI, TR, TREG;
wire MWE;
wire [2:0] CLKstat;
wire [31:0] PORTA, PORTB, PORTC, PORTD;
wire [31:0] tmr, ctr;

comp	#(
	.MEM_ADDR_SIZE(12),
	.PROGRAM("../counter.asc")
	)
	computer
	(
	.clk(SYS_CLK),
	.reset(btn1),
	.TRS({sw3,sw2,sw1,sw0}),
	.PORTI({28'd0, B3,B2,B1,B0}),
	.PORTJ({24'd0, S}),
	.clk10m(bufed_f1MHz),
	
	.PORTA(PORTA),
	.PORTB(PORTB),
	.PORTC(PORTC),
	.PORTD(PORTD),
	
	.TR(TR),
	.CLKstat(CLKstat),
	.ADDR(ADDR),
	.MDO(MDO),
	.MDI(MDI),
	.MWE(MWE),
	.TREG(TREG),
	.tmr(tmr),
	.ctr(ctr)
);


// drive 7seg display
/////////////////////
wire [31:0] dd, dhex, dsp;

dword2seg disph_sel (.i(dd), .s(btn3), .dout(dhex));

assign dd=
	({sw7,sw6,sw5,sw4}==4'h0)?PORTA:
	({sw7,sw6,sw5,sw4}==4'h1)?PORTB:
	({sw7,sw6,sw5,sw4}==4'h3)?PORTC:
	({sw7,sw6,sw5,sw4}==4'h4)?PORTD:
	({sw7,sw6,sw5,sw4}==4'h5)?0:
	({sw7,sw6,sw5,sw4}==4'h6)?0:
	({sw7,sw6,sw5,sw4}==4'h7)?tmr:
	({sw7,sw6,sw5,sw4}==4'h8)?ctr:
	({sw7,sw6,sw5,sw4}==4'h9)?TR:
	({sw7,sw6,sw5,sw4}==4'ha)?TREG:
	({sw7,sw6,sw5,sw4}==4'hb)?0:
	({sw7,sw6,sw5,sw4}==4'hc)?0:
	({sw7,sw6,sw5,sw4}==4'hd)?MDI:
	({sw7,sw6,sw5,sw4}==4'he)?MDO:
	({sw7,sw6,sw5,sw4}==4'hf)?ADDR:
	0;
	
assign dsp=
	(ctrl[3])?dd:
	dhex;
	
display disp_drv (.clk(f1MHz),
	.di(dsp),
	.seg({dp,seg6,seg5,seg4,seg3,seg2,seg1,seg0}),
	.an({an3,an2,an1,an0})
);

assign {led7,led6,led5,led4,led3,led2,led1,led0}= 8'd0;

assign JA= {f25MHz,f10MHz,f1MHz,f100Hz,B3,B2,B1,B0};
assign JB= {SYS_CLK, ctrl[7:0]};

endmodule
