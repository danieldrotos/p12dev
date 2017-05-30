module timer
  #(
    parameter WIDTH= 32,
    parameter REG_CTRL= 3'd0,
    parameter REG_PSCR= 3'd1,
    parameter REG_AR  = 3'd2,
    parameter REG_CNTR= 3'd3,
    parameter REG_STAT= 3'd4
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
    output wire 	    irq
    );

   reg [WIDTH-1:0] 	    control;
   reg [WIDTH-1:0] 	    prescaler;
   reg [WIDTH-1:0] 	    ar;
   reg [WIDTH-1:0] 	    counter;
   reg 			    ovf;
   
   reg [WIDTH-1:0] 	    obuf;

   reg 			    dclk;
   reg [7:0] 		    pre_cnt;

   always @(posedge io_clk)
     begin
	if (control[0])
	  begin
	     pre_cnt<= pre_cnt+1;
	     if (pre_cnt == prescaler)
	       begin
		  pre_cnt<= 0;
		  dclk<= 1;
	       end
	     else
	       dclk<= 0;
	  end // if (control[0])
	else
	  pre_cnt<= 0;
     end

   always @(posedge clk, posedge reset)
     begin
	if (reset)
	  begin
	     prescaler<= 0;
	     control<= 0;
	     ar<= 0;
	  end
	else if (cs)
	  begin
	     if (wen)
	       begin
		  case (addr)
		    REG_CTRL: control<= din;
		    REG_PSCR: prescaler<= din;
		    REG_AR  : ar<= din;
		  endcase
	       end
	     else //if (cs & ~wen)
	       begin
		  obuf<= (addr==REG_CTRL)?control:
			 (addr==REG_PSCR)?prescaler:
			 (addr==REG_AR  )?ar:
			 (addr==REG_CNTR)?counter:
			 (addr==REG_STAT)?{{(WIDTH-2){1'b0}},ovf,control[0]}:
			 counter;
	       end // else: !if(wen)
	  end
     end
   
   wire ar_reached;
   wire ovf_clr;
   assign ar_reached= (counter == ar);
   assign ovf_clr= reset | (cs & wen & (addr==REG_STAT) & din[1]);
      
   always @(posedge dclk, posedge ovf_clr)
     begin
	if (ovf_clr)
	  ovf<= 0;
	else
	  ovf<= ovf | (ar_reached & control[0]);
     end

   wire cntr_load;
   assign cntr_load= wen & cs & (addr==REG_CNTR);
   
   always @(posedge cntr_load, posedge dclk, posedge reset)
     begin
	if (reset)
	  counter<= 0;
	else if (cntr_load)
	  begin
	     //if (wen & cs & (addr==REG_CNTR))
	       counter<= din;
	  end
	else if (dclk) 
	  begin
	     if (control[0])
	       begin
		  if (counter == ar)
		    begin
		       counter<= 0;
		    end
		  else
		    counter<= counter+1;
	       end
	  end
     end
   
   assign dout= obuf;
   assign irq= ovf & control[1];
   
endmodule // timer
