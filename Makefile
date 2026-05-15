TOPLEVEL_LANG = verilog

VERILOG_SOURCES = $(PWD)/rtl/simple_reg.v
TOPLEVEL = simple_reg
MODULE = test_random

SIM ?= iverilog

export PYTHONPATH := $(PWD)/tests

include $(shell cocotb-config --makefiles)/Makefile.sim