--==================================add 9bit ===========================================

library ieee;
use ieee.std_logic_1164.all;

---------------------------------
-- components :
-- full_adder
---------------------------------
entity add9bit is
  port(
    a,b : in std_logic_vector(8 downto 0);
    cin : in std_logic;
    sum : out std_logic_vector(8 downto 0);
    cout: out std_logic
    );
end;

architecture arch_add9bit of add9bit is
component full_adder   port(
    a,b,cin : in std_logic;
    sum,cout:out std_logic
    );
end component;
 signal carry : std_logic_vector(7 downto 0);  
begin
b0 : full_adder port map(a=>a(0),b=>b(0),cin=>cin,sum=>sum(0),cout=>carry(0));
g_adder : for i in 1 to 7 generate 
bi : full_adder port map(a=>a(i),b=>b(i),cin=>carry(i-1),sum=>sum(i),cout=>carry(i));
end generate;
b7 : full_adder port map(a=>a(8),b=>b(8),cin=>carry(7),sum=>sum(8),cout=>cout);
end;
