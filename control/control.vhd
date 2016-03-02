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
		
		-----------------------------------------------------
		------------------Control Enables--------------------
		-----------------------------------------------------
		
		--write enable for regfile
		-- '0' if read, '1' if write
		RegWriteD:		OUT std_logic;
		
		--selecting output data from memory or ALU result
		-- '1' if ALU result, '0' if mem result
		MemtoRegD:		OUT std_logic;
		
		--write enable for data memory
		-- '0' if not writing to mem, '1' if writing to mem
		MemWriteD:		OUT std_logic;
		
		--
		ALUControlD:	OUT std_logic;
		
		--selecting sign extend of raddr2
		-- '0' if raddr2 result , '1' if sign extend result
		ALUSrcD: 		OUT std_logic;
		
		--selecting rtE or rdE to be written into regfile
		-- '0' if rtE, '1' if rdE
		RegDstD:		OUT std_logic;
		
		--
		BranchD:		OUT std_logic
		
	);
end control;	