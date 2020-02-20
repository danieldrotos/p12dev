module bin2seg
  (
   input wire [3:0] di,
   output wire [7:0] seg
   );
   
   parameter A      = 8'b0000_0001;
   parameter B      = 8'b0000_0010;
   parameter C      = 8'b0000_0100;
   parameter D      = 8'b0000_1000;
   parameter E      = 8'b0001_0000;
   parameter F      = 8'b0010_0000;
   parameter G      = 8'b0100_0000;

   wire [3:0] 	     digit= di;

   
   assign seg = ~(
		  (digit[3:0] == 4'h0) ? A|B|C|D|E|F :
		  (digit[3:0] == 4'h1) ? B|C :
		  (digit[3:0] == 4'h2) ? A|B|G|E|D :
		  (digit[3:0] == 4'h3) ? A|B|C|D|G :
		  
		  (digit[3:0] == 4'h4) ? F|B|G|C :
		  (digit[3:0] == 4'h5) ? A|F|G|C|D : 
		  (digit[3:0] == 4'h6) ? A|F|G|C|D|E :
		  (digit[3:0] == 4'h7) ? A|B|C :
		  
		  (digit[3:0] == 4'h8) ? A|B|C|D|E|F|G :
		  (digit[3:0] == 4'h9) ? A|B|C|D|F|G :
		  (digit[3:0] == 4'ha) ? A|F|B|G|E|C :
		  (digit[3:0] == 4'hb) ? F|G|C|D|E :
		  
		  (digit[3:0] == 4'hc) ? G|E|D :
		  (digit[3:0] == 4'hd) ? B|C|G|E|D :
		  (digit[3:0] == 4'he) ? A|F|G|E|D :
		  (digit[3:0] == 4'hf) ? A|F|G|E :
		  8'b0000_0000
		  );
   
endmodule
