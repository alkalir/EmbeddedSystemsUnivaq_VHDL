## Task 3: Sequential Circuits, I/O and Constraints

In a development board like ARTY, the FPGA is surrounded by hardware components (e.g., UART-to-USB converters, VGA, PMODs, LEDs, switch buttons, push buttons, etc.). To use these components, we need to connect the blocks implemented inside the FPGA to the external hardware.

In this section, a sequential circuit is first implemented in the FPGA, and the procedure to show the outputs using the LEDs placed on the board is illustrated.

### 2.1 – Counter

Create a new project in Vivado (e.g., named `hl_counter`), still targeting the ARTY board, and add a new source file with the entity name `hl_counter`. A possible structure of the counter is provided in the homelab folder.

It is necessary to generate a "slow clock"; otherwise, the counting frequency would be too fast to be visible to the human eye through a blinking LED.

Once the architecture of the counter is defined, you can move to the next phase.

#### Simulation

It is possible to perform a behavioral simulation mid-way. To do so:

* Define a testbench as done in the half-adder example.
* Instantiate the counter in the testbench.
* Properly excite the inputs.

Be aware that after launching the simulation, by default you will see only the top-level entity signals. Since the counter uses an internal slow clock, simulating visible LED blinking would require a long time. To avoid this:

* Either inspect internal signals of the counter module using the **Scope** and **Objects** tabs in XSim.
* Or remove the slow clock generation logic in the testbench version of the counter.

After adding the desired signals, re-run the simulation.

#### Synthesis and Constraints

Once simulation is verified, proceed to synthesis. The counter output must drive the board LEDs. To make this work, constraints must be applied using **Xilinx Design Constraints (XDC)** files.

XDC files are TCL-based scripts that define board- and timing-level constraints [TCL reference](https://docs.amd.com/r/en-US/ug835-vivado-tcl-commands).

To use constraints:

1. Download the XDC file from the Digilent ARTY repository: [https://github.com/Digilent/Arty/tree/master/Resources/XDC](https://github.com/Digilent/Arty/tree/master/Resources/XDC)
2. Add the XDC file to the project:

   * Go to the source pane and right-click to add a source.
   * Select **Add or Create Constraints**.
   * Use the green cross to add the `.xdc` file (select "Copy constraints files into project").
   * Click **Finish**.
3. Edit the file and uncomment the following lines to connect the counter signals to the board:

```tcl
# Connect the clock:
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }]

# Connect the output:
set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { count_out[0] }]
set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { count_out[1] }]
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { count_out[2] }]
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { count_out[3] }]

# Connect the reset:
set_property -dict { PACKAGE_PIN D9    IOSTANDARD LVCMOS33 } [get_ports { reset }]
```

#### Bitstream Generation and Device Programming

Once constraints are ready:

* Click **Generate Bitstream** in the flow navigator.
* After completion, connect the ARTY board to the PC (and to your Virtual Machine if needed).
* Open Vivado Hardware Manager:

  * Click **Open Hardware Manager**.
  * Click **Open Target** and select **Auto Connect**.
  * Click **Program Device**, and select the `.bit` file located in the `runs/impl_1` folder.

At the end of the operation, LEDs 0 to 3 on the board should blink, representing the counter evolution. Pressing the **BTN0** push-button should reset the counter.

### TODO

* Simulate the VHDL description of the counter and verify it functions correctly. Files are in the `hw` folder of the repository.
* Synthesize and verify that the LEDs blink correctly and visibly.

> **Note:** Simulation might need internal signal inspection or slow clock removal to produce observable results quickly.
