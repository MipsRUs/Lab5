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
--	2/2016		Created						TH, NS, LV, SC
--
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY hazard IS
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
END hazard ;

architecture behavior of hazard is

begin

	variable lwstall : std_logic;
	variable branchstall : std_logic;
	

--ForwardAE
	if ((RsE != 0) AND (RsE = WriteRegM) AND RegWriteM) then
		ForwardAE = 10;
	else if ((RsE != 0) AND (RsE = WriteRegW) AND RegWriteW) then
		ForwardAE = 01;
	else
		ForwardAE = 00;
	
--BE	
	if ((RtE != 0) AND (RtE = WriteRegM) AND RegWriteM) then
		ForwardBE = 10;
	else if ((RtE != 0) AND (RtE = WriteRegW) AND RegWriteW) then
		ForwardBE = 01;
	else
		ForwardBE = 00;
	
--ForwardAD and BD
	ForwardAD = (RsD != 0) AND (RsD = WriteRegM) AND RegWriteM;
	
	ForwardBD = (RtD != 0) AND (RtD = WriteRegM) AND RegWriteM;
	
--lw stall
	lwstall = ((RsD == RtE) OR (RtD == RtE) AND MemtoRegE);
	
--branch stall
	branchstall = (BranchD AND RegWriteE AND (WriteRegE == RsD OR WriteRegE == RtD)) OR (BranchD AND MemtoRegM AND (WriteRegM == RsD OR WriteRegM == RtD));

--setting outputs
StallF = StallD = FlushE = (lwstall OR branchstall);
	
end behavior;