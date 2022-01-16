// The creation of class hierarchy in a system verilog testbench has to be initiated from a top module.
// Since a module is static object that is present at beginning of simulation.

module top;
  // timeunit 1ns; timeprecision 1ns;

	// Import uvm_package and package for specific protocol that you want to add to the testbench like usb protocol that contain USB uvm objects
	import uvm_pkg::*;      		 // For using uvm libraries
 	import hello_pkg::*;
	import base_test_pkg::*;
	bit clk;
	always #10 clk <= ~clk;
	// Dut instance
	// Inetrface instance
	   test_ifc test_ifc_h(.clk(clk));
	// import usb_pkg::*;    		 // For now this package does not exist

	// Also a top level module contains an initial block which contain a call to the uvm run_test method
	// At time 0, the run_test creates the uvm_root object
	//   -This fetches the test class name from the command line
	//   -Creates the test object
	//   -And then start the phases to run the test 
	// In general run_test method starts the execution of the uvm phases which controls the order in which the components are build
	// Test is run and simulation report are generated
  // run_test instantiates the test components(hello_test components) and starts execution of phases which will cause the test to run and print 
  // the informational message 
	initial begin
		// Pass virtual interface test_ifc_h in uvm_test_top
	  uvm_config_db#(virtual test_ifc/*data_type*/)::set(null/*Handle to the uvm_componemt that is calling the uvm_db*/, "uvm_test_top"/*relative path where you are writting or get this*/, "test_ifc"/*interface name*/, test_ifc_h/*Interface handle*/);
		run_test();
	end
endmodule // top