onerror {quit -f}
vlib work
vlog -work work guia5.vo
vlog -work work guia5.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.restador_vlg_vec_tst
vcd file -direction guia5.msim.vcd
vcd add -internal restador_vlg_vec_tst/*
vcd add -internal restador_vlg_vec_tst/i1/*
add wave /*
run -all
