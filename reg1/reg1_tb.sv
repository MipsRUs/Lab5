/***************************************************************/
// Copyright MIPS_R_US 2016 - All Rights Reserved 
// 
// File: memory_tb.sv
// Team: MIPS_R_US
// Members:
//		Stefan Cao (ID# 79267250)
//		Ting-Yi Huang (ID# 58106363)
//		Nehme Saikali (ID# 89201494)
//		Linda Vang (ID# 71434490)
//
// Description:
//		This is test bench for reg1
//
// History:
//		Date		Update Description		Developer
//	------------	-------------------		------------
//	2/25/2016		Created					TH, NS, LV, SC
//
/***************************************************************/
module reg1_tb;

	logic ref_clk;
	logic[31:0] RD;
	logic[31:0] PCPlus4F;
	logic en;
	logic clr;
	logic[31:0] InstrD;
	logic[31:0] PCPlus4D;
  
reg1 L1(
          .ref_clk(ref_clk)
         ,.RD(RD)
         ,.PCPlus4F(PCPlus4F)
		 ,.en(en)
		 ,.clr(clr)
         ,.InstrD(InstrD)
         ,.PCPlus4D(PCPlus4D)
         );

always #1 ref_clk = ~ ref_clk;

initial begin
	ref_clk = 1;
	/*pass normally*/
	clr = 0;
	en = 0;
 	RD = 32'b00000000000000000000000000000001;
 	PCPlus4F = 32'b00000000000000000000000000000000;
	

 	#2
	/*no pass*/
	clr = 0;
	en = 1;
 	RD = 32'b00000000000000000000000000000011;
 	PCPlus4F = 32'b00000000000000000000000000000001;
	
 	#2 
	/*no pass*/
	clr = 1;
	en = 1;
 	RD = 32'b00000000000000000000000000000001;
 	PCPlus4F = 32'b00000000000000000000000000000010;

 	#2
	clr = 0;
	en = 0;
 	RD = 32'b00000000000000000000000000000010;
 	PCPlus4F = 32'b00000000000000000000000000000011;

	#2
	$finish;

end
endmodule
    
