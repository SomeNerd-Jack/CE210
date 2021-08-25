-- 4-bit ripple-carry adder

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Assignment6 IS 
   PORT ( SW   : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
          LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
END Assignment6;

ARCHITECTURE Structure OF Assignment6 IS
   COMPONENT fa
      PORT ( a, b, ci : IN  STD_LOGIC;
             s, co    : OUT STD_LOGIC);
   END COMPONENT;
   SIGNAL A, B, S : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Stores the inputs and the non-sum result bits
   SIGNAL C       : STD_LOGIC_VECTOR(4 DOWNTO 0); -- Stores the carries
BEGIN
   A <= SW(7 DOWNTO 4);
   B <= SW(3 DOWNTO 0);
	C(0) <= SW(8);
	
	--A value, B value, carry bit, output, whether or not it carries to the next bit
	A0: fa PORT MAP (A(0),B(0), C(0), S(0), C(1));
	A1: fa PORT MAP (A(1),B(1), C(1), S(1), C(2));
	A2: fa PORT MAP (A(2),B(2), C(2), S(2), C(3));
	A3: fa PORT MAP (A(3),B(3), C(3), S(3), C(4));

	LEDR(3 DOWNTO 0) <= S;
	LEDR(4) <= C(4);

END Structure;
         

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fa IS
   PORT ( a, b, ci : IN  STD_LOGIC;
          s, co    : OUT STD_LOGIC);
END fa;

ARCHITECTURE Structure OF fa IS
   SIGNAL a_xor_b : STD_LOGIC;
BEGIN
   
	S <= (A XOR B) XOR CI;
	CO <= B WHEN (A = B) ELSE CI;

END Structure;
