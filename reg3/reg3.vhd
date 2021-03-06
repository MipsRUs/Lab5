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
		MemWriteE: 	IN std_logic;
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
	process(ref_clk, RegWriteE, MemtoRegE, MemWriteE, alu_in, WriteDataE, WriteRegE)
	variable temp_RegWriteE : 	std_logic := '0';
	variable temp_MemtoRegE : 	std_logic := '0';
	variable temp_MemWriteE:	std_logic := '0';
	variable temp_alu_in:			std_logic_vector(31 DOWNTO 0) := "00000000000000000000000000000000";
	variable temp_WriteDataE:		std_logic_vector(31 DOWNTO 0) := "00000000000000000000000000000000";
	variable temp_WriteRegE:		std_logic_vector(4 DOWNTO 0) := "00000";
	begin
		if(ref_clk'event AND ref_clk='0') then 
			temp_RegWriteE := RegWriteE;
			temp_MemtoRegE := MemtoRegE;
			temp_MemWriteE := MemWriteE;
			temp_alu_in := std_logic_vector(unsigned(alu_in));
			temp_WriteDataE := std_logic_vector(unsigned(WriteDataE));
			temp_WriteRegE := std_logic_vector(unsigned(WriteRegE));
		end if;
		RegWriteM <= temp_RegWriteE;
		MemtoRegM <= temp_MemtoRegE;
		MemWriteM <= temp_MemWriteE;
		alu_out <= temp_alu_in;
		WriteDataM <= temp_WriteDataE;
		WriteRegM <= temp_WriteRegE;
	end process;
end;
