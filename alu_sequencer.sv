class alu_sequencer extends uvm_sequencer#(alu_sequence_item);
    `uvm_component_utils(alu_sequencer);

    //Constructor---------------------------------------------------
    function new(string name="alu_sequencer", uvm_component parent);
        super.new(name,parent);
        `uvm_info("SEQUENCER_CLASS","Inside Constructor!",UVM_HIGH);
        
    endfunction //new()

    //Build Phase---------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("SEQUENCER_CLASS","Inside Build Phase!",UVM_HIGH);
        
    endfunction

    //Connect Phase---------------------------------------------------
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("SEQUENCER_CLASS","Inside Connection Phase!",UVM_HIGH);
        
    endfunction


endclass