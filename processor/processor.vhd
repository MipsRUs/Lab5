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

signal StallF : std_logic;
signal StallD : std_logic;


------------------- begin --------------------- 
begin

	PCmuxx:	mux PORT MAP(in0=>PCPlus4F, in1=>PC_adder_1, sel=>PCSrcD, outb=>PC_in);

	PC_reg: buffer_e PORT MAP(ref_clk=>ref_clk, WE=>StallF, DataI=>PC_in, DataO=>PCF);

	IR: rom PORT MAP(addr=>PCF, dataOut=>IR_out);

	PCadder: adder PORT MAP(a=>PCF, b=>adder_value_4, sum=>PCPlus4F);

	Reg1: reg1 PORT MAP(ref_clk=>ref_clk, DataI=>IR_out, en=>stallD, clr=>PCSrcD,
					DataO=>InstrD);




end behavior;