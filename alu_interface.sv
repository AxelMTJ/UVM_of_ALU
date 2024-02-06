interface alu_interface(input logic clk);

  logic [7:0] a,b;
  logic reset;
  logic [3:0] opcode;
  logic [7:0] res;
  bit carryout;
endinterface