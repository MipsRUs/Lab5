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




-----------------------------------------------
-------------- signals ------------------------
-----------------------------------------------

signal PCSrcD : std_logic;
signal PCPlus4F : std_logic_vector(31 DOWNTO 0);
signal PC_adder_1 : std_logic_vector(31 DOWNTO 0);
signal PC_in : std_logic_vector(31 DOWNTO 0);


------------------- begin --------------------- 
begin

	PCmuxx:	mux PORT MAP(in0=>PCPlus4F, in1=>PC_adder_1, sel=>PCSrcD, outb=>PC_in);





end behavior;