class env extends uvm_env;
`uvm_component_utils(env)
agent agent_h;
scoreboard scbd_h;
coverage cov_h;

function new(string name="env",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
agent_h=agent::type_id::create("agent_h",this);
scbd_h=scoreboard::type_id::create("scbd_h",this);
cov_h=coverage::type_id::create("cov_h",this);
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);


agent_h.mon_h.mon_ap.connect(scbd_h.sbd_imp);
agent_h.mon_h.mon_ap.connect(cov_h.analysis_export);
endfunction 
endclass
