

// monitor is parameterize class, as shown here the tx_monitor get and send trasaction of tx_item transaction (monitor is a uvm component)
class tx_monitor extends uvm_monitor;
	// For all uvm_component we have to register them with uvm factory using uvm macro (`uvm_component_utils)
	// Pass the class name to it
  `uvm_component_utils(tx_monitor)

  /*
	Then declare tx_monitor class constructor
	Since a class object has to be constructed before it exit in a memory
	The creation of class hierarchy in a system verilog testbench has to be initiated from a top module.
	Since a module(top module) is static object that is present at beginning of simulation 
	*/
	// Component Constructor have two arguments to specify the name and handle of the parent of this component in testbench topology
	function new(string name, uvm_component parent);
    super.new(name, parent);
	endfunction // new
  
  // Declaring a virtual interface which connects DUT and testbench. Virtual interfaces in system verilog virtual means something is a reference to something else
  virtual test_ifc vif;
  tx_agent_config tx_agent_config_h;         // Declaration of agent configuraton object
  // Note tx_agent_config object with virtual interface is present(set) in uvm_config_db

  function void build_phase(uvm_phase phase);
  	if(!uvm_config_db#(tx_agent_config)::get(this/*Handle to this component*/, ""/*an empty instance name*/, "tx_agent_config_h"/*Name of the object in db*/, tx_agent_config_h/*Handle that the db writes to*/))
      `uvm_fatal("TX_MONITOR::NO VIF",$sformatf("No virtual interface in db"))
    // Now you can read the values from config object
    vif = tx_agent_config_h.vif;
    // Display the base address from config object
    `uvm_info(get_type_name(), $sformatf("config base adddress = %0x", tx_agent_config_h.base_address), UVM_LOW)
  endfunction : build_phase

endclass