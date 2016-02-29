/***************************************************************/
// Copyright MIPS_R_US 2016 - All Rights Reserved 
// 
// File: reg3_tb.sv
// Team: MIPS_R_US
// Members:
//		Stefan Cao (ID# 79267250)
//		Ting-Yi Huang (ID# 58106363)
//		Nehme Saikali (ID# 89201494)
//		Linda Vang (ID# 71434490)
//
// Description:
//		This is test bench for reg3
//
// History:
//		Date		Update Description		Developer
//	------------	-------------------		------------
//	2/28/2016		Created					TH, NS, LV, SC
//
/***************************************************************/
module reg3_tb;

	logic ref_clk;
	logic RegWriteE;
	logic MemtoRegE;
	logic MemWriteE;
	logic[31:0] alu_in;
	logic[31:0] WriteDataE;
	logic[4:0] WriteRegE;

	logic RegWriteM;
	logic MemtoRegM;
	logic MemtoWriteM;
	logic[31:0] alu_out;
	logic[31:0] WriteDataM;
	logic[4:0] WriteRegM;
  
reg3 L1(
          .ref_clk(ref_clk)
         ,.RegWriteE(RegWriteE)
         ,.MemtoRegE(MemtoRegE)
	 ,.MemWriteE(MemWriteE)
	 ,.alu_in(alu_in)
         ,.WriteDataE(WriteDataE)
         ,.WriteRegE(WriteRegE)
		 
	 ,.RegWriteM(RegWriteM)
         ,.MemtoRegM(MemtoRegM)
	 ,.MemWriteM(MemWriteM)
	 ,.alu_out(alu_out)
         ,.WriteDataM(WriteDataM)
         ,.WriteRegM(WriteRegM)		 
         );

always #1 ref_clk = ~ ref_clk;

initial begin
	ref_clk = 1;
	RegWriteE = 0;
	MemtoRegE = 0;
	MemWriteE = 0;
 	alu_in = 		32'b00000000000000000000000000000000;
 	WriteDataE = 	32'b00000000000000000000000000000000;
 	WriteRegE = 	5'b00000;
	

 	#2
	RegWriteE = 1;
	MemtoRegE = 0;
	MemWriteE = 0;
 	alu_in = 		32'b00000000000000000000000000000001;
 	WriteDataE = 	32'b00000000000000000000000000000010;
 	WriteRegE = 	5'b00011;
	
 	#2 
	RegWriteE = 1;
	MemtoRegE = 1;
	MemWriteE = 0;
 	alu_in = 		32'b00000000000000000000000000000110;
 	WriteDataE = 	32'b00000000000000000000000000001100;
 	WriteRegE = 	5'b00110;

 	#2 
	ref_clk = 0;
	RegWriteE = 0;
	MemtoRegE = 1;
	MemWriteE = 0;
 	alu_in = 		32'b00000000000000000000000000001000;
 	WriteDataE = 	32'b00000000000000000000000000000001;
 	WriteRegE = 	5'b00100;
	
	#2
	RegWriteE = 0;
	MemtoRegE = 0;
	MemWriteE = 1;
 	alu_in = 		32'b00000000000000000000000000000001;
 	WriteDataE = 	32'b00000000000000000000000000000001;
 	WriteRegE = 	5'b00001;

	$finish;

end
endmodule
    
