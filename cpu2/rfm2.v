module rfm2
  #(
    parameter WIDTH=32
    )
   (
    input wire 		    clk,
    input wire 		    reset,
    input wire [3:0] 	    ra,
    input wire [3:0] 	    rb,
    input wire [3:0] 	    rd,
    input wire [3:0] 	    rt,
    input wire 		    fn_inc_pc,
    input wire 		    fn_link,
    input wire 		    fn_ra_change,
    input wire 		    fn_wb,
    input wire [WIDTH-1:0]  wb_data,
    input wire [WIDTH-1:0]  ra_changed,
    output wire [WIDTH-1:0] da,
    output wire [WIDTH-1:0] db,
    output wire [WIDTH-1:0] dd,
    output wire [WIDTH-1:0] dt
    );

   wire [WIDTH-1:0] 	    r0out;
   reg2in #(.WIDTH(WIDTH)) r0
     (
      .clk(clk),
      .reset(reset),
      .wen1(rd==0 & fn_wb),
      .wen2(ra==0 & fn_ra_change),
      .din1(wb_data),
      .din2(ra_changed),
      .dout(r0out)
      );
   
endmodule // rfm2
