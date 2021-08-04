-- Implements a circuit that can display characters on a 7-segment display. 
-- inputs:  SW1-0 selects the letter to display. The characters are:
--    SW  1 0  Char
--    ----------------
--        0 0 'd'
--        0 1 'E'
--        1 0 '1'
--        1 1 '0'
-- outputs: LEDR2-0 show the states of the switches
--          HEX0 displays the selected character

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Assignment4 IS 
   PORT ( SW    : IN   STD_LOGIC_VECTOR(1 DOWNTO 0);   -- toggle switches
          LEDR  : OUT  STD_LOGIC_VECTOR(9 DOWNTO 0);   -- red LEDs
          HEX0  : OUT  STD_LOGIC_VECTOR(0 TO 6));      -- 7-seg display
END Assignment4;

ARCHITECTURE Structure OF Assignment4 IS
   SIGNAL C : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
   LEDR(1 DOWNTO 0) <= SW;
   LEDR(9 DOWNTO 2) <= "00000000";

   C <= SW;
   --
   --       0  
   --      ---  
   --     |   |
   --    5|   |1
   --     | 6 |
   --      ---  
   --     |   |
   --    4|   |2
   --     |   |
   --      ---  
   --       3  
   --
	
   HEX0(0) <= (NOT(C(1)) AND NOT(C(0))) OR (C(1) AND NOT(C(0)));	-- A
	
	HEX0(1) <= (NOT(C(1)) AND C(0));											-- B
	HEX0(2) <= (NOT(C(1)) AND C(0));											-- B
	
	HEX0(3) <= ((C(1)) AND NOT(C(0)));										-- C
	HEX0(4) <= ((C(1)) AND NOT(C(0)));										-- C
	
	HEX0(5) <= (NOT(C(1)) AND NOT(C(0))) OR (C(1) AND NOT(C(0)));	-- A
	
	HEX0(6) <= (C(1) AND NOT(C(0))) OR (C(1) AND C(0));				-- D

END Structure;
