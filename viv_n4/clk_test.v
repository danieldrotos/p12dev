`timescale 1ns / 1ps

`include "defs.v"

`define PRG "progs2/uart.asc"

module clk_test
  (
   input wire 	      CLK,
   input wire 	      RESET,
   input wire [15:0]  SW,
   input wire 	      BTNC,
   input wire 	      BTNU,
   input wire 	      BTND,
   input wire 	      BTNL,
   input wire 	      BTNR,
   output wire [15:0] LEDS,
   output wire [7:0]  seg,
   output wire [7:0]  an,
   
   output wire [4:1] JCa,
   output wire [10:7] JCb,
   output wire [4:1] JDa,
   output wire [10:7] JDb,
   
   input wire UART_TXD_IN,
   output wire UART_RXD_OUT
   );
   
   wire 	      res;

   wire 	      f100MHz;
   //wire 	      f50MHz;
   //wire 	      f25MHz;
   //wire 	      f20MHz;
   wire 	      f10MHz;
   wire 	      f1MHz;
   wire 	      f100kHz;
   //wire 	      f10kHz;
   //wire 	      f1kHz;
   //wire 	      f100Hz;
   //wire 	      f10Hz;
   //wire 	      f1Hz;
   
   assign f100MHz= CLK;
   d10 i100_10 (.i(f100MHz), .o(f10MHz));
   d10 i10_1   (.i(f10MHz),  .o(f1MHz));
   d10 i4      (.i(f1MHz),   .o(f100kHz));
   
assign JCa[1]= f100MHz;
//assign JCa[2]= f50MHz;
//assign JCa[3]= f25MHz;
assign JCa[4]= f10MHz;
//assign JCb[7]= f2MHz;
assign JCb[8]= f1MHz;
assign JCb[9]= f100kHz;
//assign JCb[10]=f10kHz;

//assign JDa[1]= f1kHz;
//assign JDa[2]= f100Hz;
//assign JDa[3]= f10Hz;
//assign JDa[4]= f1Hz;

endmodule // comptest_n4
