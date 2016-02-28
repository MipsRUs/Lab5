set PathSeparator .

set WLFFilename waveform.wlf
log -r regfile_tb.*


#log -r /* 
run -all
quit
