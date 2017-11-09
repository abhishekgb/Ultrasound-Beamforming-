##
## Core Generator Run Script, generator for Project Navigator checkversion command
##

proc findRtfPath { relativePath } {
   set xilenv ""
   if { [info exists ::env(XILINX) ] } {
      if { [info exists ::env(MYXILINX)] } {
         set xilenv [join [list $::env(MYXILINX) $::env(XILINX)] $::xilinx::path_sep ]
      } else {
         set xilenv $::env(XILINX)
      }
   }
   foreach path [ split $xilenv $::xilinx::path_sep ] {
      set fullPath [ file join $path $relativePath ]
      if { [ file exists $fullPath ] } {
         return $fullPath
      }
   }
   return ""
}

source [ findRtfPath "data/projnav/scripts/dpm_cgUtils.tcl" ]

set result [ run_cg_vcheck {{E:/project files/working codes/full Rx part_ubf/rx_side_3_10_13/RTL/14_sram_wr_fifo/sram_wr_data_fifo.xco} {E:/project files/working codes/full Rx part_ubf/rx_side_3_10_13/RTL/16_logic analysers/icontrol2.xco} {E:/project files/working codes/full Rx part_ubf/rx_side_3_10_13/RTL/16_logic analysers/logicanalyser1.xco} {E:/project files/working codes/full Rx part_ubf/rx_side_3_10_13/PAR/lvds_fifo.xco} {E:/project files/working codes/full Rx part_ubf/rx_side_3_10_13/PAR/usb_fifo.xco} {E:/project files/working codes/full Rx part_ubf/rx_side_3_10_13/RTL/15_dcm and pll/freq_mul.xaw}} xc5vlx50-1ff676 ]

if { $result == 0 } {
   puts "Core Generator checkversion command completed successfully."
} elseif { $result == 1 } {
   puts "Core Generator checkversion command failed."
} elseif { $result == 3 || $result == 4 } {
   # convert 'version check' result to real return range, bypassing any messages.
   set result [ expr $result - 3 ]
} else {
   puts "Core Generator checkversion cancelled."
}
exit $result
