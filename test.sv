class test extends uvm_test;
`uvm_component_utils(test)
env env_h;
apb_sequence seq;

function new(string name="test",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
env_h=env::type_id::create("env_h",this);
seq=apb_sequence::type_id::create("seq");
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
uvm_top.print_topology();
endfunction

task run_phase(uvm_phase phase);
phase.raise_objection(this);
            `uvm_info("TEST",$sformatf("hii from TEST"),UVM_NONE)
seq.start(env_h.agent_h.seqr_h);
`uvm_info("TEST","INSIDE RUN PHASE OF TEST",UVM_NONE)
#100;
phase.drop_objection(this);
endtask

endclass


class test_write extends uvm_test;
`uvm_component_utils(test_write)
env env_h;
apb_write_sequence seq;

function new(string name="test_write",uvm_component parent);
super.new(name,parent);
endfunction
	
function void build_phase(uvm_phase phase);
super.build_phase(phase);
env_h=env::type_id::create("env_h",this);
seq=apb_write_sequence::type_id::create("seq");
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
uvm_top.print_topology();
endfunction

task run_phase(uvm_phase phase);
phase.raise_objection(this);
seq.start(env_h.agent_h.seqr_h);
`uvm_info("TEST","INSIDE RUN PHASE OF TEST",UVM_NONE)
#100;
phase.drop_objection(this);
endtask

endclass


class test_read extends uvm_test;
`uvm_component_utils(test_read)
env env_h;
apb_read_sequence seq;

function new(string name="test_read",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
env_h=env::type_id::create("env_h",this);
seq=apb_read_sequence::type_id::create("seq");
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
uvm_top.print_topology();
endfunction

task run_phase(uvm_phase phase);
phase.raise_objection(this);
seq.start(env_h.agent_h.seqr_h);
`uvm_info("TEST","INSIDE RUN PHASE OF TEST",UVM_NONE)
#100;
phase.drop_objection(this);
endtask

endclass




class test_writeB extends uvm_test;
`uvm_component_utils(test_writeB)
env env_h;
apb_writeB_sequence seq;
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
env_h=env::type_id::create("env_h",this);
seq=apb_writeB_sequence::type_id::create("seq");
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
uvm_top.print_topology();
endfunction

task run_phase(uvm_phase phase);
phase.raise_objection(this);
seq.start(env_h.agent_h.seqr_h);
`uvm_info("TEST","INSIDE RUN PHASE OF TEST",UVM_NONE)
phase.drop_objection(this);
endtask

endclass
class test_readB extends uvm_test;
`uvm_component_utils(test_readB)

env env_h;
apb_readB_sequence seq;

function new(string name= "",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
env_h=env::type_id::create("env_h",this);
seq=apb_readB_sequence::type_id::create("seq");
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
uvm_top.print_topology();
endfunction

task run_phase(uvm_phase  phase);
phase.raise_objection(this);
seq.start(env_h.agent_h.seqr_h);
`uvm_info("TEST","INSIDE RUN PHASE OF TEST",UVM_NONE)
phase.drop_objection(this);
endtask
endclass


class test_writeErr extends uvm_test;
`uvm_component_utils(test_writeErr)

env env_h;
apb_writeErr_sequence seq;


function new(string name="test_writeErr",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
env_h=env::type_id::create("env_h",this);
seq=apb_writeErr_sequence::type_id::create("seq");
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
uvm_top.print_topology();
endfunction

task run_phase(uvm_phase phase);
phase.raise_objection(this);
seq.start(env_h.agent_h.seqr_h);
`uvm_info("TEST","INSIDE RUN PHASE OF TEST",UVM_NONE)
phase.drop_objection(this);
endtask
endclass


class test_readErr extends uvm_test;

`uvm_component_utils(test_readErr)

env env_h;
apb_readErr_sequence seq;

function new(string name="test_readErr",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
env_h=env::type_id::create("env_h",this);
seq=apb_readErr_sequence::type_id::create("seq");
endfunction


function void end_of_elaboration_phase(uvm_phase phase);
uvm_top.print_topology();
endfunction


task run_phase(uvm_phase phase);
phase.raise_objection(this);
seq.start(env_h.agent_h.seqr_h);
`uvm_info("TEST","INSIDE THE RUN PHASE",UVM_NONE);
phase.drop_objection(this);
endtask
endclass

class test_glitch extends uvm_test;

`uvm_component_utils(test_glitch)

env env_h;
glitch_sequence seq;

function new(string name="test_glitch",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
env_h=env::type_id::create("env_h",this);
seq=glitch_sequence::type_id::create("seq");
endfunction


function void end_of_elaboration_phase(uvm_phase phase);
uvm_top.print_topology();
endfunction


task run_phase(uvm_phase phase);
phase.raise_objection(this);
seq.start(env_h.agent_h.seqr_h);
`uvm_info("TEST","INSIDE THE RUN PHASE",UVM_NONE);
phase.drop_objection(this);
endtask
endclass



