
--=============================== comparator (4bit)===========================================
library ieee;
use ieee.std_logic_1164.all;

entity comparator4bit is
     generic(n:integer:=4);
  port(
    a,b   : in std_logic_vector(n-1 downto 0);
    a_g_b : out std_logic;
    a_e_b : out std_logic
    );
end;
architecture arch_comparator4bit of comparator4bit is
signal g,e: std_logic_vector(n-2 downto 0);
signal g_out,e_out : std_logic;
begin
g(n-2)<=a(n-1)and (not b(n-1));
e(n-2)<=a(n-1) xnor b(n-1);
g_cmp : for i in n-2 downto 1 generate
g(i-1)<=( e(i) and a(i)and (not b(i)) ) or g(i);
e(i-1)<=e(i) and ( a(i) xnor b(i) );  
end generate;
a_g_b <=( e(0) and a(0)and (not b(0)) ) or g(0);
a_e_b <= e(0) and ( a(0) xnor b(0) ); 
end;