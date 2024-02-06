




class alu_monitor extends uvm_monitor;
    `uvm_component_utils(alu_monitor);
	virtual alu_interface vif;
    alu_sequence_item item;
  uvm_analysis_port #(alu_sequence_item) monitor_port;
    //Constructor---------------------------------------------------
    function new(string name="alu_monitor", uvm_component parent);
        super.new(name,parent);
        `uvm_info("MONITOR_CLASS","Inside Constructor!",UVM_HIGH);
      monitor_port=new("monitor_port",this);
    endfunction //new()

    //Build Phase---------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
      //monitor_port = new("monitor_port", this);
        `uvm_info("MONITOR_CLASS","Inside Build Phase!",UVM_HIGH);
      if(!uvm_config_db#(virtual alu_interface)::get(this,"*","vif",vif)) begin
        `uvm_error("MONITOR CLASS","Failed to get db");
      end
    endfunction

    //Connect Phase---------------------------------------------------
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("MONITOR_CLASS","Inside Connection Phase!",UVM_HIGH);
        
    endfunction

    //Run Phase---------------------------------------------------
    task  run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("MONITOR_CLASS","Inside Run Phase!",UVM_HIGH);
      forever begin
        item=alu_sequence_item::type_id::create("item");
        wait(!vif.reset);
        @(posedge vif.clk);
        item.a=vif.a;
        item.b=vif.b;
        item.opcode=vif.opcode;
        @(posedge vif.clk);
        item.res=vif.res;
        
        monitor_port.write(item);
      end
       
    endtask 
  


endclass