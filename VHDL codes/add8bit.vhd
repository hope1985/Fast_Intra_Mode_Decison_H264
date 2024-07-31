--===================================== add 8bit ===========================================

library ieee;
use ieee.std_logic_1164.all;

---------------------------------
-- components :
-- full_adder
---------------------------------
entity add8bit is
  port(
    a,b : in std_logic_vector(7 downto 0);
    cin : in std_logic;
    sum : out std_logic_vector(7 downto 0);
    cout: out std_logic
    );
end;

architecture arch_add8bit of add8bit is
component full_adder   port(
    a,b,cin : in std_logic;
    sum,cout:out std_logic
    );
end component;
 signal carry : std_logic_vector(6 downto 0);  
begin
b0 : full_adder port map(a=>a(0),b=>b(0),cin=>cin,sum=>sum(0),cout=>carry(0));
g_adder : for i in 1 to 6 generate 
bi : full_adder port map(a=>a(i),b=>b(i),cin=>carry(i-1),sum=>sum(i),cout=>carry(i));
end generate;
b7 : full_adder port map(a=>a(7),b=>b(7),cin=>carry(6),sum=>sum(7),cout=>cout);
end;

