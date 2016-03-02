/***************************************************************/
// Copyright MIPS_R_US 2016 - All Rights Reserved 
// 
// File: reg2_tb.sv
// Team: MIPS_R_US
// Members:
//		Stefan Cao (ID# 79267250)
//		Ting-Yi Huang (ID# 58106363)
//		Nehme Saikali (ID# 89201494)
//		Linda Vang (ID# 71434490)
//
// Description:
//		This is test bench for reg2
//
// History:
//		Date		Update Description		Developer
//	------------	-------------------		------------
//	03/01/2016		Created					TH, NS, LV, SC
//
/***************************************************************/
module reg2_tb;

	logic ref_clk;
	logic RegWriteD;
	logic MemtoRegD;
	logic MemWriteD;
	logic[5:0] ALUControlD;
	logic ALUSrcD;
	logic RegDstD;
	logic[31:0] RD1;
	logic[31:0] RD2;
	logic[25:21] RsD;
	logic[20:16] RtD;
	logic[15:11] RdD;
	logic[15:0] SignImmD;
	logic clr;
	logic RegWriteE;
	logic MemtoRegE;
	logic MemWriteE;
	logic[5:0] ALUControlE;
	logic ALUSrcE;
	logic RegDstE;
	logic[31:0] RD1toMux1;
	logic[31:0] RD2toMux2;
	logic[25:21] RsE;
	logic[20:16] RtE;
	logic[15:11] RdE;
	logic[15:0] SignImmE;
reg2 L1(
		.ref_clk(ref_clk)
		,.RegWriteD(RegWriteD)
		,.MemtoRegD(MemtoRegD)
		,.MemWriteD(MemWriteD)
		,.ALUControlD(ALUControlD)
		,.ALUSrcD(ALUSrcD)
		,.RegDstD(RegDstD)
		,.RD1(RD1)
		,.RD2(RD2)
		,.RsD(RsD)
		,.RtD(RtD)
		,.RdD(RdD)
		,.SignImmD(SignImmD)
		,.clr(clr)
		,.RegWriteE(RegWriteE)
		,.MemtoRegE(MemtoRegE)
		,.MemWriteE(MemWriteE)
		,.ALUControlE(ALUControlE)
		,.ALUSrcE(ALUSrcE)
		,.RegDstE(RegDstE)
		,.RD1toMux1(RD1toMux1)
		,.RD2toMux2(RD2toMux2)
		,.RsE(RsE)
		,.RtE(RtE)
		,.RdE(RdE)
		,.SignImmE(SignImmE)
		);
always #1 ref_clk = ~ ref_clk;
initial begin
	ref_clk = 1;
	/*pass normally: lw $2, 80($0)*/
	clr = 1;
	RegWriteD = 0;
	MemtoRegD = 0;
	MemWriteD = 0;
	ALUControlD = 6'b100001;
	ALUSrcD = 1;
	RegDstD = 0;
	RD1 = 32'b00000000000000000000000000000001;
	RD2 = 32'b00000000000000000000000000000010;
	RsD = 5'b00000;
	RtD = 5'b00010;
	RdD = 5'b00000;
	SignImmD = 16'b0000000001010000; /*80*/
	
	#2	
	/*no pass*/
	clr = 0;
	RegWriteD = 0;
	MemtoRegD = 1;
	MemWriteD = 0;
	ALUControlD = 6'b100100; /*and*/
	ALUSrcD = 0;
	RegDstD = 1;
	RD1 = 32'b00000000000000000000000000000010;
	RD2 = 32'b00000000000000000000000000000001;
	RsD = 5'b00000;
	RtD = 5'b00011; /*3*/
	RdD = 5'b00000;
	SignImmD = 16'b0000000000000000;	/*0*/
		
	#2
	/*pass*/
	clr = 1;
	RegWriteD = 0;
	MemtoRegD = 1;
	MemWriteD = 0;
	ALUControlD = 6'b100100; /*and*/
	ALUSrcD = 0;
	RegDstD = 1;
	RD1 = 32'b00000000000000000000000000000001;
	RD2 = 32'b00000000000000000000000000000011;
	RsD = 5'b00000;
	RtD = 5'b00011; /*3*/
	RdD = 5'b00000;
	SignImmD = 16'b0000000000000000;	/*0*/
		
	#2	
	$finish;
end
endmodule	
		
		
		
		
		
		
		
		
		
		
