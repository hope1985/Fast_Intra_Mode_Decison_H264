
library ieee;
use ieee.std_logic_1164.all;
---------------------------------
-- components :
--  sad_m0to4
--  sad_m5to8
---------------------------------
entity stage2 is
  port(
    d1 :  in std_logic_vector(8 downto 0);
    d2: in std_logic_vector(8 downto 0);    
    d3 : in std_logic_vector(8 downto 0);
    d4 : in std_logic_vector(8 downto 0);
    d5 : in std_logic_vector(8 downto 0);
    d6 : in std_logic_vector(8 downto 0);
    d7 : in std_logic_vector(8 downto 0);
    d8 : in std_logic_vector(8 downto 0);
    d9 : in std_logic_vector(8 downto 0);
    d10 : in std_logic_vector(8 downto 0);
    d11 : in std_logic_vector(8 downto 0);
    d12 : in std_logic_vector(8 downto 0);
    d13 : in std_logic_vector(8 downto 0);
    d14 : in std_logic_vector(8 downto 0);
    d15 : in std_logic_vector(8 downto 0);
    d16 : in std_logic_vector(8 downto 0);

    sg_hu1,sg_hu2,sg_hd1,sg_hd2,
    sg_vr1,sg_vr2,sg_vl1,sg_vl2 ,
    sg_h1,sg_h2,sg_v1,sg_v2 ,
    sg_ddl1,sg_ddl2,sg_ddr1,sg_ddr2 : out std_logic;
    
    sad_h1 : out std_logic_vector(8 downto 0);
    sad_h2 :  out std_logic_vector(8 downto 0);
    sad_v1: out std_logic_vector(8 downto 0);    
    sad_v2 : out std_logic_vector(8 downto 0);
    sad_ddl1 : out std_logic_vector(8 downto 0);
    sad_ddl2 : out std_logic_vector(8 downto 0);
    sad_ddr1 : out std_logic_vector(8 downto 0);
    sad_ddr2 : out std_logic_vector(8 downto 0);
    sad_hu1 : out std_logic_vector(8 downto 0);
    sad_hu2 : out std_logic_vector(8 downto 0);
    sad_hd1 : out std_logic_vector(8 downto 0);
    sad_hd2 : out std_logic_vector(8 downto 0);
    sad_vr1 : out std_logic_vector(8 downto 0);
    sad_vr2 : out std_logic_vector(8 downto 0);
    sad_vl1 : out std_logic_vector(8 downto 0);
    sad_vl2 : out std_logic_vector(8 downto 0)
    );
end;

architecture arch_stage2 of stage2 is

component sad_m0to4
  port(
    a1,b1,a2,b2 : in std_logic_vector(8 downto 0);
    sign_b1,sign_b2 : out  std_logic;
    sum_a1b1 : out std_logic_vector(8 downto 0);
    sum_a2b2 : out std_logic_vector(8 downto 0)
    );
end component;
--===========
component sad_m5to8 
port(
  a1,b1,a2,b2 : in std_logic_vector(8 downto 0);
  sign_ab1,sign_ab2 : out  std_logic;
  sum_a1b1 : out std_logic_vector(8 downto 0);
  sum_a2b2 : out std_logic_vector(8 downto 0)
  );
end component;
--===========
begin

H :   sad_m0to4 port map(a1=>d1,b1=>d2,a2=>d3,b2=>d4,sign_b1=>sg_h1,sign_b2=>sg_h2,sum_a1b1=>sad_h1,sum_a2b2=>sad_h2);
V :   sad_m0to4 port map(a1=>d5,b1=>d6,a2=>d7,b2=>d8,sign_b1=>sg_v1,sign_b2=>sg_v2,sum_a1b1=>sad_v1,sum_a2b2=>sad_v2);
DDL : sad_m0to4 port map(a1=>d9,b1=>d10,a2=>d11,b2=>d12,sign_b1=>sg_ddl1,sign_b2=>sg_ddl2,sum_a1b1=>sad_ddl1,sum_a2b2=>sad_ddl2);
DDR : sad_m0to4 port map(a1=>d13,b1=>d14,a2=>d15,b2=>d16,sign_b1=>sg_ddr1,sign_b2=>sg_ddr2,sum_a1b1=>sad_ddr1,sum_a2b2=>sad_ddr2);
  
HU : sad_m5to8 port map(a1=>d1,b1=>d9,a2=>d4,b2=>d12,sign_ab1=>sg_hu1,sign_ab2=>sg_hu2,sum_a1b1=>sad_hu1,sum_a2b2=>sad_hu2);
HD : sad_m5to8 port map(a1=>d2,b1=>d13,a2=>d3,b2=>d16,sign_ab1=>sg_hd1,sign_ab2=>sg_hd2,sum_a1b1=>sad_hd1,sum_a2b2=>sad_hd2);
VR : sad_m5to8 port map(a1=>d5,b1=>d15,a2=>d8,b2=>d14,sign_ab1=>sg_vr1,sign_ab2=>sg_vr2,sum_a1b1=>sad_vr1,sum_a2b2=>sad_vr2);
VL : sad_m5to8 port map(a1=>d6,b1=>d10,a2=>d7,b2=>d11,sign_ab1=>sg_vl1,sign_ab2=>sg_vl2,sum_a1b1=>sad_vl1,sum_a2b2=>sad_vl2);


end;



