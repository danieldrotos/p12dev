module addrdec2
  #(
    parameter MEM_ADDR_SIZE= 32
    )
   (
    input wire [MEM_ADDR_SIZE-1:0] addr,
    output wire 		   cs_mem,
    output wire [15:0] 		   cs_io,
    output wire 		   cs_simif
    );

   wire [15:0] 			   chip_selects;
   wire 			   top_256;
	
   decoder_en #(.ADDR_SIZE(4)) addr_decoder
     (
      .en(top_256),
      .addr(addr[7:4]),
      .sel(chip_selects)
      );

   wire 			   addr_64k;
   assign addr_64k= (addr[MEM_ADDR_SIZE-1:16] == 0);

   assign top_256= addr_64k & (addr[15:8] == 8'hff);
   
   assign cs_simif= top_256 & (addr[7:0]==8'hff);

   assign cs_io[14:0]= chip_selects[14:0];
   assign cs_io[15]= chip_selects[15] & !cs_simif;

   assign cs_mem= !top_256;
   
endmodule // addrdec1
