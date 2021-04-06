##
#	Author : Xavier Audier
# 	
#	Build a minimal viable bitfile for redpitaya use
# emphasis put on having no critical warning in compilation and offering good timing in the implementation
# 
##

PRJ   ?= minimal
MODEL ?= Z10


# Vivado commands to build project
VIVADO = vivado -nojournal -mode batch

.PHONY: all clean

all: project

# TODO: clean should go into each project
clean:
	rm -rf out .Xil .srcs sdk project
	rm -rf prj/$(PRJ)/out prj/$(PRJ)/.Xil prj/$(PRJ)/.srcs prj/$(PRJ)/sdk prj/$(PRJ)/project

project:
	vivado -source make_project.tcl