class agent extends uvm_agent;
`uvm_component_utils(agent)
driver driv_h;
monitor mon_h;
seqr seqr_h;
function new (string name="",uvm_component parent=null);
super.new(name,parent);
endfunction
function void build_phase(uvm_phase phase);
super.build_phase(phase);
driv_h=driver::type_id::create("driv_h",this);
mon_h=monitor::type_id::create("mon_h",this);
seqr_h=seqr::type_id::create("seqr_h",this);
endfunction

function void connect_phase(uvm_phase phase);
driv_h.seq_item_port.connect(seqr_h.seq_item_export);
endfunction
endclass



 
