/***************************************************************/
// Copyright MIPS_R_US 2016 - All Rights Reserved 
// 
// File: equal_comparison_tb.sv
// Team: MIPS_R_US
// Members:
//		Stefan Cao (ID# 79267250)
//		Ting-Yi Huang (ID# 58106363)
//		Nehme Saikali (ID# 89201494)
//		Linda Vang (ID# 71434490)
//
// Description:
//		This is test bench for the equal comparison
//
// History:
//		Date		Update Description		Developer
//	------------	-------------------		------------
//	2/27/2016		Created					TH, NS, LV, SC
//
/***************************************************************/

module equal_comparison_tb;

	logic[31:0] A_in;
	logic[31:0] B_in;
	logic[5:0] ALUControl;
	logic outb;

equal_comparison L1(
          .A_in(A_in)
         ,.B_in(B_in)
         ,.ALUControl(ALUControl)
         ,.outb(outb)
         );

initial begin
	
 	A_in = 32'b00000000000000000000011111111111;
 	B_in = 32'b00000000000000000000000000000111;

 	ALUControl = 6'b111000;
 	#2
 	ALUControl = 6'b111001;
 	#2
 	ALUControl = 6'b111100;
 	#2
 	ALUControl = 6'b111101;
 	#2
 	ALUControl = 6'b111110;
 	#2
 	ALUControl = 6'b111111;
 	#2

 	A_in = 32'b11111111111111111111111000000000;
	ALUControl = 6'b111000;
 	#2
 	ALUControl = 6'b111001;
 	#2
 	ALUControl = 6'b111100;
 	#2
 	ALUControl = 6'b111101;
 	#2
 	ALUControl = 6'b111110;
 	#2
 	ALUControl = 6'b111111;
 	#2 	

	$finish;

end
endmodule
    
