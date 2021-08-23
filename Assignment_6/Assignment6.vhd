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
   SIGNAL A, B, S : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL C       : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
   A <= SW(7 DOWNTO 4);
   B <= SW(3 DOWNTO 0);
   
--Code is not shown-------------------------------

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
   
--Code is not shown-----------------------

END Structure;
