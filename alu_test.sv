class alu_test extends uvm_test;
    `uvm_component_utils(alu_test);
	alu_env env;
  	alu_basic_sequence reset_seq;
  	alu_test_sequence test_seq;
    //Constructor---------------------------------------------------
    function new(string name="alu_test", uvm_component parent);
        super.new(name,parent);
        `uvm_info("TEST_CLASS","Inside Constructor!",UVM_HIGH);
        
    endfunction //new()

    //Build Phase---------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("TEST_CLASS","Inside Build Phase!",UVM_HIGH);
      env=alu_env::type_id::create("env",this);
    endfunction

    //Connect Phase---------------------------------------------------
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("TEST_CLASS","Inside Connection Phase!",UVM_HIGH);
      
    endfunction

    //Run Phase---------------------------------------------------
    task  run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("TEST_CLASS","Inside Run Phase!",UVM_HIGH);
      phase.raise_objection(this);
      
      reset_seq=alu_basic_sequence::type_id::create("reset_seq");
      reset_seq.start(env.agent.sequencer);
          #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
      test_seq.start(env.agent.sequencer);
      #10;
    end
    endtask 
    
endclass