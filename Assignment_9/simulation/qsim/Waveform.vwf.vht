-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "09/08/2021 15:05:38"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Assignment9
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Assignment9_vhd_vec_tst IS
END Assignment9_vhd_vec_tst;
ARCHITECTURE Assignment9_arch OF Assignment9_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Clk : STD_LOGIC;
SIGNAL D : STD_LOGIC;
SIGNAL Qa : STD_LOGIC;
SIGNAL Qb : STD_LOGIC;
SIGNAL Qc : STD_LOGIC;
COMPONENT Assignment9
	PORT (
	Clk : IN STD_LOGIC;
	D : IN STD_LOGIC;
	Qa : OUT STD_LOGIC;
	Qb : OUT STD_LOGIC;
	Qc : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Assignment9
	PORT MAP (
-- list connections between master ports and signals
	Clk => Clk,
	D => D,
	Qa => Qa,
	Qb => Qb,
	Qc => Qc
	);

-- Clk
t_prcs_Clk: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		Clk <= '0';
		WAIT FOR 200000 ps;
		Clk <= '1';
		WAIT FOR 200000 ps;
	END LOOP;
	Clk <= '0';
WAIT;
END PROCESS t_prcs_Clk;

-- D
t_prcs_D: PROCESS
BEGIN
	D <= '0';
	WAIT FOR 100000 ps;
	D <= '1';
	WAIT FOR 140000 ps;
	D <= '0';
	WAIT FOR 60000 ps;
	D <= '1';
	WAIT FOR 60000 ps;
	D <= '0';
	WAIT FOR 60000 ps;
	D <= '1';
	WAIT FOR 60000 ps;
	D <= '0';
	WAIT FOR 60000 ps;
	D <= '1';
	WAIT FOR 40000 ps;
	D <= '0';
	WAIT FOR 60000 ps;
	D <= '1';
	WAIT FOR 60000 ps;
	D <= '0';
	WAIT FOR 60000 ps;
	D <= '1';
	WAIT FOR 140000 ps;
	D <= '0';
WAIT;
END PROCESS t_prcs_D;
END Assignment9_arch;
