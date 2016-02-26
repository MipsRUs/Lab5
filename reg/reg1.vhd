-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: buffer_2_woe.vhd
-- Team: MIPS_R_US
-- Members:
-- 		Stefan Cao (ID# 79267250)
--		Ting-Yi Huang (ID# 58106363)
--		Nehme Saikali (ID# 89201494)
--		Linda Vang (ID# 71434490)
--
-- Description:
--		buffer with clk, 2 inputs, and 3outputs
--
-- History:
--     Date	    Update Description	            Developer
--  -----------   ----------------------   	  -------------
--   2/25/2016		Created			  TH, NS, LV, SC
-------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY reg1 IS 
PORT (
		ref_clk : IN std_logic;
		DataI_A : IN std_logic_vector(31 DOWNTO 0);
		DataI_B : IN std_logic_vector(31 DOWNTO 0);
		clren:	  IN std_logic; --enable stallD
		DataO_A : OUT std_logic_vector(31 DOWNTO 0);
		DataO_B: OUT std_logic_vector(31 DOWNTO 0)
		
	);
end reg1;
architecture behavior of reg1 is
begin
	process(ref_clk, DataI_A, DataI_B, clren)
		variable temp_A : std_logic_vector(31 DOWNTO 0);
		variable temp_B : std_logic_vector(31 DOWNTO 0);
		
	begin
		if(ref_clk'event AND ref_clk='0') then
			if(clren = '1') then
				temp_A := std_logic_vector(unsigned(DataI_A));
				temp_B := std_logic_vector(unsigned(DataI_B));
			end if;
		end if;
		DataO_A <= temp_A;
		DataO_B <= temp_B;
	end process;
end;
 