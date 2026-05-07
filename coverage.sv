class coverage extends uvm_subscriber#(apb_tx);

`uvm_component_utils(coverage)


apb_tx tx;
covergroup coverg;

c1: coverpoint tx.pwdata{
bins wvaild ={ [0:$]};
}

c2: coverpoint tx.prdata{
bins rvaild = {[0:$]};
}

c3: coverpoint tx.paddr{
bins vaild={[0:255]};
bins err={[256:$]};
}
c4: coverpoint tx.psel{
bins sel={[0:1]};
}

c5: coverpoint tx.pen{
bins en={[0:1]};
}

c6: coverpoint tx.pwrite{
bins write={[0:1]};
}

c7: coverpoint tx.pready{
bins ready={[0:1]};
}

c8: coverpoint tx.pslvrr{
bins slverr={[0:1]};
}

c9: coverpoint {tx.psel,tx.pen}{
bins sata =(2'b00=>2'b10=>2'b11);
}
endgroup



function new(string name="coverage",uvm_component parent);
super.new(name,parent);
coverg=new();
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
tx=apb_tx::type_id::create("tx");
endfunction

function void write(apb_tx t);
this.tx=t;
coverg.sample();
endfunction
endclass
