library ieee;
use ieee.std_logic_1164.all;
---------------------------------
-- components :
--  check_orthogonal
--  comparator8bit 
--  priority_mode
---------------------------------
entity stage4 is
  port(
     md0,md1,md3,md4,md5,md6,md7,md8 : in std_logic_vector(7 downto 0);
     chroma_mode : in std_logic;
     d01_sadx2,s01_sad,d34_sadx2,s34_sad,d58_sadx2,s58_sad,d67_sadx2,s67_sad : out std_logic_vector(8 downto 0);
     m0_loe_m1,m3_loe_m4,m5_loe_m8,m6_loe_m7: out std_logic;
     m0_c8i16,m1_c8i16,m3_c8i16 : out std_logic
    );
end;
architecture arch_stage4 of stage4 is

component check_orthogonal
  port(
    in1,in2 : in std_logic_vector(7 downto 0);
    dif_sadx2,sum_sad : out std_logic_vector(8 downto 0);
    a_goe_b : out std_logic
    );
end component;
--==============
component comparator8bit 
  port(
    a,b   : in std_logic_vector(7 downto 0);
    a_g_b : out std_logic;
    a_e_b : out std_logic
    );
end component;
--==============
signal  test01,test34,test58,test67 : std_logic;
signal  m_0loe1,m_1loe3,m_0loe3 : std_logic;
signal m_1l3,m_1e3 : std_logic;
signal m_0l3,m_0e3 : std_logic;
signal m_0e1 : std_logic;
signal m_0g1 : std_logic;
signal m_0goe1 : std_logic;
signal x,y : std_logic;
signal xor_m0m1 : std_logic_vector(7 downto 0);
begin

check01 : check_orthogonal port map (in1=>md1,in2=>md0,dif_sadx2=>d01_sadx2,sum_sad=>s01_sad,a_goe_b=>test01);  
check34 : check_orthogonal port map (in1=>md4,in2=>md3,dif_sadx2=>d34_sadx2,sum_sad=>s34_sad,a_goe_b=>test34);
check58 : check_orthogonal port map (in1=>md8,in2=>md5,dif_sadx2=>d58_sadx2,sum_sad=>s58_sad,a_goe_b=>test58);
check67 : check_orthogonal port map (in1=>md7,in2=>md6,dif_sadx2=>d67_sadx2,sum_sad=>s67_sad,a_goe_b=>test67);

--=================== (m0=m1) =====================
gen_xor : for i in 0 to 7 generate
            xor_m0m1(i) <= md0(i) xnor md1(i); 
          end generate;

m_0e1 <= xor_m0m1(0) and  xor_m0m1(1) and xor_m0m1(2) and  xor_m0m1(3) and  
         xor_m0m1(4) and  xor_m0m1(5) and xor_m0m1(6) and xor_m0m1(7);
m_0g1 <= test01;   
m_0goe1 <=  m_0e1 or m_0g1;        
m_0loe1 <= not test01;
--==================================================  
m0_loe_m1 <= m_0loe1;
m3_loe_m4 <= not test34;
m5_loe_m8 <= not test58;
m6_loe_m7 <= not test67;

cmp31 : comparator8bit port map (a=>md3,b=>md1,a_g_b=>m_1l3,a_e_b=>m_1e3);  -- a_g_b=1 -> m3>m1  
cmp03 : comparator8bit port map (a=>md3,b=>md0,a_g_b=>m_0l3,a_e_b=>m_0e3);  -- a_g_b=1 -> m3>m0  

m_1loe3 <= m_1l3 or m_1e3;
m_0loe3 <= m_0l3 or m_0e3;

x <= m_0loe1 when chroma_mode='0' else (m_0goe1 xor chroma_mode);
y <= m_0loe3 when x='1' else m_1loe3;
m0_c8i16 <= x and y ;
m1_c8i16 <= ( not x) and y ;
m3_c8i16 <= not y ;


  
end;









