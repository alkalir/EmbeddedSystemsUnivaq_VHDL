# Simulation
The creation of a new project in Vivado comes through the following steps:
- Launch Vivado
- Select Create New Project from icons
- Click Next and gives project name and project location (pay attention to select destination folders without spaces in the folder name)
- Click Next and select RTL Project
- Click Next and Select VHDL Language and Mixed simulator. Do not add sources and click Next. Do not add Existing IP and click Next. Do not add constraints and click next.
- Select ARTY Board from the list and click next. If ARTY board is not present, download and install the digilent board files from [DigilentGuide](https://digilent.com/reference/programmable-logic/guides/installing-vivado-and-sdk)
- Finish the process

The simulation of a half-adder comes through the following steps:
- Right-Click and Add Design Source
- Take the files from the folder HalfAdder/hw
- Right-Click and Add Simulation Source
- Take the files from the folder HalfAdder/tb
- Run Behavioural Simulation
