# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "C:/Users/prodrigu/git/simpleNeuralNetwork/Vivado/NNA/NNA.runs/config_mpsoc_auto_pc_1_synth_1/.Xil/Vivado-252188-SJO-PRODRIGU-L1/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    set rt::partid xczu9eg-ffvb1156-2-e
     file delete -force synth_hints.os

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common_vhdl.tcl
    set rt::defaultWorkLibName xil_defaultlib

    # Skipping read_* RTL commands because this is post-elab optimize flow
    set rt::useElabCache true
    if {$rt::useElabCache == false} {
      rt::read_verilog -sv -include c:/Users/prodrigu/git/simpleNeuralNetwork/Vivado/NNA/NNA.srcs/sources_1/bd/config_mpsoc/ipshared/ec67/hdl {
      C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv
      C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv
      C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv
    }
      rt::read_verilog -include c:/Users/prodrigu/git/simpleNeuralNetwork/Vivado/NNA/NNA.srcs/sources_1/bd/config_mpsoc/ipshared/ec67/hdl {
      c:/Users/prodrigu/git/simpleNeuralNetwork/Vivado/NNA/NNA.srcs/sources_1/bd/config_mpsoc/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v
      c:/Users/prodrigu/git/simpleNeuralNetwork/Vivado/NNA/NNA.srcs/sources_1/bd/config_mpsoc/ipshared/5b9c/hdl/axi_data_fifo_v2_1_vl_rfs.v
      c:/Users/prodrigu/git/simpleNeuralNetwork/Vivado/NNA/NNA.srcs/sources_1/bd/config_mpsoc/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v
      c:/Users/prodrigu/git/simpleNeuralNetwork/Vivado/NNA/NNA.srcs/sources_1/bd/config_mpsoc/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v
      c:/Users/prodrigu/git/simpleNeuralNetwork/Vivado/NNA/NNA.srcs/sources_1/bd/config_mpsoc/ipshared/c83a/hdl/axi_protocol_converter_v2_1_vl_rfs.v
      c:/Users/prodrigu/git/simpleNeuralNetwork/Vivado/NNA/NNA.srcs/sources_1/bd/config_mpsoc/ip/config_mpsoc_auto_pc_1/synth/config_mpsoc_auto_pc_1.v
    }
      rt::read_vhdl -lib blk_mem_gen_v8_4_3 c:/Users/prodrigu/git/simpleNeuralNetwork/Vivado/NNA/NNA.srcs/sources_1/bd/config_mpsoc/ipshared/c001/hdl/blk_mem_gen_v8_4_vhsyn_rfs.vhd
      rt::read_vhdl -lib fifo_generator_v13_2_4 c:/Users/prodrigu/git/simpleNeuralNetwork/Vivado/NNA/NNA.srcs/sources_1/bd/config_mpsoc/ipshared/1f5a/hdl/fifo_generator_v13_2_vhsyn_rfs.vhd
      rt::read_vhdl -lib xpm C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification true
    set rt::SDCFileList C:/Users/prodrigu/git/simpleNeuralNetwork/Vivado/NNA/NNA.runs/config_mpsoc_auto_pc_1_synth_1/.Xil/Vivado-252188-SJO-PRODRIGU-L1/realtime/config_mpsoc_auto_pc_1_synth.xdc
    rt::sdcChecksum
    set rt::top config_mpsoc_auto_pc_1
    rt::set_parameter enableIncremental true
    set rt::ioInsertion false
    set rt::reportTiming false
    rt::set_parameter elaborateOnly false
    rt::set_parameter elaborateRtl false
    rt::set_parameter eliminateRedundantBitOperator true
    rt::set_parameter elaborateRtlOnlyFlow false
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter ramStyle auto
    rt::set_parameter merge_flipflops true
# MODE: out_of_context
    rt::set_parameter webTalkPath {}
    rt::set_parameter enableSplitFlowPath "C:/Users/prodrigu/git/simpleNeuralNetwork/Vivado/NNA/NNA.runs/config_mpsoc_auto_pc_1_synth_1/.Xil/Vivado-252188-SJO-PRODRIGU-L1/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
        set oldMIITMVal [rt::get_parameter maxInputIncreaseToMerge]; rt::set_parameter maxInputIncreaseToMerge 1000
        set oldCDPCRL [rt::get_parameter createDfgPartConstrRecurLimit]; rt::set_parameter createDfgPartConstrRecurLimit 1
        $rt::db readXRFFile
      rt::run_synthesis -module $rt::top
        rt::set_parameter maxInputIncreaseToMerge $oldMIITMVal
        rt::set_parameter createDfgPartConstrRecurLimit $oldCDPCRL
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    rt::HARTNDb_reportJobStats "Synthesis Optimization Runtime"
    rt::HARTNDb_stopSystemStats
    if { $rt::flowresult == 1 } { return -code error }


  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  rt::set_parameter helper_shm_key "" 
    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }

    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}
