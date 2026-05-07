class apb_sequence extends uvm_sequence#(apb_tx);
`uvm_object_utils(apb_sequence)

apb_tx seq;

function new(string name="");
	super.new(name);
endfunction

task body();
	seq = apb_tx::type_id::create("seq");
	start_item(seq);
		seq.pwrite=1;
		assert(randomize(seq) with {seq.paddr == 32'h0000_0032; seq.pwdata == 32'h0000_1234;});
		`uvm_info("WRITE_SEQ",$sformatf(" PADDR = %h, PWRITE = %b, PWDATA = %h",seq.paddr, seq.pwrite, seq.pwdata),UVM_NONE)
	finish_item(seq);
	#10;
	start_item(seq);
		seq.pwrite=0;
		assert(randomize(seq) with {seq.paddr == 32'h0000_0032;});
	finish_item(seq);
endtask

endclass



class apb_write_sequence extends uvm_sequence#(apb_tx);

`uvm_object_utils(apb_write_sequence)

apb_tx seq;

function new(string name ="apb_write_sequence");
super.new(name);
endfunction

task body();
seq=apb_tx::type_id::create("seq");
start_item(seq);
	seq.pwrite=1;
	assert(randomize(seq) with {seq.paddr == 32'h0000_0032; seq.pwdata == 32'h0000_1234;});
	`uvm_info("WRITE_SEQ",$sformatf(" PADDR = %h, PWRITE = %b, PWDATA = %h",seq.paddr, seq.pwrite, seq.pwdata),UVM_NONE)
finish_item(seq);
endtask

endclass


class apb_read_sequence extends uvm_sequence#(apb_tx);

`uvm_object_utils(apb_read_sequence)
apb_tx seq;



function new(string name ="apb_write_sequence");
super.new(name);
endfunction

task body();
seq=apb_tx::type_id::create("seq");
start_item(seq);
	seq.pwrite=0;
	assert(randomize(seq) with {seq.paddr == 32'h0000_0032;});
finish_item(seq);
endtask

endclass

class apb_writeB_sequence extends uvm_sequence#(apb_tx);

`uvm_object_utils(apb_writeB_sequence)

apb_tx seq;

function new(string name="apb_writeB_sequence");
super.new(name);
endfunction

task body();
repeat(10)
begin
seq=apb_tx::type_id::create("seq");
start_item(seq);
    seq.pwrite=1;
    assert(randomize(seq) with {seq.paddr inside{25,35,45,105,255,125,150};});
finish_item(seq);

end
endtask
endclass

class apb_readB_sequence extends uvm_sequence#(apb_tx);

`uvm_object_utils(apb_readB_sequence)
apb_tx seq;

function new(string name="apb_readB_sequence");
super.new(name);
endfunction

task body();
repeat(10)
begin
seq=apb_tx::type_id::create("seq");
start_item(seq);
    seq.pwrite=0;
    assert(randomize(seq) with {seq.paddr inside{25,35,45,105,255,150};});
finish_item(seq);
end
endtask
endclass



class apb_writeErr_sequence extends uvm_sequence#(apb_tx);
`uvm_object_utils(apb_writeErr_sequence)

apb_tx seq;

function new (string name="apb_writeErr_sequence");
super.new(name);
endfunction

task body();
repeat(10)
begin
seq=apb_tx::type_id::create("seq");
start_item(seq);
    seq.pwrite=1;
    assert(randomize(seq) with {seq.paddr > 255;});
finish_item(seq);
end
endtask
endclass

class apb_readErr_sequence extends uvm_sequence#(apb_tx);
`uvm_object_utils(apb_readErr_sequence)
apb_tx seq;

function new(string name="apb_readErr_sequence");
super.new(name);
endfunction

task body();
repeat(10)
begin
seq=apb_tx::type_id::create("seq");
start_item(seq);
    seq.pwrite=0;
    assert(randomize(seq) with {seq.paddr > 255;});
finish_item(seq);
end
endtask
endclass

class glitch_sequence extends uvm_sequence#(apb_tx);
`uvm_object_utils(glitch_sequence)

apb_tx seq;

function new(string name="glitch_sequence");
super.new(name);
endfunction

task body();
repeat(10)
begin
seq=apb_tx::type_id::create("seq");
start_item(seq);
    seq.pwrite=1;
    assert(randomize(seq) with {seq.paddr < 255; seq.glitch==1; });
finish_item(seq);
end
endtask
endclass


