class monitor extends uvm_monitor;
`uvm_component_utils(monitor)
uvm_analysis_port#(apb_tx) mon_ap;
virtual apb_intf vif;
apb_tx tx;
function new (string name="monitor",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
tx=apb_tx::type_id::create("tx");
mon_ap = new("mon_ap", this);

if(!(uvm_config_db#(virtual apb_intf)::get(this,"","VIF",vif)))
`uvm_info(get_type_name(),"failed",UVM_NONE)
else
`uvm_info(get_type_name(),"success",UVM_NONE)

endfunction

task run_phase(uvm_phase phase);
//tx=apb_tx::type_id::create("tx");
forever
begin
@(posedge vif.pclk);
tx.pwdata=vif.pwdata;
tx.prdata=vif.prdata;
tx.pwrite=vif.pwrite;
tx.paddr=vif.paddr;
tx.psel=vif.psel;
tx.pen=vif.pen;
tx.pready=vif.pready;
tx.pslvrr=vif.pslerr;
@(posedge vif.pclk);
    `uvm_info("MON",$sformatf("paddr = %h",tx.paddr),UVM_LOW)
mon_ap.write(tx);
end
endtask
endclass
