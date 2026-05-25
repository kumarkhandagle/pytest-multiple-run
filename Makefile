TOP = tb_counter_bad

SRC = rtl/counter_bad.sv tb_counter_bad.sv

run:
	verilator --binary --timing -Wall $(SRC) --top-module $(TOP)
	./obj_dir/V$(TOP)

clean:
	rm -rf obj_dir