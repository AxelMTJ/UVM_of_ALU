class alu_sequence_item extends uvm_sequence_item;
    `uvm_object_utils(alu_sequence_item);
    rand logic [7:0]a,b;
    rand logic reset;
    rand logic [3:0] opcode;
    logic [7:0] res;
    bit carryout;
  
  //Constraints-------------------------------------
  
  constraint input1_c{a inside{[10:20]};}
  constraint input2_c{b inside{[0:10]};}
  constraint opcode_c{opcode inside{[0:3]};}
  
    function new(string name="alu_sequence_item");
      super.new(name);
        
    endfunction:new //new()
endclass //alu_sequence_item extends superClass