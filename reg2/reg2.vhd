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
ENTITY reg2 IS 
PORT (
		RegWriteD:		IN std_logic;
		MemtoRegD:		IN std_logic;
		MemWriteD:		IN std_logic;
		ALUControlD:	IN std_logic_vector(2 downto 0);
		ALUSrcD: 		IN std_logic;
		RegDstD:		IN std_logic;
		RD1:			IN std_logic_vector(31 downto 0);
		RD2:			IN std_logic_vector(31 downto 0);
		RsD:			IN std_logic_vector(25 downto 21);
		RtD:			IN std_logic_vector(20 downto 16);
		RdD:			IN std_logic_vector(15 downto 11);
		SignImmD:		IN std_logic_vector(15 downto 0);
		FlushE:			IN std_logic;
		RegWriteE:		OUT std_logic;
		MemtoRegE:		OUT std_logic;
		MemWriteE:		OUT std_logic;
		ALUControlE:	OUT std_logic_vector(2 downto 0);
		ALUSrcE: 		OUT std_logic;
		RegDstE:		OUT std_logic;
		RD1toMux1:		OUT std_logic_vector(31 downto 0);
		RD2toMux2:		OUT std_logic_vector(31 downto 0);
		RsE:			OUT std_logic_vector(25 downto 21);
		RtE:			OUT std_logic_vector(20 downto 16);
		RdE:			OUT std_logic_vector(15 downto 11);
		SignImmE:		OUT std_logic_vector(15 downto 0)
	);
end reg2;