onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /blitter/clk
add wave -noupdate /blitter/reset
add wave -noupdate -radix decimal /blitter/oneballx
add wave -noupdate -radix decimal /blitter/onebally
add wave -noupdate /blitter/addr1
add wave -noupdate /blitter/collision
add wave -noupdate /blitter/addrpt
add wave -noupdate /blitter/twoballx
add wave -noupdate /blitter/twobally
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11719 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ps} {328126 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue HiZ -period 20ns -dutycycle 50 -starttime 0ns -endtime 10000ns sim:/blitter/clk 
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 10000ns sim:/blitter/reset 
wave create -driver freeze -pattern constant -value 0000000000 -range 9 0 -starttime 0ns -endtime 10000ns sim:/blitter/oneballx 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0000000000 -range 9 0 -starttime 0ns -endtime 10000ns sim:/blitter/onebally 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
