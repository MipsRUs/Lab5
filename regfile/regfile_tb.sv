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

module regfile_tb;

	logic ref_clk;
	logic we;
	logic[4:0] raddr_1;
	logic[4:0] raddr_2;
	logic[4:0] waddr;
	logic[31:0] rdata_1;
	logic[31:0] rdata_2;
	logic[31:0] wdata;
  
regfile L1(
         .ref_clk(ref_clk)
        ,.we(we)
        ,.raddr_1(raddr_1)
		,.raddr_2(raddr_2)
		,.waddr(waddr)
        ,.rdata_1(rdata_1)
        ,.rdata_2(rdata_2)
        ,.wdata(wdata)
        );

always #1 ref_clk = ~ ref_clk;

initial begin
	ref_clk = 1;

	we = 1;
	raddr_1 = 5'b00000;
	raddr_2 = 5'b00001;

	waddr = 5'b00010;

	wdata = 32'b00000000000000000000011111111111;

	#2
	waddr = 5'b00011;
	wdata = 32'b00011111100000000000011111111111;

	#2
	waddr = 5'b00100;
	wdata = 32'b00000000001111111111111111111111;

	#2
	waddr = 5'b00101;
	wdata = 32'b11111111111111111111111111111111;

	#2
	we = 0;
	raddr_1 = 5'b00010;
	raddr_2 = 5'b00011;

	#2
	raddr_1 = 5'b00100;
	raddr_2 = 5'b00101;

	#2

	$finish;

end
endmodule
    
