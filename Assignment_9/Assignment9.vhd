LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Assignment9 IS
	PORT (D, Clk : IN	STD_LOGIC;
	Qa, Qb, Qc : OUT STD_LOGIC);
 END Assignment9;
ARCHITECTURE Behavior OF Assignment9 IS
BEGIN
PROCESS (D, Clk)
BEGIN

IF Clk = '1' THEN
Qa<=D;
END IF ;  

IF Clk'EVENT AND Clk = '1' THEN
	Qb<= D;
END IF;	

IF Clk'EVENT AND Clk = '0' THEN
	Qc<= D; 
END IF;	

END PROCESS ;
END Behavior ;
