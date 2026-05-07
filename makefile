.ONESHELL:

RTL = ../rtl_new.v

TB = ../tb_new/top.sv

PKG = ../tb_new/package.sv

INTF = ../tb_new/interface.sv

INCDIR = +incdir+../tb_new

COV = -coverage all -covoverwrite -covtest $(test) -covworkdir cov_work

TESTLIST = ./test.list

test ?=

regress:
	@echo "====Start of Regression==="
	@for t in `cat ${TESTLIST}`; do \
	echo " ---------------------"; \
	echo "Running test: $$t"; \
	$(MAKE) run test=$$t exit 0; \
	done
	@echo "===End of Regression======"
	

run:
	irun -sv -uvm -access +rwc ${INCDIR} ${INTF} ${RTL} ${PKG} ${TB} ${COV} -timescale 1ns/1ps +UVM_TESTNAME=$(test)

clean:
	rm -rf *.trn *.dsn *.vcd INC* cov*

sim:
	simvision &

batch: 
	imc -execcmd "merge ./cov_work/scope/ -runfile ./cov_list.f metrics all -initial_model union_all -overwrite -out result -message 1"

covlist:
	ls -d ./cov_work/scope/test*>cov_list.f
