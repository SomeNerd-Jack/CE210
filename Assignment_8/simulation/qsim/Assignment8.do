onerror {exit -code 1}
vlib work
vcom -work work Assignment8.vho
vcom -work work Waveform.vwf.vht
vsim -novopt -c -t 1ps -sdfmax Assignment8_vhd_vec_tst/i1=Assignment8_vhd.sdo -L fiftyfivenm -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.Assignment8_vhd_vec_tst
vcd file -direction Assignment8.msim.vcd
vcd add -internal Assignment8_vhd_vec_tst/*
vcd add -internal Assignment8_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f

