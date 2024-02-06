`timescale  1ps/1ps

import uvm_pkg                                ::*;

//Include File-------------------------------------
`include "uvm_macros.svh"
`include "alu_interface.sv"
`include "alu_sequence_item.sv"
`include "alu_sequence.sv"
`include "alu_sequencer.sv"
`include "alu_driver.sv"
`include "alu_monitor.sv"
`include "alu_agent.sv"
`include "alu_scoreboard.sv"
`include "alu_env.sv"
`include "alu_test.sv"



module top;

//Instantiation-------------------------------------
logic clk;
alu_interface intf(.clk(clk));
alu dut(
    .clk(intf.clk),
    .A(intf.a),
    .B(intf.b),
    .reset(intf.reset),
    .alu_sel(intf.opcode),
    .alu_res(intf.res),
    .carryout(intf.carryout)
);
initial begin
    clk =0;
    #5;
    forever begin
         clk=~clk;
         #2;
    end

end
      initial begin
        #5000;
        $display("Sorry! Ran out of clock cycles!");
        $finish();
      end
    //Interface set-------------------------------------
        initial begin
        uvm_config_db #(virtual alu_interface)::set(null, "*", "vif", intf );
        end
    

      //Start test-------------------------------------
        initial begin
        run_test("alu_test");
    end
    //Wave-------------------------------------
initial begin
    $dumpfile("d.vcd");
    $dumpvars();
end



endmodule