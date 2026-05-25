TOP = tb_counter_bad

SRC = rtl/counter_bad.v tb_counter_bad.v

run:
	verilator --binary --timing -Wall $(SRC) --top-module $(TOP)
	./obj_dir/V$(TOP)

clean:
	rm -rf obj_dir