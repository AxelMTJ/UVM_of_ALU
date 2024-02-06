class alu_basic_sequence extends uvm_sequence;
    `uvm_object_utils(alu_basic_sequence);
  alu_sequence_item reset_pkt;
    function new(string name="alu_basic_sequence");
        super.new(name);
      `uvm_info("BASIC SEQ_ITEM","Inside Constructor",UVM_HIGH);
    endfunction //new()
  task body();
    `uvm_info("BASIC SEQ","Inside Body Task",UVM_HIGH);
    reset_pkt=alu_sequence_item::type_id::create("reset_pkt");
    start_item(reset_pkt);
    reset_pkt.randomize() with {reset==1;};
    finish_item(reset_pkt);
  endtask
endclass //alu_sequence extends superClass

class alu_test_sequence extends uvm_sequence;
    `uvm_object_utils(alu_test_sequence);
  alu_sequence_item item;
    function new(string name="alu_test_sequence");
        super.new(name);
      `uvm_info("BASIC SEQ_ITEM","Inside Constructor",UVM_HIGH);
    endfunction //new()
  task body();
    `uvm_info("BASIC SEQ","Inside Body Task",UVM_HIGH);
    item=alu_sequence_item::type_id::create("item");
    start_item(item);
    item.randomize() with {reset==0;};
    finish_item(item);
  endtask
endclass //alu_sequence extends superClass