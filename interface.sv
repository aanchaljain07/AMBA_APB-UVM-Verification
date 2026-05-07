
logic psel;
logic pen;
logic pwrite;
logic [31:0] paddr;
logic [31:0] pwdata;
logic [31:0] prdata;
logic pready;
logic pslerr;




property p1;
@ (posedge pclk) psel |=> $rose(pen);
endproperty

P1:assert property(p1);

/*property p2;
@ (posedge pclk ) (psel&& pen) |-> ($isunknown(paddr && pwdata && prdata));
endproperty
P2:assert property(p2);*/
property p3;
@ (posedge pclk) (psel && pen && pwrite) |-> ($stable(paddr && pwdata));
endproperty

P3:assert property(p3);
property p4;
@ (posedge pclk) (psel && pen && !pwrite) |->($stable(prdata));
endproperty

P4:assert property(p4);
property p5;
@ (posedge pclk) (psel && pen)|-> ($stable(paddr && pwdata));
endproperty

P5:assert property(p5);

property p6;
@ (posedge pclk) (psel && $rose(pen)) |=> ##[1:$]$rose(pready);
endproperty

P6:assert property(p6);
property p7;
@ (posedge pclk) (psel && pen && pready ) && (paddr >=256) |-> pslerr;
endproperty

P7:assert property(p7);
endinterface

