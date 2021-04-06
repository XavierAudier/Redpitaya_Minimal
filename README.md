# Minimal Redpitaya Implementation

This is a small repository showing a very minimal implementation of the FPGA in the Redpitaya using vivado.

Using `make` command in the current directory builds the FPGA using Vivado (added to path), sets the ports and a minimal Zinq7 unit.

Note that you mat need to run the Vivado setting script such as:

`C:\\Program Files\\Xilinx\\Vivado\\2020.1\\settings64.bat`

Additionally, you may run into the issue of having a long folder path.
In this case you can create a  virtual drive in the current folder with the subst command.

`subst W: "C:\\Users\\me\\the_subfolder\\Redpitaya_Minimal"`


Very usefull resources to go further :
- [The Redpitaya Github](https://github.com/RedPitaya/RedPitaya)
- [Great tutorials by Anton Potočnik](https://github.com/apotocnik/redpitaya_guide)
- [The ubiquitous library of cores developped by Pavel Demin](https://github.com/pavel-demin/red-pitaya-notes)
