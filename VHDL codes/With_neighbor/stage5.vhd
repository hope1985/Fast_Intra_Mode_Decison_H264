library ieee;
use ieee.std_logic_1164.all;
---------------------------------
-- components :
--  comparator9bit
--  acc4bit
--  priority_mode
---------------------------------
entity stage5 is
  port(
       clock,reset : in std_logic;
       chroma_mode : in std_logic;
       
       --left_neg don't need
       all_neg,
       up_neg: in std_logic ;
       
       d01_sadx2,s01_sad, 
       d34_sadx2,s34_sad,
       d58_sadx2,s58_sad,
       d67_sadx2,s67_sad : in std_logic_vector(8 downto 0);
       
       m0_loe_m1,m3_loe_m4,m5_loe_m8,m6_loe_m7 : in std_logic;
       
       m0_c8i16,m1_c8i16,m3_c8i16 : in std_logic;
       
       sel0_c8i16,sel1_c8i16,sel3_c8i16 : out std_logic;
       sel_m01,sel_m34,sel_m58,sel_m67 : out std_logic;
       test4x4 : out std_logic
    );
end;
architecture arch_stage5 of stage5 is

component comparator9bit 
  port(
    a,b   : in std_logic_vector(8 downto 0);
    a_g_b : out std_logic
    --a_e_b : out std_logic
    );
end component;
--==================
--component comparator4bit 
--  port(
--    a,b   : in std_logic_vector(3 downto 0);
--    a_g_b : out std_logic;
--    a_e_b : out std_logic
--    );
--end component;
--==================
component acc4bit 
  port(
    clk ,reset: in std_logic ;    
    ac_in : in std_logic;
    ac_out : out std_logic_vector(3 downto 0)
    );
end component;
--==================

component select_lu16c8 
  port(acc0_c8i16,acc1_c8i16,acc3_c8i16 : in std_logic_vector(3 downto 0);
       chroma : in std_logic;
       sel_m0,sel_m1,sel_m3 : out std_logic
       );
end component;
--==================
signal test01,test34,test58,test67 :std_logic;
signal ac0_c8i16,ac1_c8i16,ac3_c8i16 :std_logic_vector(3 downto 0);
signal no_all_neg : std_logic;
--signal m0_goe_m1,m1_goe_m3,m0_goe_m3 :std_logic;
--signal m0_g_m1,m1_g_m3,m0_g_m3 :std_logic;
--signal m0_e_m1,m1_e_m3,m0_e_m3 :std_logic;
--signal x,y : std_logic;
begin
comp01: comparator9bit port map(a=>s01_sad,b=>d01_sadx2,a_g_b=>test01);  
comp34: comparator9bit port map(a=>s34_sad,b=>d34_sadx2,a_g_b=>test34); 
comp58: comparator9bit port map(a=>s58_sad,b=>d58_sadx2,a_g_b=>test58); 
comp67: comparator9bit port map(a=>s67_sad,b=>d67_sadx2,a_g_b=>test67); 
test4x4 <= test01 and test34 and test58 and test67;
--==================
acc_m0 : acc4bit port map(clk=>clock ,reset=>reset,ac_in=>m0_c8i16,ac_out=>ac0_c8i16);
acc_m1 : acc4bit port map(clk=>clock ,reset=>reset,ac_in=>m1_c8i16,ac_out=>ac1_c8i16);
acc_m3 : acc4bit port map(clk=>clock ,reset=>reset,ac_in=>m3_c8i16,ac_out=>ac3_c8i16);

--==================
 sel_lu16c8  : select_lu16c8 port map (
                    acc0_c8i16=>ac0_c8i16,acc1_c8i16=>ac1_c8i16,acc3_c8i16=>ac3_c8i16,chroma=>chroma_mode,
                    sel_m0=>sel0_c8i16,sel_m1=>sel1_c8i16,sel_m3=>sel3_c8i16 
                    );               
--==================
--sel_m01 <= m0_loe_m1;
--sel_m34 <= m3_loe_m4;
--sel_m58 <= m5_loe_m8;
--sel_m67 <= m6_loe_m7;
--==================
no_all_neg <= not all_neg;
sel_m01 <= (m0_loe_m1 and all_neg) or (no_all_neg and up_neg);
sel_m34 <= (m3_loe_m4 and all_neg) or  no_all_neg;
sel_m58 <= (m5_loe_m8 and all_neg);
sel_m67 <= (m6_loe_m7 and all_neg);

end;




