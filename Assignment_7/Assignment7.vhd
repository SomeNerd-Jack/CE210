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
   A <= SW(7 DOWNTO 4);
   B <= SW(3 DOWNTO 0);
   Cin <= SW(8);
   
   -- add lower two bcd digits. Result is five bits: C1,S0
   T0 <= ('0' & A) + ('0' & B) + Cin;
   PROCESS (T0)
   BEGIN
		IF(T0 > 9) THEN
			Z0 <= "00010";
			C1 <= '1';
		ELSE
			Z0 <= "00000";
			C1 <= '0';
	  
		END IF;

		S0 <= T0 - Z0;
		S1 <= C1;
	END PROCESS;

--Code is not shown -----------------------------------------
   
   -- drive the displays through 7-seg decoders
   digit3: bcd7seg PORT MAP (A, HEX5);
   
--Code is not shown -----------------------------------------
   
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
	CASE bcd IS 					-- 0123456
		WHEN "0000" => display <= "1111110" ;
		WHEN "0001" => display <= "0110000" ;
		WHEN "0010" => display <= "1101101" ;
		WHEN "0011" => display <= "1111001" ;
		WHEN "0100" => display <= "0110011" ;
		WHEN "0101" => display <= "1011011" ;
		WHEN "0110" => display <= "1011111" ;
		WHEN "0111" => display <= "1110000" ;
		WHEN "1000" => display <= "1111111" ;
		WHEN "1001" => display <= "1110011" ;
		WHEN OTHERS => display <= "-------" ;
	END CASE ;
   END PROCESS;
END Behavior;