-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved
--
-- File: reg3.vhd
-- Team: MIPS_R_US
-- Members:
--              Stefan Cao (ID# 79267250)
--              Ting-Yi Huang (ID# 58106363)
--              Nehme Saikali (ID# 89201494)
--              Linda Vang (ID# 71434490)
--
-- Description:
--              buffer with clk, 7 inputs, and 6 outputs
--
-- History:
--     Date         Update Description              Developer
--  -----------   ----------------------          -------------
--   2/27/2016          Created                   TH, NS, LV, SC
-------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY reg3 IS
	PORT (
		ref_clk : 		IN std_logic;
		RegWriteE : 	IN std_logic;
		MemtoRegE : 	IN std_logic;
		MemtoWriteE: 	IN std_logic;
		alu_in:			IN std_logic_vector(31 DOWNTO 0);
		WriteDataE:		IN std_logic_vector(31 DOWNTO 0);
		WriteRegE:		IN std_logic_vector(4 DOWNTO 0);

		RegWriteM : 	OUT std_logic;
		MemtoRegM : 	OUT std_logic;
		MemWriteM : 	OUT std_logic;
		alu_out:		OUT std_logic_vector(31 DOWNTO 0);
		WriteDataM:		OUT std_logic_vector(31 DOWNTO 0);
		WriteRegM:		OUT std_logic_vector(4 DOWNTO 0)				
        );
	end reg3;

architecture behavior of reg3 is
begin

end;
