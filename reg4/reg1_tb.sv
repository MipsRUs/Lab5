/***************************************************************/
// Copyright MIPS_R_US 2016 - All Rights Reserved 
// 
// File: reg1_tb.sv
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
	logic[31:0] DataI_A;
	logic[31:0] DataI_B;
	logic en;
	logic clr;
	logic[31:0] DataO_A;
	logic[31:0] DataO_B;
  
reg1 L1(
          .ref_clk(ref_clk)
         ,.DataI_A(DataI_A)
         ,.DataI_B(DataI_B)
		 ,.en(en)
		 ,.clr(clr)
         ,.DataO_A(DataO_A)
         ,.DataO_B(DataO_B)
         );

always #1 ref_clk = ~ ref_clk;

initial begin
	ref_clk = 1;
	clr = 0;
	en = 1;
 	DataI_A = 32'b00000000000000000000011111111111;
 	DataI_B = 32'b00000000000000000000000000000000;
	

 	#2
	clr = 1; 
	en = 1;
 	DataI_A = 32'b00000000000000000000000000000000;
 	DataI_B = 32'b00000000000000000000000000000000;
	
 	#2 
	clr = 1;
	en = 0;
 	DataI_A = 32'b00000000000000000000000000000000;
 	DataI_B= 32'b00000000000000000000000000000001;

 	#2 
	DataI_A = 32'b00000000000000000000000000000010;
	
	#2
	clr = 0; 
	en = 0;
 	DataI_A = 32'b00000000000000000000000000000000;
 	DataI_B = 32'b00000000000000000000000000000000;

	$finish;

end
endmodule
    