module cpu2
  #(
    parameter WIDTH= 32,
    parameter ADDR_SIZE= 32
    )
  (
   // basic inputs
   input wire 		       clk,
   input wire 		       reset,
   // bus
   output wire [ADDR_SIZE-1:0] mbus_aout,
   input wire [WIDTH-1:0]      mbus_din,
   output wire [WIDTH-1:0]     mbus_dout,
   output wire 		       mbus_wen,
   // test
   input wire [3:0] 	       test_sel,
   output wire [WIDTH-1:0]     test_out,
   input wire [3:0] 	       test_rsel,
   output wire [WIDTH-1:0]     test_reg,
   output wire [2:0] 	       clk_stat
   );

   // phase signals
   wire 		       phf;	// fetch
   wire 		       phe;	// PC increment; execute
   wire 		       phm;	// memory r/w; link
   wire 		       phw;	// writeback
   // output sources
   wire [WIDTH-1:0] 	       alu_res;
   wire 		       c_res;
   wire 		       z_res;
   wire 		       s_res;
   wire 		       v_res;
   wire 		       p_res;
   wire 		       u_res;
   
   // scheduler generates phase signals
   schedm scheduler
     (
      .clk(clk),
      .reset(reset),
      .phf(phf),	// phase 1: FETCH (stores fetched code into IC reg)
      .phe(phe),	// phase 2: EXEC (signals go through ALU)
      .phm(phm),	// phase 3: MEM (LD/ST read/write)
      .phw(phw),	// phase 4: WRITEBACK (store back result to register)
      .clk_stat(clk_stat)
      );

   // FLAG register
   wire 		       flag_c;
   wire 		       flag_s;
   wire 		       flag_z;
   wire 		       flag_v;
   wire 		       flag_p;
   wire 		       flag_u;
   wire 		       flagwb_en;
   assign flagwb_en= ena & inst_op & phw;
   
   defparam reg_flag.WIDTH=6;
   regm reg_flag
     (
      .clk(clk),
      .reset(reset/*1'b0*/),
      .cen(flagwb_en),
      .din ({ u_res, p_res, v_res, z_res, s_res, c_res}),
      .dout({flag_u,flag_p,flag_v,flag_z,flag_s,flag_c})
      );

endmodule // cpu2
