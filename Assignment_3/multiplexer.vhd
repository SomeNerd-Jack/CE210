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
	SIGNAL X, Y : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
	
   X <= SW(3 DOWNTO 0);
   Y <= SW(7 DOWNTO 4);
   S <= SW(9);
	
	-- Defines the multiplexer output range
	LEDR(3 DOWNTO 0) <= X WHEN (S = '1') ELSE Y;
	
	-- Defines LED9 to output the status of S
	LEDR(9) <= S;


END Structure;