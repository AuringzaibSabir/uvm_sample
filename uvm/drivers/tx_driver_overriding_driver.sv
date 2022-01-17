// Driver recieves the transacions from the sequencers(through TLM connections- Transaction level modeling) then the driver sends a transactions to DUT via interfaces.

// Note that tx_driver_overriding_driver is extended from uvm_driver base class
// uvm_driver is define in uvm_pkg
// UVM components are permanent because they are never destroyed, they are created at the start of simulation and exist for the entire simulation
// Whereas stimulus are temporary because thousands of transactions are created and destroyed during simulation
// Componets are hierarical i.e. they have fixed location in topology.
// Transactions do not have fixed location because transaction move throught the components.

// driver is parameterize class, as shown here the tx_driver_overriding_driver only send tx_item transaction (driver is a uvm component)
class tx_driver_overriding_driver extends tx_driver;
  // For all uvm_component we have to register them with uvm factory using uvm macro (`uvm_component_utils)
	// Pass the class name to it
  `uvm_component_utils(tx_driver_overriding_driver)

  // Declaring a virtual interface which connects DUT and testbench. Virtual interfaces. In system verilog virtual means something is a reference to something else
  //virtual test_ifc vif;

  /*
	Then declare tx_driver_overriding_driver class constructor
	Since a class object has to be constructed before it exit in a memory
	The creation of class hierarchy in a system verilog testbench has to be initiated from a top module.
	Since a module(top module) is static object that is present at beginning of simulation 
	*/
	// Component Constructor have two arguments to specify the name and handle of the parent of this component in testbench topology
	function new(string name, uvm_component parent);
    super.new(name, parent);
	endfunction // new

  // Typically the driver recieves and sends the transaction in the run_phase in a forever loop
  // Run phase fetch items and drives
  // Connected to sequncer through TLM ports, just for understand consider TLM similar to mail box
  // Note: In a testbench the DUT limits how fast the stimulus can be applied to DUT, since the driver is connected to DUT it can accept a new transaction when DUT is ready
  virtual task run_phase(uvm_phase phase);
    tx_item tx;
    forever begin
    	// Use to get the next item
    	seq_item_port.get_next_item (tx);
    	transfer(tx);       // The driver calls methods in a virtul interface - This transfer is just an exmaple to print the transaction
    	// Calling a transfer method in vif (virtual interface) to send data to the DUT
    	//vif.transfer(tx);
    	// indicates item done
    	seq_item_port.item_done();
    end
  endtask 
  
  // Function to print the transaction recieved in run phase
  virtual task transfer(tx_item tr);
    `uvm_info("TRANSFER", $sformatf("tr.data=%0d", tr.data), UVM_LOW);
  endtask 

endclass