## Task 5: MicroBlaze

MicroBlaze is Xilinx's 32-bit RISC Harvard architecture soft processor core, equipped with a rich instruction set optimized for embedded applications. The MicroBlaze soft processor solution offers complete flexibility in selecting peripherals, memory, and interface features to tailor the system to specific requirements — all within a single FPGA, reducing system cost.

In this task, the goal is to build a MicroBlaze-based system on the ARTY board and program it.

### Instructions

Follow the tutorial provided by Digilent at the following link:

https://digilent.com/reference/programmable-logic/guides/getting-started-with-ipi

Use this guide as a reference to build the system using Vivado’s IP Integrator. Although the ARTY board features a DDR3 memory controller for external memory access, **you should follow the tutorial by not using the DDR3 memory controller**, and instead rely on block RAM as internal memory.

### Notes

- You are working on the **ARTY board**, not on Nexys or other Digilent boards. Adapt the tutorial instructions accordingly (e.g., IP configuration, clocking, peripherals).
- You can use **on-chip memory (BRAM)** for the program and data memory in your design.
- Once the design is complete, synthesize it, generate the bitstream, and program the FPGA using the Vivado Hardware Manager.
- A simple “Hello World” application or LED blink (via GPIO) can be used to validate the functioning of the MicroBlaze processor on the FPGA.

