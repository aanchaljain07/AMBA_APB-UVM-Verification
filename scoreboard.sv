class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)

apb_tx trQ[$];
bit [31:0] mem [16];
apb_tx tx;
uvm_analysis_imp#(apb_tx,scoreboard) sbd_imp;
function new(string name="scoreboard",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
sbd_imp=new("sbd_imp",this);
tx = new();
endfunction

virtual function void write(apb_tx t);
	trQ.push_back(t);
   // `uvm_info("SCO",$sformatf("trQ[0].paddr = %h",trQ[0].paddr),UVM_LOW) 
   // `uvm_info("SCO",$sformatf("trQ.size() = %0d",trQ.size()),UVM_LOW)
endfunction


task run_phase(uvm_phase phase);
`uvm_info("SCO",$sformatf("trQ.size() = %0d",trQ.size()),UVM_NONE)
forever begin
wait(trQ.size() >0); 
tx = trQ.pop_front();
if(tx.pwrite)
    begin
        mem[tx.paddr] = tx.pwdata;
        `uvm_info("SCO",$sformatf(" Written Data = %h at %h",tx.pwdata,tx.paddr),UVM_NONE)
     end
else
    begin
        if(mem[tx.paddr] == tx.prdata)
            `uvm_info("SCO",$sformatf(" DATA WRITTEN == DATA READ %h == %h",mem[tx.paddr], tx.prdata),UVM_NONE)
         else
            `uvm_info("SCO",$sformatf(" COMPARISON FAILED"),UVM_NONE)
     end
end
endtask

endclass
