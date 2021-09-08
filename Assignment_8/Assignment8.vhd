LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Assignment8 IS
PORT( x1, x2, x3 : IN STD_LOGIC;
f: OUT STD_LOGIC);
END Assignment8;
ARCHITECTURE Assignment8_rtl OF Assignment8 IS
BEGIN
f <= (x1 AND x2) OR (x1 AND x3) OR (x2 AND x3);
END Assignment8_rtl;