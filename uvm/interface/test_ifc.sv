// Interface can be consider a bundle of wires which is used to connect different modules

interface test_ifc (input logic clk); 
	logic [31:0] src   ;
	logic [31:0] dst   ;
	logic [31:0] result;

  //task automatic transfer(tx_item t);
  //endtask // transfer

endinterface : test_ifc