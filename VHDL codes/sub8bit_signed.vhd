  --=====================================sub 8bit (signed) ===========================================
library ieee;
use ieee.std_logic_1164.all;
---------------------------------
-- components :
-- full_adder
---------------------------------
entity sub8bit_signed is
  port(
    a,b : in std_logic_vector(7 downto 0);
    --cin : in std_logic;
    sub : out std_logic_vector(8 downto 0)
    --cout: out std_logic
    );
end;

architecture arch_sub8bit_signed of sub8bit_signed is
component full_adder   port(
    a,b,cin : in std_logic;
    sum,cout:out std_logic
    );
end component; 
 signal a9,b9 : std_logic_vector(8 downto 0);
 signal carry : std_logic_vector(8 downto 0);  
 signal not_b : std_logic_vector(8 downto 0); 
begin
a9<='0'&a;
b9<='0'&b;  
not_b <= NOT b9;
b0 : full_adder port map(a=>a9(0),b=>not_b(0),cin=>'1',sum=>sub(0),cout=>carry(0));
g_sub : for i in 1 to 7 generate
bi : full_adder port map(a=>a9(i),b=>not_b(i),cin=>carry(i-1),sum=>sub(i),cout=>carry(i));
end generate;
--b8 : full_adder port map(a=>a9(8),b=>not_b(8),cin=>carry(7),sum=>sub(8),cout=>cout);
b8 : full_adder port map(a=>a9(8),b=>not_b(8),cin=>carry(7),sum=>sub(8),cout=>carry(8));
end;

