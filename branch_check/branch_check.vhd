-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: branch_check.vhd
-- Team: MIPS_R_US
-- Members:
-- 		Stefan Cao (ID# 79267250)
--		Ting-Yi Huang (ID# 58106363)
--		Nehme Saikali (ID# 89201494)
--		Linda Vang (ID# 71434490)
--
-- Description:
--		this component compares for branch instructions
--
-- History:
--     Date	    Update Description	            Developer
--  -----------   ----------------------   	  -------------
--   3/4/2016		Created			  TH, NS, LV, SC
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY equal_comparison IS 
	port (
		A_in : IN std_logic_vector(31 DOWNTO 0);
		B_in : IN std_logic_vector(31 DOWNTO 0);
		ALUControl : IN std_logic_vector(5 DOWNTO 0);
		outb : OUT std_logic
	);
END equal_comparison;

architecture behavior of equal_comparison is

begin
	process(A_in, B_in, ALUControl)

	variable zero : std_logic_vector (31 DOWNTO 0) 
		:= "00000000000000000000000000000000";


	begin

		case ALUControl is

		-- BLTZ
		when "111000" =>
			if(A_in < zero) then 
				outb <= '1';
			else 
				outb <= '0';
			end if;

		-- BGEZ
		when "111001" =>
			if(A_in >= zero) then 
				outb <= '1';
			else 
				outb <= '0';
			end if;

		--BEQ
		when "111100" =>
			if(A_in = B_in) then 
				outb <= '1';
			else 
				outb <= '0';
			end if;

		--BNE
		when "111101" =>
			if(A_in /= B_in) then 
				outb <= '1';
			else
				outb <= '0';
			end if;

		--BLEZ
		when "111110" =>
			if(A_in <= zero) then 
				outb <= '1';
			else 
				outb <= '0';
			end if;
				
		--BGTZ
		when "111111" =>
			if(A_in > zero) then 
				outb <= '1';
			else 	
				outb <= '0';
			end if;
			
			when others =>
				outb <= zero;

		end case;

	end process;
end;











