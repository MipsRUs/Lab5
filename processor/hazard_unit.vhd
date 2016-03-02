-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: hazard.vhd
-- Team: MIPS_R_US
-- Members:
-- 		Stefan Cao (ID# 79267250)
--		Ting-Yi Huang (ID# 58106363)
--		Nehme Saikali (ID# 89201494)
--		Linda Vang (ID# 71434490)
--
-- Description:
--		This is Hazard Control
--
-- History:
-- 		Date		Update Description			Developer
--	-----------   ----------------------   	  -------------
--	3/1/2016		Created						TH, NS, LV, SC
--
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY hazard_unit IS
	PORT (
		BranchD : IN std_logic;
		RsD: IN std_logic_vector (4 DOWNTO 0);
		RtD: IN std_logic_vector (4 DOWNTO 0);
		RsE: IN std_logic_vector (4 DOWNTO 0);
		RtE: IN std_logic_vector (4 DOWNTO 0);
		WriteRegE: IN std_logic_vector (4 DOWNTO 0);
		WriteRegM: IN std_logic_vector (4 DOWNTO 0);
		WriteRegW: IN std_logic_vector (4 DOWNTO 0);
		MemtoRegE: IN std_logic;
		RegWriteE: IN std_logic;
		RegWriteM: IN std_logic;
		RegWriteW: IN std_logic;
		StallF: OUT std_logic;
		StallD: OUT std_logic;
		ForwardAD: OUT std_logic;
		ForwardBD: OUT std_logic;
		FlushE: OUT std_logic;
		ForwardAE: OUT std_logic_vector (1 DOWNTO 0);
		ForwardBE: OUT std_logic_vector (1 DOWNTO 0)
	);
END hazard_unit;

architecture behavior of hazard_unit is

begin

	variable lwstall : std_logic;
	variable branchstall : std_logic;
	

--ForwardAE
	if ((RsE /= '0') AND (RsE = WriteRegM) AND RegWriteM) then
		ForwardAE <= "10";
	else if ((RsE /= '0') AND (RsE = WriteRegW) AND RegWriteW) then
		ForwardAE <= "01";
	else
		ForwardAE <= "00";
	end if;

--ForwardBE
	if ((RtE /= '0') AND (RtE = WriteRegM) AND RegWriteM) then
		ForwardBE <= "10";
	else if ((RtE /= '0') AND (RtE = WriteRegW) AND RegWriteW) then
		ForwardBE <= "01";
	else
		ForwardBE <= "00";
	end if;
	
--ForwardAD and BD
	-- SC 2016-03-01: commented out 
	--ForwardAD = (RsD != 0) AND (RsD = WriteRegM) AND RegWriteM;
	--ForwardBD = (RtD != 0) AND (RtD = WriteRegM) AND RegWriteM;
	if((RsD /= '0') AND (RsD = WriteRegM) AND RegWriteM) then
		ForwardAD <= '1';
	else 
		ForwardAD <= '0';
	end if;

	if ((RtD /= '0') AND (RtD = WriteRegM) AND RegWriteM);
		ForwardBD <= '1';
	else 
		ForwardBD <= '0';
	end if;


	-- SC 2016-03-01: commneted out
--lw stall
	--lwstall = ((RsD == RtE) OR (RtD == RtE) AND MemtoRegE);
	if((RsD == RtE) OR (RtD == RtE) AND MemtoRegE) then
		lwstall <= '1';
	else 
		lwstall <= '0';
	end if;

--branch stall
	--branchstall = (BranchD AND RegWriteE AND (WriteRegE == RsD OR WriteRegE == RtD)) OR (BranchD AND MemtoRegM AND (WriteRegM == RsD OR WriteRegM == RtD));
	if((BranchD AND RegWriteE AND (WriteRegE == RsD OR WriteRegE == RtD)) OR 
		(BranchD AND MemtoRegM AND (WriteRegM == RsD OR WriteRegM == RtD))) then
		branchstall <= '1';
	else 
		branchstall <= '0';
	end if;

--setting outputs
--StallF = StallD = FlushE = (lwstall OR branchstall);
	if(lwstall OR branchstall) then 
		StallF <= '1';
		StallD <= '1';
		FlushE <= '1';
	else 
		StallF <= '0';
		StallD <= '0';
		FlushE <= '0';

	end if;
	
end behavior;