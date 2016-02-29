/***************************************************************/
// Copyright MIPS_R_US 2016 - All Rights Reserved 
// 
// File: reg4_tb.sv
// Team: MIPS_R_US
// Members:
//		Stefan Cao (ID# 79267250)
//		Ting-Yi Huang (ID# 58106363)
//		Nehme Saikali (ID# 89201494)
//		Linda Vang (ID# 71434490)
//
// Description:
//		This is test bench for reg4
//
// History:
//		Date		Update Description		Developer
//	------------	-------------------		------------
//	2/28/2016		Created					TH, NS, LV, SC
//
/***************************************************************/
module reg4_tb;

	logic ref_clk;
	logic RegWriteM;
	logic MemtoRegM;
	logic[31:0] rd_in;
	logic[31:0] alu_in;
	logic[4:0] WriteRegM;

	logic RegWriteW;
	logic MemtoRegW;
	logic[31:0] rd_out;
	logic[31:0] alu_out;
	logic[4:0] WriteRegW;
  
reg4 L1(
		  .ref_clk(ref_clk)
         ,.RegWriteM(RegWriteM)
         ,.MemtoRegM(MemtoRegM)
		,.rd_in(rd_in)
		,.alu_in(alu_in)
         ,.WriteRegM(WriteRegM)
		 
		,.RegWriteW(RegWriteW)
		,.MemtoRegW(MemtoRegW)
		,.rd_out(rd_out)
		,.alu_out(alu_out)
         ,.WriteRegW(WriteRegW)		 
         );

always #1 ref_clk = ~ ref_clk;

initial begin
	ref_clk = 1;
	RegWriteM = 0;
	MemtoRegM = 0;
 	rd_in = 		32'b00000000000000000000000000000000;
 	alu_in = 		32'b00000000000000000000000000000000;
 	WriteRegM = 	5'b00000;
	

 	#2
	RegWriteM = 0;
	MemtoRegM = 0;
 	rd_in = 		32'b00000000000000000000000000000001;
 	alu_in = 		32'b00000000000000000000000000000011;
 	WriteRegM = 	5'b00010;
	
 	#2 
	RegWriteM = 0;
	MemtoRegM = 0;
 	rd_in = 		32'b00000000000000000000000000000010;
 	alu_in = 		32'b00000000000000000000000000000010;
 	WriteRegM = 	5'b00001;

 	#2 
	RegWriteM = 0;
	MemtoRegM = 0;
 	rd_in = 		32'b00000000000000000000000000001111;
 	alu_in = 		32'b00000000000000000000000000000000;
 	WriteRegM = 	5'b00110;
	
	#2
	RegWriteM = 0;
	MemtoRegM = 0;
 	rd_in = 		32'b00000000000000000000000011111000;
 	alu_in = 		32'b00000000000000000000011100000000;
 	WriteRegM = 	5'b00011;

	$finish;

end
endmodule
    