## Task 5: MicroBlaze

**MicroBlaze** is Xilinx's 32-bit RISC Harvard architecture soft processor core, featuring a rich instruction set optimized for embedded applications. It offers high flexibility in selecting peripherals, memory types, and communication interfaces, allowing for a custom system design that fits the specific application requirements—all on a single FPGA, reducing overall system cost.

The reference manual for MicroBlaze is available at:  
https://docs.amd.com/r/en-US/ug984-vivado-microblaze-ref

---

### Objective

In this task, you will design a MicroBlaze-based system on the **ARTY board** and run a custom application on it.

This involves:

- Building the **hardware architecture** of the MicroBlaze-based system (using Vivado IP Integrator).
- Including **on-chip memory (BRAM)** to store program and data.
- Adding **I/O peripherals** such as **UART** and **GPIO** to enable interaction with the processor.
- Including a **debug module** (e.g., Debug Module Interface or D_UART) to load and control software execution.
- Synthesizing the design and generating the **bitstream**.
- Cross-compiling a C application targeting the MicroBlaze architecture.
- Programming the bitstream onto the FPGA and loading the compiled software into instruction memory.
- Validating the system with a basic test application (e.g., *Hello World* or LED blink).

**Important:** If you do not include IO controllers (e.g., UART, GPIO), you will not be able to interact with the processor.

---

### Instructions

Follow this tutorial from Digilent as a reference:  
https://digilent.com/reference/programmable-logic/guides/getting-started-with-ipi

Key steps:

1. In the section **"Add a MicroBlaze Processor to a Block Design"**, follow the steps to insert and configure the MicroBlaze core into your IP Integrator block diagram.
2. Select **"boards without DDR memory"** when prompted — the ARTY board has DDR3 but for simplicity, you will implement the design using **on-chip memory only** (BRAM-based).
3. Add essential peripherals (UART for serial communication, GPIO for LED toggling or user interaction).
4. Ensure that a **debug interface** (e.g., Debug Module) is included in the design so that programs can be downloaded and executed.
5. Validate the block design, generate the HDL wrapper, and build the hardware.
6. Export the hardware platform (including bitstream).
7. Write a simple application (e.g., LED blink or Hello World), cross-compile it using the **MicroBlaze GCC toolchain**, and load it onto the FPGA system.

---

### Notes

- You are working with the **ARTY board**, not Nexys or other Digilent boards. Make sure to adjust the tutorial accordingly (e.g., clock frequency, available peripherals, constraints).
- You **must include BRAM**, UART, and GPIO in your design.
- A **Hello World** application over UART or an **LED blinking** via GPIO is a sufficient test case.
- You must **synthesize** the design and **generate the bitstream** before running the application.
- Ensure that the MicroBlaze system includes all required components for boot and debug (e.g., Local Memory Bus, MDM, etc.).

---

### TODO

Design and implement a MicroBlaze-based system and develop an application that uses the peripherals you've integrated (i.e., print a message over UART, use push button and blink LED using GPIO). Verify the system by observing correct application behavior.

