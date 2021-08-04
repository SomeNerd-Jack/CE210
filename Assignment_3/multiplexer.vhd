-- Implements four 2-to-1 multiplexers.
-- inputs:	SW3-0 represent the 4-bit input X, and SW7-4 represent Y
-- 		SW9 selects either X or Y to drive the output LEDs
-- outputs: LEDR9-0 show the states of the switches; LEDR3-0 shows the outputs of the multiplexers

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY multiplexer IS
	PORT (
	SW	: IN	STD_LOGIC_VECTOR(9 DOWNTO 0);
	LEDR	: OUT	STD_LOGIC_VECTOR(9 DOWNTO 0));  -- red LEDs
	
END multiplexer;

ARCHITECTURE Structure OF multiplexer IS
	SIGNAL S : STD_LOGIC;
	SIGNAL X, Y, M: STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
	
   X <= SW(3 DOWNTO 0);
   Y <= SW(7 DOWNTO 4);
   S <= SW(9);
	
	-- Defines the multiplexer output range	
	M(3) <= (NOT (s) NAND x(3)) NAND (s NAND y(3));
	M(2) <= (NOT (s) NAND x(2)) NAND (s NAND y(2));
	M(1) <= (NOT (s) NAND x(1)) NAND (s NAND y(1));
	M(0) <= (NOT (s) NAND x(0)) NAND (s NAND y(0));

	
	-- Board specific assignments
	LEDR(3 DOWNTO 0) <= M;
	
	
	-- Defines LED9 to output the status of S
	LEDR(9) <= S;

END Structure;