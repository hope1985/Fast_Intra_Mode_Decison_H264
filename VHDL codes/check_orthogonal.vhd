--=====================================check orthogonal modes===========================================
library ieee;
use ieee.std_logic_1164.all;

---------------------------------
-- components :
--  add8bit
--  sub8bit_signed 
---------------------------------
entity check_orthogonal is
  port(
    in1,in2 : in std_logic_vector(7 downto 0);
    dif_sadx2,sum_sad : out std_logic_vector(8 downto 0);
    a_goe_b : out std_logic
    );
end;

architecture arch_check_orthogonal of check_orthogonal is
--==============
component add8bit  port(
    a,b : in std_logic_vector(7 downto 0);
    cin : in std_logic;
    sum : out std_logic_vector(7 downto 0);
    cout: out std_logic
    );
end component;
--==============
component sub8bit_signed  port(
    a,b : in std_logic_vector(7 downto 0);
    sub : out std_logic_vector(8 downto 0)
    );
end component;
    
signal add :  std_logic_vector(7 downto 0);
--signal com1_8bit :  std_logic_vector(7 downto 0); 
signal com1_9bit :  std_logic_vector(8 downto 0); 
signal sub:  std_logic_vector(8 downto 0); 
signal cout_add : std_logic;
begin

add1 : add8bit port map(a=>in1,b=>in2,cin=>'0',sum=>add,cout=>cout_add);
sum_sad <= cout_add&add;  

sub1 : sub8bit_signed port map(a=>in1,b=>in2,sub=>sub);
a_goe_b <= sub(8);

--xor of subtract (complement 1)
--gen_com1 : for i in 0 to 7 generate  
--          com1_8bit(i)<= sub(8) xor sub(i);
--     end generate; 

--xor of subtract (complement 1)
--gen_com1 : for i in 0 to 7 generate  
          --com1_8bit(i)<= sub(8) xor sub(i);
     --end generate; 
     
--shif left (x2)    
--dif_sadx2<= com1_8bit&'0';


--shif left (x2) and xor with sign bit
com1_9bit(0) <=sub(8);   --sub(8) xor '0'

--xor of subtract (complement 1)
gen_com1 : for i in 1 to 8 generate  
          com1_9bit(i)<= sub(8) xor sub(i-1);
     end generate; 
     
--shift left (x2)    
--dif_sadx2<= com1_8bit&'0';

dif_sadx2<= com1_9bit;  
 
end;

