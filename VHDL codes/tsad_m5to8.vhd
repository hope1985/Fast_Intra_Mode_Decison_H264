
--==================================== sad =============================
library ieee;
use ieee.std_logic_1164.all;

---------------------------------
-- components :
-- add9bit
-- half_adder
---------------------------------

entity tsad_m5to8 is
  port(
    psad1,psad2 : in std_logic_vector(8 downto 0);
    sign1,sign2 : in  std_logic;
    output : out std_logic_vector(7 downto 0)
    );
end;
architecture arch_tsad_m5to8 of tsad_m5to8 is


component add9bit
  port(
    a,b : in std_logic_vector(8 downto 0);
    cin : in std_logic;
    sum : out std_logic_vector(8 downto 0);
    cout : out std_logic
    );
end component;

component half_adder
  port(
    i,cin : in std_logic;
    s,cout : out std_logic
    );
end component;

signal im1: std_logic_vector(8 downto 0);
signal add_out: std_logic_vector(8 downto 0); 
--signal add_out: std_logic_vector(9 downto 0);
signal c1,cin_ha: std_logic; 
signal im2: std_logic_vector(7 downto 0);
signal carry : std_logic_vector(6 downto 0);  

begin
add : add9bit  port map(a=>psad1,b=>psad2,cin=>sign1,sum=>im1,cout=>c1);
--add_out<=c1&im1;
add_out<=im1;
--==========
cin_ha<= add_out(0) and sign2;
ha0 :  half_adder port map(i=>add_out(1),cin=>cin_ha,s=>im2(0),cout=>carry(0));
gen_ha : for i in 1 to 6 generate 
      ha_i :  half_adder port map(i=>add_out(i+1),cin=>carry(i-1),s=>im2(i),cout=>carry(i));
         end generate;
ha8 : im2(7)<= add_out(8) xor carry(6);        

--===========
output <= im2;
--output <= im2(9 downto 2);  -- shift right

end;
