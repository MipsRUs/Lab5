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

	logic[31:0] in0;
	logic[31:0] in1;
	logic outb;

equal_comparison L1(
          .in0(in0)
         ,.in1(in1)
         ,.outb(outb)
         );

initial begin
	
 	in0 = 32'b00000000000000000000011111111111;
 	in1 = 32'b00000000000000000000000000000000;

 	#2 
 	in0 = 32'b00000000000000000000000000000000;
 	in1 = 32'b00000000000000000000000000000000;

 	#2 
 	in0 = 32'b00000000000000000000000000000000;
 	in1 = 32'b00000000000000000000000000000001;

 	#2 
 	in0 = 32'b00000000000000000000000000000010;
 	in1 = 32'b00000000000000000000000000000010;

 	#2

	$finish;

end
endmodule
    
