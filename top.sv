`include "uvm_macros.svh"
module top;
import apb_pkg::*;
import uvm_pkg::*;
reg pclk;
reg prst;
apb_intf pif(pclk,prst);
apb_design_n dut(.pclk(pif.pclk),.prst(pif.prst),.psel(pif.psel),.pen(pif.pen),.pwrite(pif.pwrite),.paddr(pif.paddr),.pwdata(pif.pwdata),.prdata(pif.prdata),.pslverr(pif.pslerr),.pready(pif.pready));
initial 
begin
pclk=0;
forever #5 pclk=~pclk;
end
initial 
begin
prst=1;
#10;
prst=0;
end 
initial
begin
uvm_config_db#(virtual apb_intf)::set(null,"*","VIF",pif);
run_test();
end
initial
begin
$dumpfile("dump.vcd");
$dumpvars();
end
initial begin
    $recordvars();
    $recordfile("dump.trn");
    end
endmodule
