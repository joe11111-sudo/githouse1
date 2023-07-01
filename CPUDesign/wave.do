onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mips/clk
add wave -noupdate -radix hexadecimal /mips/reset
add wave -noupdate -radix hexadecimal /mips/old_PC
add wave -noupdate -radix hexadecimal /mips/new_PC
add wave -noupdate -radix hexadecimal /mips/beq_zero
add wave -noupdate -radix hexadecimal /mips/PC_sel
add wave -noupdate -radix hexadecimal /mips/Instrl
add wave -noupdate -radix hexadecimal /mips/ExtOp
add wave -noupdate -radix hexadecimal /mips/ext_out
add wave -noupdate -radix hexadecimal /mips/Data_to_Reg_sel
add wave -noupdate -radix hexadecimal /mips/Data_to_Reg
add wave -noupdate -radix hexadecimal /mips/RegDst
add wave -noupdate -radix hexadecimal /mips/Reg_rd
add wave -noupdate -radix hexadecimal /mips/RegWrite
add wave -noupdate -radix hexadecimal /mips/grf_out_A
add wave -noupdate -radix hexadecimal /mips/grf_out_B
add wave -noupdate -radix hexadecimal /mips/ALUSrc
add wave -noupdate -radix hexadecimal /mips/ALUSrc_out
add wave -noupdate -radix hexadecimal /mips/ALUCtr
add wave -noupdate -radix hexadecimal /mips/ALU_out
add wave -noupdate -radix hexadecimal /mips/dm_data_out
add wave -noupdate -radix hexadecimal /mips/MemWrite
add wave -noupdate -radix hexadecimal /mips/MemRead
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1 us}
