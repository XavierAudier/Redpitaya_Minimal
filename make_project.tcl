# ==================================================================================================
# source make_project.tcl
#
# Simple script for creating a Vivado project from the project/ folder 
# Based on Pavel Demin's red-pitaya-notes-master/ git project
#
#
# by Xavier Audier on 2020-04-05
# ==================================================================================================

# defining variables
set project_name "minimal"
# The name of the fpga board for the redpitaya
set part_name xc7z010clg400-1 

# creating subfolder for the project block design sources
set bd_path tmp/$project_name/$project_name.srcs/sources_1/bd/system

# delete the whole project folder before adding anything
file delete -force tmp/$project_name

# create new project
create_project $project_name tmp/$project_name -part $part_name -force


# The GUI should just show input and output ports right now.

# Set Path for the custom IP cores
# In order to do that you should have already created the usable IP from the sources, and put them in the folder 'cores'
set_property IP_REPO_PATHS cores [current_project]
update_ip_catalog

# Now we start adding blocks to the block design
# obtained through write_bd_tcl board.tcl
source boards/$project_name.tcl

# The code shoudl work just fine, since it's doing nothing.
# We still need to write the current design into the .BD file.
# ====================================================================================
# Generate output products and wrapper, add constraint any any additional files 
# We can now generate the block design, and the files that will be used for simulation and future implementations.
generate_target all [get_files  $bd_path/system.bd]

# We create the wrapper
make_wrapper -files [get_files $bd_path/system.bd] -top
# We add the generated system wrapper to the list of files
add_files -norecurse $bd_path/hdl/system_wrapper.v

# Load any additional Verilog files in the project folder
#set files [glob -nocomplain additional_v_sources/*.v additional_v_sources/*.sv]
#if {[llength $files] > 0} {
#  add_files -norecurse $files
#}

# Load RedPitaya constraint files
set files [glob -nocomplain config/*.xdc]
if {[llength $files] > 0} {
  add_files -norecurse -fileset constrs_1 $files
}


# Updates the Vivado tools given the current file set
set_property VERILOG_DEFINE {TOOL_VIVADO} [current_fileset]

# Set comfiguration to run the synthesis and the implementation
set_property STRATEGY Flow_PerfOptimized_High [get_runs synth_1]
set_property STRATEGY Performance_NetDelay_high [get_runs impl_1]


# Generate bitstream 
launch_runs synth_1 -jobs 6
launch_runs impl_1 -to_step write_bitstream -jobs 6
# If a run fails, use the reset_run command
#reset_run impl_1


#reset_run synth_1
#launch_runs synth_1 -jobs 6

#reset_run impl_1
#launch_runs impl_1 -to_step write_bitstream -jobs 6

