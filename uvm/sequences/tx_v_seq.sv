// A virtual sequence is a sequence that creates and starts other sequences. Virtual sequences is used when you have to stimulate the DUT with multiple sequences.
// A virtual sequences does not directly generate item and does not need to be specialized
// This class wraps multiple sequences and this class is reuseable
// This virtual sequence starts child sequences with sequencers handle from ""tx_v_seq_h.start(tx_agent_config_h.tx_sequencer_h);"" present in tx_test class

class tx_v_seq extends uvm_sequence;

		// For sequence we have to register this object with uvm factory using macro uvm_object
  // Pass the class name to it
  `uvm_object_utils(tx_v_seq)

  /*
	Then declare tx_v_seq class constructor
	Since a class object has to be constructed before it exit in a memory
	The creation of class hierarchy in a system verilog testbench has to be initiated from a top module.
	Since a module is static object that is present at beginning of simulation 
	*/
  function new (string name="tx_v_seq");
    super.new(name);
  endfunction // new
  
  tx_sequence tx_sequence_h;                                              // Declaring a sequences

  task body();
  	// Adding first sequence
  	tx_sequence_h = tx_sequence::type_id::create("tx_sequence_h");      // Creating a sequences
  	tx_sequence_h.start(get_sequencer(), this);
    // Similarly you can add second sequence
  
  endtask
endclass