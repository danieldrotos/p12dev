`timescale 1ns / 1ps

module mem(A, 
           CLK, 
           CS, 
           I, 
           WR, 
           CSO, 
           O);

    input [31:0] A;
    input CLK;
    input CS;
    input [31:0] I;
    input WR;
   output CSO;
   output [31:0] O;
   
   wire H;
   wire L;
   
   RAMB16_S36 #( 
      .INIT(36'h000000000), 
// //; SYMBOLS
// //; 0000c000 timer_ctrl
// //; 0000c001 timer_ar
// //; 0000c002 timer_cntr
// //; 0000c003 timer_stat
// //; 0000f000 display
// //; 0000f001 led
// //; 0000000e cyc
// //; CODE
// 0400c003 //;0000 ldl0	r0,timer_stat
// 0410f001 //;0001 ldl0	r1,led
// 04200002 //;0002 ldl0	r2,0x0002	
// 0430c002 //;0003 ldl0	r3,timer_cntr
// 0440f000 //;0004 ldl0	r4,display
// 0450c000 //;0005 ldl0	r5,timer_ctrl
// 04800000 //;0006 ldl0	r8,0		
// 02810000 //;0007 st	r8,r1
      .INIT_00(256'h02810000_04800000_0450c000_0440f000_0430c002_04200002_0410f001_0400c003),
// 0580a120 //;0008 ldl	r8,500000	
// 06800007 //;0009 ldh	r8,500000
// 0490c001 //;000a ldl0	r9,timer_ar
// 02890000 //;000b st	r8,r9
// 04a00003 //;000c ldl0	r10,3
// 04b00000 //;000d ldl0	r11,0
// 07bb0200 //;000e inc	r11
// 03cb0000 //;000f mov	r12,r11
      .INIT_01(256'h03cb0000_07bb0200_04b00000_04a00003_02890000_0490c001_06800007_0580a120),
// 07cca380 //;0010 or	r12,r12,r10
// 02c50000 //;0011 st	r12,r5
// 01830000 //;0012 ld	r8,r3		
// 02840000 //;0013 st	r8,r4		
// 01800000 //;0014 ld	r8,r0		
// 07882300 //;0015 and	r8,r8,r2	
// b4f0000e //;0016 jz	cyc
// 02800000 //;0017 st	r8,r0		
      .INIT_02(256'h02800000_b4f0000e_07882300_01800000_02840000_01830000_02c50000_07cca380),
// 01810000 //;0018 ld	r8,r1		
// 049000ff //;0019 ldl0	r9,0xff		
// 07889400 //;001a xor	r8,r8,r9
// 02810000 //;001b st	r8,r1		
// 04f0000e //;001c jmp	cyc
      .INIT_03(256'h00000000_00000000_00000000_04f0000e_02810000_07889400_049000ff_01810000),
      .INIT_04(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_05(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_06(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_07(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_08(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_09(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_0A(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_0B(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_0C(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_0D(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_0E(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_0F(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_10(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_11(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_12(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_13(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_14(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_15(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_16(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_17(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_18(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_19(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_1A(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_1B(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_1C(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_1D(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_1E(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_1F(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_20(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_21(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_22(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_23(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_24(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_25(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_26(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_27(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_28(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_29(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_2A(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_2B(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_2C(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_2D(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_2E(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_2F(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_30(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_31(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_32(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_33(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_34(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_35(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_36(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_37(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_38(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_39(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_3A(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_3B(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_3C(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_3D(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_3E(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
      .INIT_3F(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),

      .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000), 
      .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000), 
      .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000), 
      .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000), 
      .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000), 
      .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000), 
      .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000), 
      .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000), 
      .SRVAL(36'h000000000), .WRITE_MODE("WRITE_FIRST") ) RAM_L 
      (.ADDR(A[8:0]), 
                  .CLK(CLK), 
                  .DI(I[31:0]), 
                  .DIP({4'd0/*L, L, L, L*/}), 
                  .EN(CS), 
                  .SSR(1'b0/*L*/), 
                  .WE(WR), 
                  .DO(O[31:0]), 
                  .DOP());
   //GND  XLXI_7 (.G(L));
   //VCC  XLXI_9 (.P(H));
   //BUF  XLXI_10 (.I(CS), 
   //             .O(CSO));
endmodule