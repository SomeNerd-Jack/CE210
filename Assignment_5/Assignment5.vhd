
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Implements a circuit that can display different 4-letter words on four 7-segment
-- displays. The character selected for each display is chosen by the
-- sequence 00, 01, 10, 11. Using the four characters d,
-- E, 1, 0, the display, such as "dE10", as follows:

-- outputs: LEDR shows the states of the switches
-- HEX3 - HEX0 displays the characters 



ENTITY Assignment5 IS 
	PORT (	SW		: IN	STD_LOGIC_VECTOR(9 DOWNTO 0);
		LEDR		: OUT	STD_LOGIC_VECTOR(9 DOWNTO 0);
		HEX3, HEX2, HEX1, HEX0	: OUT	STD_LOGIC_VECTOR(0 TO 6));
END Assignment5;

ARCHITECTURE Structure OF Assignment5 IS

	COMPONENT char_7seg1
		PORT (	C	: 	IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
			Display	: 	OUT STD_LOGIC_VECTOR(0 TO 6));
	END COMPONENT;
	SIGNAL Ch1, Ch2, Ch3, Ch4:	STD_LOGIC_VECTOR(1 DOWNTO 0);
	
	BEGIN

	LEDR <= SW;
   Ch1 <= SW(1 DOWNTO 0);
	Ch2 <= SW(3 DOWNTO 2);
	Ch3 <= SW(5 DOWNTO 4);
	Ch4 <= SW(7 DOWNTO 6);
	

	-- instantiate char_7seg (C, Display);
	H0: char_7seg1 PORT MAP (Ch1, HEX0);
	H1: char_7seg1 PORT MAP (Ch2, HEX1);
	H2: char_7seg1 PORT MAP (Ch3, HEX2);
	H3: char_7seg1 PORT MAP (Ch4, HEX3);
	
	
END Structure;



LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY char_7seg1 IS
	PORT (	C	: IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);
		Display	: OUT STD_LOGIC_VECTOR(0 TO 6));
END char_7seg1;


ARCHITECTURE Behavior OF char_7seg1 IS
BEGIN

	Display(0) <= (NOT(C(0)));					-- A
	
	Display(1) <= (NOT(C(1)) AND C(0));		-- B
	Display(2) <= (NOT(C(1)) AND C(0));		-- B
	
	Display(3) <= (C(1)) AND NOT(C(0));		-- C
	Display(4) <= (C(1)) AND NOT(C(0));		-- C
	
	Display(5) <= (NOT(C(0)));					-- A
	
	Display(6) <= (C(1));						-- D
	
        
END Behavior;