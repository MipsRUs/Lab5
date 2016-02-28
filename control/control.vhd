-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: control.vhd
-- Team: MIPS_R_US
-- Members:
-- 		Stefan Cao (ID# 79267250)
--		Ting-Yi Huang (ID# 58106363)
--		Nehme Saikali (ID# 89201494)
--		Linda Vang (ID# 71434490)
--
-- Description:
--		This is a control unit of the processor
--
-- History:
-- 		Date		Update Description			Developer
--	-----------   ----------------------   	  -------------
--	1/19/2016		Created						TH, NS, LV, SC
--	2/4/2016		Updated to work with 		SC 
--					new instructions for
--					Lab3
-- 2/27/2016		Edited for final project 				
-------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY control IS
PORT(
		Op:				IN std_logic_vector(31 downto 26);
		Funct:			IN std_logic_vector(5 downto 0);
		RegWriteD:		OUT std_logic;
		MemtoRegD:		OUT std_logic;
		MemWriteD:		OUT std_logic;
		ALUControlD:	OUT std_logic;
		ALUSrcD: 		OUT std_logic;
		RegDstD:		OUT std_logic;
		BranchD:		OUT std_logic;
		
	);
end control;	