package base_test_pkg;
  // timeunit 1ns; timeprecision 1ns;

	import uvm_pkg::*;         // To bring uvm base library, from which we extend all the testbench components
	`include "uvm_macros.svh"  // To make use of macros that are found in uvm libraries
  
  // The uvm test is made of many classes a good way to organize these classes is to put each class in a seperate file with a class name and extension 
  // of .svh. Then create system verilog packages that include related classes
  // For example package with AXI protocol components and an other package with USB protocol components
  // Now if we want to add USB protocol to the testbench we just import the package with usb componets in the top module.  

  // include uvm objects that are involved in the test
  `include "./seq_items/tx_item.sv"

  `include "./config/tx_agent_config.sv"
  `include "./config/env_config.sv"

  `include "./sequences/tx_sequence.sv"
  `include "./sequencers/tx_sequencer.sv"
  `include "./sequences/tx_v_seq.sv"

  `include "./monitors/tx_monitor.sv"
  
  `include "./drivers/tx_driver.sv"
  `include "./drivers/tx_driver_overriding_driver.sv"
  
  `include "./agents/tx_agent.sv"
  
  `include "./env/tx_env.sv"
  
  `include "./tests/tx_test.sv"
  
  // Any further test
endpackage // base_test_pkg