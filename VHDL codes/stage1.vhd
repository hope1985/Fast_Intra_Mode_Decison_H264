library ieee;
use ieee.std_logic_1164.all;


---------------------------------
-- components :
--   sub8bit_signed
---------------------------------

entity stage1 is
  port(
    p0 : in std_logic_vector(7 downto 0);
    p1 :  in std_logic_vector(7 downto 0);
    p2: in std_logic_vector(7 downto 0);    
    p3 : in std_logic_vector(7 downto 0);
    p4 : in std_logic_vector(7 downto 0);
    p5 : in std_logic_vector(7 downto 0);
    p6 : in std_logic_vector(7 downto 0);
    p7 : in std_logic_vector(7 downto 0);
    p8 : in std_logic_vector(7 downto 0);
    p9 : in std_logic_vector(7 downto 0);
    p10 : in std_logic_vector(7 downto 0);
    p11 : in std_logic_vector(7 downto 0);
    p12 : in std_logic_vector(7 downto 0);
    p13 : in std_logic_vector(7 downto 0);
    p14 : in std_logic_vector(7 downto 0);
    p15 : in std_logic_vector(7 downto 0);
    
    d1 : out std_logic_vector(8 downto 0);
    d2 :  out std_logic_vector(8 downto 0);
    d3: out std_logic_vector(8 downto 0);    
    d4 : out std_logic_vector(8 downto 0);
    d5 : out std_logic_vector(8 downto 0);
    d6 : out std_logic_vector(8 downto 0);
    d7 : out std_logic_vector(8 downto 0);
    d8 : out std_logic_vector(8 downto 0);
    d9 : out std_logic_vector(8 downto 0);
    d10 : out std_logic_vector(8 downto 0);
    d11 : out std_logic_vector(8 downto 0);
    d12 : out std_logic_vector(8 downto 0);
    d13 : out std_logic_vector(8 downto 0);
    d14 : out std_logic_vector(8 downto 0);
    d15 : out std_logic_vector(8 downto 0);
    d16 : out std_logic_vector(8 downto 0)
    );
end;

architecture arch_stage1 of stage1 is
component sub8bit_signed
  port(
    a,b : in std_logic_vector(7 downto 0);
    sub : out std_logic_vector(8 downto 0)
    );
end component;
 --type block4x4 is array (0 to 15) of std_logic_vector (8 downto 0);
 --signal block_4x4 : block4x4; 
begin 
-- H
dif1 :  sub8bit_signed port map(a=>p3,b=>p2,sub=>d1);
dif2 :  sub8bit_signed port map(a=>p7,b=>p6,sub=>d2);
dif3 :  sub8bit_signed port map(a=>p9,b=>p8,sub=>d3);
dif4 :  sub8bit_signed port map(a=>p13,b=>p12,sub=>d4);
-- V
dif5 :  sub8bit_signed port map(a=>p4,b=>p0,sub=>d5);
dif6 :  sub8bit_signed port map(a=>p5,b=>p1,sub=>d6);
dif7 :  sub8bit_signed port map(a=>p14,b=>p10,sub=>d7);
dif8 :  sub8bit_signed port map(a=>p15,b=>p11,sub=>d8);
-- DDL
dif9 :  sub8bit_signed port map(a=>p2,b=>p5,sub=>d9);
dif10 :  sub8bit_signed port map(a=>p8,b=>p5,sub=>d10);
dif11 :  sub8bit_signed port map(a=>p10,b=>p7,sub=>d11);
dif12 :  sub8bit_signed port map(a=>p10,b=>p13,sub=>d12);
-- DDR
dif13 :  sub8bit_signed port map(a=>p6,b=>p1,sub=>d13);
dif14 :  sub8bit_signed port map(a=>p11,b=>p6,sub=>d14);
dif15 :  sub8bit_signed port map(a=>p9,b=>p4,sub=>d15);
dif16 :  sub8bit_signed port map(a=>p14,b=>p9,sub=>d16);
end;

