class alu_env extends uvm_env;
    `uvm_component_utils(alu_env);
	alu_agent agent;
  	alu_scoreboard scoreboard;
    //Constructor---------------------------------------------------
    function new(string name="alu_env", uvm_component parent);
        super.new(name,parent);
        `uvm_info("ENV_CLASS","Inside Constructor!",UVM_HIGH);
        
    endfunction //new()

    //Build Phase---------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("ENV_CLASS","Inside Build Phase!",UVM_HIGH);
      agent=alu_agent::type_id::create("agent",this);
      scoreboard=alu_scoreboard::type_id::create("scoreboard",this);
    endfunction

    //Connect Phase---------------------------------------------------
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("ENV_CLASS","Inside Connection Phase!",UVM_HIGH);
      agent.monitor.monitor_port.connect(scoreboard.scoreboard_port);
    endfunction

    //Run Phase---------------------------------------------------
    task  run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("ENV_CLASS","Inside Run Phase!",UVM_HIGH);
    endtask //

endclass