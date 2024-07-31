
--================================== mode 5 to 8=================================================

library ieee;
use ieee.std_logic_1164.all;

---------------------------------
-- components :
-- add9bit
---------------------------------

entity sad_m5to8 is
port(
  a1,b1,a2,b2 : in std_logic_vector(8 downto 0);
  sign_ab1,sign_ab2 : out  std_logic;
  sum_a1b1 : out std_logic_vector(8 downto 0);
  sum_a2b2 : out std_logic_vector(8 downto 0)
  );
end;

architecture arch_sad_m5to8 of sad_m5to8 is
  

component add9bit
  port(
    a,b : in std_logic_vector(8 downto 0);
    cin : in std_logic;
    sum : out std_logic_vector(8 downto 0);
    cout: out std_logic
    );
end component;
signal c1,c2 : std_logic;
signal im1,im2 : std_logic_vector(8 downto 0); 
signal sg_im1,sg_im2 :  std_logic; 
begin
  
add1 : add9bit port map(a=>a1,b=>b1,cin=>'0',sum=>im1,cout=>c1);
add2 : add9bit port map(a=>a2,b=>b2,cin=>'0',sum=>im2,cout=>c2);
--==========
sg_im1<= ( not c1 and (a1(8) or b1(8)) ) or (a1(8) and b1(8));
sg_im2<=  ( not c2 and (a2(8) or b2(8)) ) or (a2(8) and b2(8));
gen_com1 : for i in 0 to 8 generate  
          sum_a1b1(i)<= sg_im1 xor im1(i);
          sum_a2b2(i)<= sg_im2 xor im2(i);
     end generate;
     
--com1_im1(8)<='0';  
--com1_im2(8)<='0'; 

sign_ab1<=sg_im1;
sign_ab2<=sg_im2;
end;

