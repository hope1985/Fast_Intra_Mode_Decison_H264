--==================================mode 0 to 4=================================================

library ieee;
use ieee.std_logic_1164.all;

---------------------------------
-- components :
-- add8bit
---------------------------------

entity sad_m0to4 is
  port(
    a1,b1,a2,b2 : in std_logic_vector(8 downto 0);
    sign_b1,sign_b2 : out  std_logic;
    sum_a1b1 : out std_logic_vector(8 downto 0);
    sum_a2b2 : out std_logic_vector(8 downto 0)
    );
end;

architecture arch_sad_m0to4 of sad_m0to4 is

component add8bit
  port(
    a,b : in std_logic_vector(7 downto 0);
    cin : in std_logic;
    sum : out std_logic_vector(7 downto 0);
    cout : out std_logic
    );
end component;

signal com1_a1,com1_b1,com1_a2,com1_b2,im1,im2 : std_logic_vector(7 downto 0);  
signal c1,c2 : std_logic;
signal carry : std_logic_vector(7 downto 0);  
begin
  
gen_com1 : for i in 0 to 7 generate  
          com1_a1(i)<= a1(8) xor a1(i);
          com1_b1(i)<= b1(8) xor b1(i);
          com1_a2(i)<= a2(8) xor a2(i);
          com1_b2(i)<= b2(8) xor b2(i);
     end generate;
--com1_a1(8)<='0';  --when a1(8)='1' else a1(8);  
--com1_b1(8)<='0';  --when b1(8)='1 else b1(8);
--com1_a2(8)<='0';  --when a2(8)='1' else a2(8);
--com1_b2(8)<='0';  --when b2(8)='1' else b2(8);    

add1 : add8bit  port map(a=>com1_a1,b=>com1_b1,cin=>a1(8),sum=>im1,cout=>c1);
add2 : add8bit  port map(a=>com1_a2,b=>com1_b2,cin=>a2(8),sum=>im2,cout=>c2);
sum_a1b1 <=c1&im1;
sum_a2b2 <=c2&im2;
sign_b1 <=b1(8);
sign_b2 <=b2(8);
end;
