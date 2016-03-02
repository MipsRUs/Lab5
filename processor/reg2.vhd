-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: reg2.vhd
-- Team: MIPS_R_US
-- Members:
-- 		Stefan Cao (ID# 79267250)
--		Ting-Yi Huang (ID# 58106363)
--		Nehme Saikali (ID# 89201494)
--		Linda Vang (ID# 71434490)
--
-- Description:
--		buffer with clk, 3 inputs, and 2 outputs
--
-- History:
--     Date	    Update Description	            Developer
--  -----------   ----------------------   	  -------------
--   2/25/2016		Created			  TH, NS, LV, SC
-------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
ENTITY reg2 IS 
PORT (
		ref_clk: 		IN std_logic;
		RegWriteD:		IN std_logic;
		MemtoRegD:		IN std_logic;
		MemWriteD:		IN std_logic;
		ALUControlD:	IN std_logic_vector(5 downto 0);
		ALUSrcD: 		IN std_logic;
		RegDstD:		IN std_logic;
		RD1:			IN std_logic_vector(31 downto 0);
		RD2:			IN std_logic_vector(31 downto 0);
		RsD:			IN std_logic_vector(25 downto 21);
		RtD:			IN std_logic_vector(20 downto 16);
		RdD:			IN std_logic_vector(15 downto 11);
		SignImmD:		IN std_logic_vector(31 downto 0);
		clr:			IN std_logic;
		RegWriteE:		OUT std_logic;
		MemtoRegE:		OUT std_logic;
		MemWriteE:		OUT std_logic;
		ALUControlE:	OUT std_logic_vector(5 downto 0);
		ALUSrcE: 		OUT std_logic;
		RegDstE:		OUT std_logic;
		RD1toMux1:		OUT std_logic_vector(31 downto 0);
		RD2toMux2:		OUT std_logic_vector(31 downto 0);
		RsE:			OUT std_logic_vector(25 downto 21);
		RtE:			OUT std_logic_vector(20 downto 16);
		RdE:			OUT std_logic_vector(15 downto 11);
		SignImmE:		OUT std_logic_vector(31 downto 0)
	);
end reg2;
architecture behavior of reg2 is
begin
	process(ref_clk, RegWriteD, MemtoRegD, MemWriteD, ALUControlD, ALUSrcD, RegDstD, RD1, RD2, RsD, RtD, RdD, SignImmD, clr)
		variable RegWriteD_tmp:		std_logic;
		variable MemtoRegD_tmp:		std_logic;
		variable MemWriteD_tmp:		std_logic;
		variable ALUControlD_tmp:	std_logic_vector(5 downto 0);
		variable ALUSrcD_tmp: 		std_logic;
		variable RegDstD_tmp:		std_logic;
		variable RD1_tmp:		std_logic_vector(31 downto 0);
		variable RD2_tmp:		std_logic_vector(31 downto 0);
		variable RsD_tmp:		std_logic_vector(25 downto 21);
		variable RtD_tmp:		std_logic_vector(20 downto 16);
		variable RdD_tmp:		std_logic_vector(15 downto 11);
		variable SignImmD_tmp:		std_logic_vector(15 downto 0);
	begin
		if rising_edge(ref_clk) then
			if(clr = '1') then
				RegWriteD_tmp:= RegWriteD;
				MemtoRegD_tmp:= MemtoRegD;
				MemWriteD_tmp:= MemWriteD;
				ALUControlD_tmp := ALUControlD;
				ALUSrcD_tmp := ALUSrcD;
				RegDstD_tmp := RegDstD;
				RD1_tmp := std_logic_vector(unsigned(RD1));
				RD2_tmp := std_logic_vector(unsigned(RD2));
				RsD_tmp := std_logic_vector(unsigned(RsD));
				RtD_tmp := std_logic_vector(unsigned(RtD));
				RdD_tmp := std_logic_vector(unsigned(RdD));
				SignImmD_tmp := std_logic_vector(unsigned(SignImmD));
			end if;
		end if;
		RegWriteE <= RegWriteD_tmp;
                MemtoRegE <= MemtoRegD_tmp;
                MemWriteE <= MemWriteD_tmp;
                ALUControlE <= ALUControlD_tmp;
                ALUSrcE <= ALUSrcD_tmp;
                RegDstE <= RegDstD_tmp;
		RD1toMux1 <= RD1_tmp;
		RD2toMux2 <= RD2;
		RsE <= RsD;
		RtE <= RtD;
		RdE <= RdD;
		SignImmE <= SignImmD;
	end process;
end;	
		
