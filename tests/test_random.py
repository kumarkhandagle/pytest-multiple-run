import os
import random

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge


@cocotb.test()
async def random_seed_test(dut):
    # Read seed from environment variable.
    # Default to 42 if not provided.
    seed = int(os.getenv("SEED", "42"))
    random.seed(seed)

    dut._log.info(f"Using seed = {seed}")

    # Start a 10 ns clock
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())

    # Generate a random number in range [-5, 5]
    value = random.randint(-5, 5)
    dut._log.info(f"Generated random value = {value}")

    # Write into DUT (convert to 32-bit unsigned representation)
    dut.din.value = value & 0xFFFFFFFF

    # Wait one clock cycle
    await RisingEdge(dut.clk)

    observed = dut.dout.value.signed_integer
    dut._log.info(f"Observed dout = {observed}")

    # Check condition
    assert observed > 0, (
        f"TEST FAILED: value {observed} is not greater than zero "
        f"(seed={seed})"
    )

    dut._log.info("TEST PASSED")