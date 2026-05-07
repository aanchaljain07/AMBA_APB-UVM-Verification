class driver extends uvm_driver#(apb_tx);

`uvm_component_utils(driver)

virtual apb_intf vif;



function new(string name = "driver", uvm_component parent);
	super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!(uvm_config_db#(virtual apb_intf)::get(this,"","VIF",vif)))
`uvm_info(get_type_name(),"failded",UVM_NONE)
else
`uvm_info(get_type_name(),"success",UVM_NONE)
endfunction

task apb_idle_phase();

`uvm_info(get_type_name(),"yyyyyoooooooo ======== ",UVM_NONE)

vif.psel<=0;
vif.pen<=0;
@(posedge vif.pclk);
endtask

task apb_setup_phase();
vif.psel<=1;
vif.pen<=0;
@(posedge vif.pclk);
endtask


task apb_access_phase();
vif.psel<=1;
vif.pen<=1;

@(posedge vif.pclk);
endtask


task write_driver(apb_tx tx);

apb_idle_phase();
`uvm_info("WRITE_IDLE PHASE",$sformatf(" Psel = %b, Penable = %b",vif.psel, vif.pen),UVM_NONE)

vif.paddr<=tx.paddr;
//vif.prdata<=tx.prdata;
vif.pwdata<=tx.pwdata;
vif.pwrite<=tx.pwrite;

apb_setup_phase();
//@(posedge vif.pclk);
`uvm_info("WRITE SETUP PHASE",$sformatf(" Psel = %b, Penable = %b",vif.psel, vif.pen),UVM_NONE)
`uvm_info("WRITE_SETUP PHASE",$sformatf(" Paddr = %h, Pwdata = %h, Pwrite = %b",vif.paddr, vif.pwdata, vif.pwrite),UVM_NONE)


apb_access_phase();
wait(vif.pready)
`uvm_info("WRITE ACCESS PHASE",$sformatf(" Psel = %b, Penable = %b Pready = %b",vif.psel, vif.pen, vif.pready),UVM_NONE)
`uvm_info(get_type_name(),"INSIDE WRITE DRIVER TASK AFTER PREADY ======== ",UVM_NONE)

@(posedge vif.pclk);
//@(posedge vif.pclk);



apb_idle_phase();

endtask

task read_driver(apb_tx tx);
//`uvm_info(get_type_name(),"yyyyyoooooooo ======== ",UVM_NONE)

apb_idle_phase();

vif.paddr<=tx.paddr;
vif.pwrite<=tx.pwrite;

apb_setup_phase();

apb_access_phase();
wait(vif.pready);
@(posedge vif.pclk);
`uvm_info(get_type_name(),"INSIDE READ DRIVER TASK AFTER PREADY ======== ",UVM_NONE)

tx.prdata=vif.prdata;
apb_idle_phase();

endtask


task run_phase(uvm_phase phase);
`uvm_info(get_type_name(),"INSIDE ======== ",UVM_NONE)
forever
begin
seq_item_port.get_next_item(req);
`uvm_info("DRV","INSIDE RUN PHASE DRIVER",UVM_NONE)
if(req.pwrite)
begin
	`uvm_info("WRITE_DRV",$sformatf(" PWRITE = %b",req.pwrite),UVM_NONE)
	write_driver(req);
end
else
begin
	`uvm_info("READ_DRV",$sformatf(" PWRITE = %b",req.pwrite),UVM_NONE)
	read_driver(req);
end
seq_item_port.item_done();
end
endtask

endclass
