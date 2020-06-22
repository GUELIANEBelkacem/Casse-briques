# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xa7a100tcsg324-1I

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.cache/wt [current_project]
set_property parent.project_path C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo c:/Users/USER/Desktop/myCasseBrique/myCasseBrique.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/Etudiants/ADXL362Ctrl.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/Etudiants/ClkDiv.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/Etudiants/ClkDiv_5Hz.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/Etudiants/SPI_If.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/Etudiants/ball.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/Etudiants/pong_package.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/Etudiants/bounce.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/Etudiants/brick.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/Etudiants/decor.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/Etudiants/display.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/Etudiants/mode.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/Etudiants/game.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/jeux/jeux.srcs/sources_1/new/test.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/Etudiants/vga.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/Etudiants/pad.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/Etudiants/monostable.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/imports/Desktop/Etudiants/objects.vhd
  C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/sources_1/new/game_gen.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/constrs_1/new/pn.xdc
set_property used_in_implementation false [get_files C:/Users/USER/Desktop/myCasseBrique/myCasseBrique.srcs/constrs_1/new/pn.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top game_gen -part xa7a100tcsg324-1I


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef game_gen.dcp
create_report "synth_2_synth_report_utilization_0" "report_utilization -file game_gen_utilization_synth.rpt -pb game_gen_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
