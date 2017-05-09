module cpu(clk, reset,
	   mbus_aout, mbus_din, mbus_dout, mbus_wen,
	   test_sel, test_out);
   parameter WIDTH= 32;
   parameter ADDR_SIZE= 32;

   // basic inputs
   input wire clk;
   input wire reset;

   // bus
   input wire [WIDTH-1:0] mbus_din;
   output wire [ADDR_SIZE-1:0] mbus_aout;
   output wire [WIDTH-1:0]     mbus_dout;
   output wire 		       mbus_wen;

   // test
   input wire [3:0] 	       test_sel;
   output wire [WIDTH-1:0]     test_out;

   // internal signals
   wire [WIDTH-1:0] 	       ic;	// output of IC register
   wire [WIDTH-1:0] 	       pc;	// output of PC register 
   // phase signals
   wire 		       phf;	// fetch
   wire 		       phe;	// PC increment; execute
   wire 		       phm;	// memory r/w; link
   wire 		       phw;	// writeback
   // selected data as parameteres
   wire [WIDTH-1:0] 	       opa;
   wire [WIDTH-1:0] 	       opb;
   wire [WIDTH-1:0] 	       opd;
   // output sources
   wire [WIDTH-1:0] 	       alu_res;
   wire 		       c_res;
   wire 		       z_res;
   wire 		       s_res;
   wire 		       v_res;
   // selected data to use in writeback
   wire [3:0] 		       wb_address;
   wire [WIDTH-1:0] 	       wb_data;	// writeback data
   // decoded instructions
   wire 		       inst_call;
   wire 		       inst_nop;
   wire 		       inst_ld;
   wire 		       inst_st;
   wire 		       inst_mov;
   wire 		       inst_ldl0;
   wire 		       inst_ldl;
   wire 		       inst_ldh;
   wire 		       inst_op;
   // some parts of IC
   wire [3:0] 		       ra;
   wire [3:0] 		       rb;
   wire [3:0] 		       rd;
   wire [4:0] 		       op_code;
   
   // scheduler generates phase signals
   schedm scheduler
     (
      .clk(clk),
      .reset(reset),
      .phf(phf),	// phase 1: FETCH (stores fetched code into IC reg)
      .phe(phe),	// phase 2: EXEC (signals go through ALU)
      .phm(phm),	// phase 3: MEM (LD/ST read/write)
      .phw(phw),	// phase 4: WRITEBACK (store back result to register)
      .clk_stat()
      );
   
   // FLAG register
   wire 		       flag_c;
   wire 		       flag_s;
   wire 		       flag_z;
   wire 		       flag_v;
   defparam reg_flag.WIDTH=4;
   regm reg_flag
     (
      .clk(clk),
      .reset(1'b0),
      .cen(inst_op & phw),
      .din ({v_res ,z_res ,s_res ,c_res }),
      .dout({flag_v,flag_z,flag_s,flag_c})
      );
   
   // Instruction Register contains instruction code
   defparam reg_ic.WIDTH= WIDTH;
   regm reg_ic
     (
      .clk(clk),
      .reset(reset),
      .cen(phf), // phe?
      .din(mbus_din),
      .dout(ic)
      );

   // pick parts of IC
   assign ra= ic[19:16];
   assign rb= ic[15:12];
   assign rd= ic[23:20];
   assign op_code= ic[11:7];
   
   // decode instructions
   assign inst_call= ic[27];
   assign inst_nop = ~inst_call & (ic[26:24]==3'd0);
   assign inst_ld  = ~inst_call & (ic[26:24]==3'd1);
   assign inst_st  = ~inst_call & (ic[26:24]==3'd2);
   assign inst_mov = ~inst_call & (ic[26:24]==3'd3);
   assign inst_ldl0= ~inst_call & (ic[26:24]==3'd4);
   assign inst_ldl = ~inst_call & (ic[26:24]==3'd5);
   assign inst_ldh = ~inst_call & (ic[26:24]==3'd6);
   assign inst_op  = ~inst_call & (ic[26:24]==3'd7);
   
   // ALU
   defparam alu.WIDTH= WIDTH;
   alu alu
     (
      .op(op_code),
      .ci(flag_c),
      .zi(flag_z),
      .si(flag_s),
      .vi(flag_v),
      .ai(opa),
      .bi(opb),
      .res(alu_res),
      .co(c_res),
      .vo(v_res),
      .zo(z_res),
      .so(s_res)
      );

   // select data for writeback
   assign wb_data= inst_call?{5'd0,ic[26:0]}:
		   inst_nop?32'd0:
		   inst_ld?mbus_din:
		   inst_st?32'd0:
		   inst_mov?opa:
		   inst_ldl0?{16'b0,ic[15:0]}:
		   inst_ldl?{opd[31:16],ic[15:0]}:
		   inst_ldh?{ic[31:16],opd[15:0]}:
		   inst_op?alu_res:
		   32'd0;
   assign wb_address= inst_call?4'd15:
		      rd;
   
   // Register file: R0..R15 (R14=Link,R15=PC)
   defparam regs.WIDTH= WIDTH;
   defparam regs.ADDR_SIZE= 4;
   rfm regs
     (
      .clk(clk),
      .reset(reset),
      .cen(phe),	// phf? Increment of R15 (PC)
      .wen(phw),	// Writeback: puts din to R[wr]
      .link(1'b0),	// link: writes R15 into R14
      .wa(wb_address),	// Rd part of code
      .din(wb_data),
      .ra(ra),		// Ra part of code
      .da(opa),		// value of Ra
      .rb(rb),		// Rb part of code
      .db(opb),		// value of Rb
      .rd(rd),		// Rd part of code
      .dd(opd),		// value of Rd
      .rt(),
      .dt(),
      .last(pc)
      );

   // memory interface
   assign mbus_dout= opd;
   assign mbus_aout= ((phm & inst_st) | ( inst_ld & (phm | phw)))?opa:pc;
   
endmodule // cpu
