-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: equal_comparison.vhd
-- Team: MIPS_R_US
-- Members:
-- 		Stefan Cao (ID# 79267250)
--		Ting-Yi Huang (ID# 58106363)
--		Nehme Saikali (ID# 89201494)
--		Linda Vang (ID# 71434490)
--
-- Description:
--		compares two 32-bits inputs and output 1 if equal
--
-- History:
--     Date	    Update Description	            Developer
--  -----------   ----------------------   	  -------------
--   2/27/2016		Created			  TH, NS, LV, SC
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY equal_comparison IS 
	port (
		in0 : IN std_logic_vector(31 DOWNTO 0);
		in1 : IN std_logic_vector(31 DOWNTO 0);
		outb : OUT std_logic
	);
END equal_comparison;

architecture behavior of equal_comparison is

begin
	process(in0, in1)
	begin

		if(in0=in1) then 
			outb <= '1';
		else 
			outb <= '0';
		end if;

	end process;
end;











