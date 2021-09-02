-- implements a two-digit bcd adder S2 S1 S0 = A1 A0 + B1 B0
-- inputs:   SW7-4 = A
--           SW3-0 = B
--           SW8 = Cin
-- outputs:  A is displayed on HEX5
--           B is displayed on HEX3
--           S1 S0 is displayed on HEX1 HEX0

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY Assignment7 IS 
   PORT ( SW : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
          HEX5, HEX4, HEX3, HEX2, HEX1, HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6));
END Assignment7;

ARCHITECTURE Behavior OF Assignment7 IS
   COMPONENT bcd7seg
      PORT ( bcd     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
             display : OUT STD_LOGIC_VECTOR(0 TO 6));
   END COMPONENT;

   SIGNAL A, B : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL Cin  : STD_LOGIC;
   SIGNAL S0   : STD_LOGIC_VECTOR(4 DOWNTO 0);
   SIGNAL S1   : STD_LOGIC;
   SIGNAL C1   : STD_LOGIC;

   SIGNAL Z0 : STD_LOGIC_VECTOR(4 DOWNTO 0);   -- used for BCD addition
   SIGNAL T0 : STD_LOGIC_VECTOR(4 DOWNTO 0);   -- used for BCD addition
BEGIN
   A <= SW(7 DOWNTO 4);	-- A value should be entered with switches 7-4 (inclusive)
   B <= SW(3 DOWNTO 0); -- B value should be entered with switches 3-0 (inclusive)
   Cin <= SW(8);			-- Carry-in value should be entered with switch 8

   -- add lower two bcd digits. Result is five bits: C1,S0
   T0 <= ('0' & A) + ('0' & B) + Cin; -- This is the total addition statement, and ('0' & X) just APPENDS a 0 to X
	
   PROCESS (T0)
   BEGIN
		IF(T0 > 9) THEN 	-- If the result of the addition is 10 or more, it needs to be carried
			Z0 <= "01010"; -- Assign value of the carry to decimal 10
			C1 <= '1';		-- Carry bit
		ELSE
			Z0 <= "00000";	-- Assign value of the carry to decimal 0
			C1 <= '0';		-- Carry bit
		END IF;

		S0 <= T0 - Z0; -- Subtract the carry value from the total additive result to get the least significant digit
		S1 <= C1; -- Whether or not the most significant digit should be "1" or "0"
	END PROCESS;
   
   -- Display values through 7-seg decoders
   displayA:	bcd7seg PORT MAP (A, HEX5); -- Display A and B
	displayB:	bcd7seg PORT MAP (B, HEX3);
	
	
	displayS1: bcd7seg PORT MAP ("000" & S1, HEX1); -- Display the most significant digit of the result
	
	displayS0:	bcd7seg PORT MAP (S0(3 DOWNTO 0), HEX0);	--Display the least significant digit of the result
	
	turnOffDisplay1: bcd7seg PORT MAP ("1111", HEX2); -- Turn off displays 2 and 4 to clean up the output
	turnOffDisplay2: bcd7seg PORT MAP ("1111", HEX4);
   
END Behavior;
         
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bcd7seg IS
   PORT ( bcd : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      display : OUT STD_LOGIC_VECTOR(0 TO 6));
END bcd7seg;

ARCHITECTURE Behavior OF bcd7seg IS
BEGIN
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
   PROCESS (bcd)
   BEGIN
		CASE bcd IS 					-- 0123456 (These are the corresponding digit bits)
			WHEN "0000" => display <= "0000001" ; -- The display is active low, so 1 is off and 0 is on
			WHEN "0001" => display <= "1001111" ;
			WHEN "0010" => display <= "0010010" ;
			WHEN "0011" => display <= "0000110" ;
			WHEN "0100" => display <= "1001100" ;
			WHEN "0101" => display <= "0100100" ;
			WHEN "0110" => display <= "0100000" ;
			WHEN "0111" => display <= "0001111" ;
			WHEN "1000" => display <= "0000000" ;
			WHEN "1001" => display <= "0001100" ;
			WHEN OTHERS => display <= "1111111" ; -- If the input is any other value (>9 or <0), turn off the display
		END CASE;
   END PROCESS;
END Behavior;
