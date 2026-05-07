class apb_tx extends uvm_sequence_item;
bit pwrite;
rand bit [31:0] paddr;
rand bit [31:0] pwdata;
bit [31:0] prdata;
rand bit glitch;
bit psel;
bit pen;
bit pready;
bit pslvrr;

`uvm_object_utils_begin(apb_tx)

`uvm_field_int(paddr,UVM_ALL_ON)
`uvm_field_int(pwdata,UVM_ALL_ON)
`uvm_field_int(prdata,UVM_ALL_ON)
`uvm_field_int(glitch,UVM_ALL_ON)
`uvm_field_int(psel, UVM_ALL_ON)
`uvm_field_int(pen,UVM_ALL_ON)
`uvm_field_int(pready,UVM_ALL_ON)
`uvm_field_int(pslvrr, UVM_ALL_ON)
`uvm_object_utils_end

function new(string name = "seq_item");
	super.new(name);
endfunction

endclass
