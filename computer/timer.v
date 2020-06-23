module drs
  (
   input wire c,
   input wire d,
   input wire s,
   input wire r,
   output reg q
   );

   always @(posedge c, posedge s, posedge r)
     begin
	if (s)
	  q<= 1;
	else if (r)
	  q<= 0;
	else
	  q<= d;
     end
   
endmodule // drs

module dli
  (
   input wire c,
   input wire d,
   input wire l,
   input wire di,
   output wire q
   );

   drs ff
     (
      .c(c),
      .d(d),
      .s(l & di),
      .r(l & !di),
      .q(q)
      );
   
endmodule // dli

module rl
  #(
    parameter WIDTH=32
    )
  (
   input wire 		   c,
   input wire [WIDTH-1:0]  d,
   input wire 		   l,
   input wire [WIDTH-1:0]  di,
   output wire [WIDTH-1:0] q
   );

   dli ff[WIDTH-1:0](.c(c), .d(d), .l(l), .di(di), .q(q));

endmodule // rl

module timer
  #(
    parameter WIDTH= 32,
    parameter REG_CTRL= 3'd0,
    //parameter REG_PSCR= 3'd1,
    parameter REG_AR  = 3'd1,
    parameter REG_CNTR= 3'd2,
    parameter REG_STAT= 3'd3
    )
   (
    input wire 		    reset,
    input wire 		    clk,
    input wire [WIDTH-1:0]  din,
    input wire 		    cs,
    input wire [2:0] 	    addr,
    input wire 		    wen,
    input wire 		    io_clk,
    output wire [WIDTH-1:0] dout,
    output wire 	    irq,
    output wire [WIDTH-1:0] tmr,
    output wire [WIDTH-1:0] ctr,
    output wire [WIDTH-1:0] arr,
    output wire 	    ar_reached
    );

   reg [WIDTH-1:0] 	    control;
   //reg [WIDTH-1:0] 	    prescaler;
   reg [WIDTH-1:0] 	    ar;
   //reg [WIDTH-1:0] 	    counter;
   //reg 		    ovf;
   
   reg [WIDTH-1:0] 	    obuf;

   wire [WIDTH-1:0] 	    qcnt;
   wire [WIDTH-1:0] 	    qnxt;
   wire [WIDTH-1:0] 	    dcnt;
   wire 		    cntl;
   wire 		    eq_ar;
   
   assign eq_ar= qcnt==ar;
   
   assign qnxt
     =
      (control[0])?
      (eq_ar?0:qcnt+1):
      (qcnt);
   
   assign dcnt= reset?0:din;
   
   assign cntl= reset | (wen & cs & (addr==REG_CNTR));
   
   rl
     #(
       .WIDTH(WIDTH)
       )
   cnt
     (
      .c(io_clk),
      .d(qnxt),
      .l(cntl),
      .di(dcnt),
      .q(qcnt)
      );

   wire [WIDTH-1:0] 	    counter;
   assign counter= qcnt;
   
   always @(posedge clk, posedge reset)
     begin
	if (reset)
	  begin
	     //prescaler<= 0;
	     control<= 0;
	     ar<= 0;
	  end
	else if (cs)
	  begin
	     if (wen)
	       begin
		  case (addr)
		    REG_CTRL: control<= din;
		    //REG_PSCR: prescaler<= din;
		    REG_AR  : ar<= din;
		  endcase
	       end
	     else //if (cs & ~wen)
	       begin
		  obuf<= (addr==REG_CTRL)?control:
			 //(addr==REG_PSCR)?prescaler:
			 (addr==REG_AR  )?ar:
			 (addr==REG_CNTR)?counter:
			 (addr==REG_STAT)?{{(WIDTH-2){1'b0}},ovf,control[0]}:
			 counter;
	       end // else: !if(wen)
	  end
     end
   
   //wire ar_reached;
   wire ovf_clr;
   assign ar_reached= (counter == ar);
   assign ovf_clr= reset | (cs & wen & (addr==REG_STAT) & din[1]);
   
   drs ovff
     (
      .c(1'b0),
      .d(1'b0),
      .q(ovf),
      .s(ar_reached),
      .r(ovf_clr)
      );
   
   //always @(posedge /*dclk*/io_clk, posedge ovf_clr)
     //begin
//	if (ovf_clr)
//	  ovf<= 0;
//	else
//	  ovf<= ovf | (ar_reached & control[0]);
  //   end

   wire cntr_load;
   assign cntr_load= wen & cs & (addr==REG_CNTR);
   wire [WIDTH-1:0] cnext;
   assign cnext= (control[0])?counter+1:
                 counter;

   /*
   always @(posedge cntr_load, posedge io_clk, posedge reset)
     begin
	if (reset)
	  counter<= 0;
	else if (cntr_load)
	  begin
	     //if (wen & cs & (addr==REG_CNTR))
	       counter<= din;
	  end
	else if (io_clk) 
	  begin
	     //if (control[0])
	       //begin
		  if (counter == ar)
		    counter<= 0;
		  else
		    counter<= cnext;//counter+1;
	       //end
	  end
     end
   */
   
   assign dout= obuf;
   assign irq= ovf & control[1];
   assign tmr= counter;
   assign ctr= control;
   assign arr= ar;
   
endmodule // timer
