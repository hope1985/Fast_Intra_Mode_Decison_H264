
library ieee;
use ieee.std_logic_1164.all;
---------------------------------
-- components :
--  comparator4bit 
---------------------------------
entity select_lu16c8 is
  port(acc0_c8i16,acc1_c8i16,acc3_c8i16 : in std_logic_vector(3 downto 0);
       chroma : in std_logic;
       sel_m0,sel_m1,sel_m3 : out std_logic
       );
end;
architecture arch_select_lu16c8 of select_lu16c8 is
--================== 
component comparator4bit 
  port(
    a,b   : in std_logic_vector(3 downto 0);
    a_g_b : out std_logic;
    a_e_b : out std_logic
    );
end component;
--================== 
signal m0_goe_m1,m1_goe_m3,m0_goe_m3 :std_logic;
signal m0_g_m1,m1_g_m3,m0_g_m3 :std_logic;
signal m0_e_m1,m1_e_m3,m0_e_m3 :std_logic;
signal x,y : std_logic;
begin

comp_01: comparator4bit port map(a=>acc0_c8i16,b=>acc1_c8i16,a_g_b=>m0_g_m1,a_e_b=>m0_e_m1); 
comp_13: comparator4bit port map(a=>acc1_c8i16,b=>acc3_c8i16,a_g_b=>m1_g_m3,a_e_b=>m1_e_m3); 
comp_30: comparator4bit port map(a=>acc0_c8i16,b=>acc3_c8i16,a_g_b=>m0_g_m3,a_e_b=>m0_e_m3); 
m0_goe_m1 <= m0_g_m1 or m0_e_m1;
m1_goe_m3 <= m1_g_m3 or m1_e_m3;
m0_goe_m3 <= m0_g_m3 or m0_e_m3;
--==================             
x <= m0_goe_m1 when chroma='0' else ( (not m0_g_m1) xor chroma);
y <= m0_goe_m3 when x='1' else m1_goe_m3;
sel_m0 <= x and y ;
sel_m1<= ( not x) and y ;
sel_m3<= not y ;
end;