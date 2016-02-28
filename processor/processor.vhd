-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: processor.vhd
-- Team: MIPS_R_US
-- Members:
-- 		Stefan Cao (ID# 79267250)
--		Ting-Yi Huang (ID# 58106363)
--		Nehme Saikali (ID# 89201494)
--		Linda Vang (ID# 71434490)
--
-- Description:
--		This is a pipelined processor
--
-- History:
-- 		Date		Update Description			Developer
--	-----------   ----------------------   	  -------------
--	1/27/2016		Created						TH, NS, LV, SC
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY processor IS
	PORT (
		ref_clk : IN std_logic ;
		reset : IN std_logic;

		-- This output signal is only necessary for synthesis
		out_b : OUT std_logic_vector(31 DOWNTO 0)
	);
END processor;

architecture behavior of processor is

---------------------------------------
-------------- components -------------
---------------------------------------

-- mux
component mux
	port( 
		in0: in std_logic_vector(31 downto 0);
		in1: in std_logic_vector(31 downto 0);
		sel: in std_logic;
		outb: out std_logic_vector(31 downto 0)
	);
end component;

-- buffer_e
component buffer_e
	port (
		ref_clk : IN std_logic;
		WE : IN std_logic;
		DataI: IN std_logic_vector(31 DOWNTO 0);
		DataO: OUT std_logic_vector(31 DOWNTO 0)
	
	);
end component;

-- rom
component rom
	port(
		addr: IN STD_LOGIC_VECTOR(31 downto 0); 
		dataOut: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end component;

-- adder 
component adder
	port(
		a : in std_logic_vector(31 downto 0);
		b : in std_logic_vector(31 downto 0);	
		sum	: out std_logic_vector(31 downto 0)
	);
end component;

-- reg1 ************************ NOT IMPLEMENTED NEED TO LOOK AT THIS AGAIN
component reg1
	PORT (
		ref_clk : IN std_logic;
		DataI : IN std_logic_vector(31 DOWNTO 0);
		en:	  	  IN std_logic; --enable from stallD
		clr:	  IN std_logic; -- clear enable from PCSrc
		DataO : OUT std_logic_vector(31 DOWNTO 0)	
	);
end component;

-- control ************************ NOT IMPLEMENTED NEED TO LOOK AT THIS AGAIN
component control
	PORT(
		Op:				IN std_logic_vector(31 downto 26);
		Funct:			IN std_logic_vector(5 downto 0);
		RegWriteD:		OUT std_logic;
		MemtoRegD:		OUT std_logic;
		MemWriteD:		OUT std_logic;
		ALUControlD:	OUT std_logic;
		ALUSrcD: 		OUT std_logic;
		RegDstD:		OUT std_logic;
		BranchD:		OUT std_logic
		
	);
end component;

-- regfile
component regfile
	PORT (
		ref_clk : IN std_logic;
		we : IN std_logic ; -- write enable
		raddr_1 : IN std_logic_vector (4 DOWNTO 0); -- read address 1
		raddr_2 : IN std_logic_vector (4 DOWNTO 0); -- read address 2
		waddr : IN std_logic_vector (4 DOWNTO 0); -- write address
		rdata_1 : OUT std_logic_vector (31 DOWNTO 0); -- read data 1
		rdata_2 : OUT std_logic_vector (31 DOWNTO 0); -- read data 2
		wdata : IN std_logic_vector (31 DOWNTO 0) -- write data 1
	);
end component;

-- sign_extension_16bit
component sign_extension_16bit
	PORT(
		immediate : IN std_logic_vector(15 DOWNTO 0);
		sign_extension_out : OUT std_logic_vector(31 DOWNTO 0)
	);
end component;

-- shiftleft_32bit
component shiftleft_32bit
	PORT (
		A_in : IN std_logic_vector (31 DOWNTO 0);
		O_out: OUT std_logic_vector (31 DOWNTO 0)
	);
end component;



-----------------------------------------------
-------------- signals ------------------------
-----------------------------------------------

signal PCSrcD : std_logic;
signal PCPlus4F : std_logic_vector(31 DOWNTO 0);
signal PC_adder_1 : std_logic_vector(31 DOWNTO 0);
signal PC_in : std_logic_vector(31 DOWNTO 0);

signal PCF : std_logic_vector(31 DOWNTO 0);
signal IR_out : std_logic_vector(31 DOWNTO 0);

-- value '4'
signal adder_value_4 : std_logic_vector (31 DOWNTO 0) := "00000000000000000000000000000100";

signal InstrD : std_logic_vector(31 DOWNTO 0);

signal RD1_out: std_logic_vector(31 DOWNTO 0);
signal RD2_out: std_logic_vector(31 DOWNTO 0);

signal ResultW: std_logic_vector(31 DOWNTO 0);

signal SignImmD: std_logic_vector(31 DOWNTO 0);

signal shift_out: std_logic_vector(31 DOWNTO 0);

signal RegWriteD: std_logic;
signal MemtoRegD: std_logic;
signal MemWriteD: std_logic;
signal ALUControlD: std_logic;
signal ALUSrcD: std_logic;
signal RegDstD: std_logic;
signal BranchD: std_logic;


signal RegWriteW: std_logic;
signal WriteRegW: std_logic_vector(4 DOWNTO 0);



signal StallF : std_logic;
signal StallD : std_logic;


------------------- begin --------------------- 
begin

	PCmuxx:	mux PORT MAP(in0=>PCPlus4F, in1=>PC_adder_1, sel=>PCSrcD, outb=>PC_in);

	PC_regx: buffer_e PORT MAP(ref_clk=>ref_clk, WE=>StallF, DataI=>PC_in, DataO=>PCF);

	IRx: rom PORT MAP(addr=>PCF, dataOut=>IR_out);

	PCadderx: adder PORT MAP(a=>PCF, b=>adder_value_4, sum=>PCPlus4F);

	Reg1x: reg1 PORT MAP(ref_clk=>ref_clk, DataI=>IR_out, en=>stallD, clr=>PCSrcD,
					DataO=>InstrD);

	controlx: control PORT MAP(Op=>InstrD(31 DOWNTO 26), Funct=>InstrD(31 DOWNTO 0),
					RegWriteD=>RegWriteD, MemtoRegD=>MemtoRegD, MemWriteD=>MemWriteD,
					ALUControlD=>ALUControlD, ALUSrcD=>ALUSrcD, RegDstD=>RegDstD,
					BranchD=>BranchD);

	regfilex: regfile PORT MAP(ref_clk=>ref_clk, we=>RegWriteW, raddr_1=>InstrD(25 DOWNTO 21),
					raddr_2=>InstrD(20 DOWNTO 16), waddr=>WriteRegW, rdata_1=>RD1_out,
					rdata_2=>RD2_out, wdata=>ResultW);

	sign_extension_16bitx: sign_extension_16bit PORT MAP(immediate=>InstrD(15 DOWNTO 0),
					sign_extension_out=>SignImmD);

	shiftleft_32bitx: shiftleft_32bit PORT MAP(A_in=>SignImmD, O_out=>shift_out);


end behavior;