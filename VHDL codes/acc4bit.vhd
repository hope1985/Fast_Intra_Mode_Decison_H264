--=================================accumulator 4 bit========================================

library ieee;
use ieee.std_logic_1164.all;
---------------------------------
-- components :
-- register_4bit 
-- half_adder
---------------------------------
entity acc4bit is
  port(
    clk ,reset: in std_logic ;    
    ac_in : in std_logic;
    ac_out : out std_logic_vector(3 downto 0)
    );
end;
architecture arch_acc4bit  of acc4bit  is

component half_adder 
  port(
    i,cin : in std_logic;
    s,cout:out std_logic
    );
end component;
--=========
component register_4bit 
  port(
    din   : in std_logic_vector(3 downto 0);
    r,clk : in std_logic;
    dout  : out std_logic_vector(3 downto 0)
    );
end component;
--=========
signal sum4bit,reg_out : std_logic_vector(3 downto 0);  
signal carry : std_logic_vector(3 downto 0);
signal reg_is9 : std_logic ;

begin
reg_is9 <= ac_in and (reg_out(3) nand reg_out(0)) ;
ha0 :  half_adder   port map(i=>reg_out(0) ,cin=>reg_is9,s=>sum4bit(0),cout=>carry(0));
gen_ha : for i in 1 to 3 generate
  ha_i : half_adder   port map(i=>reg_out(i) ,cin=>carry(i-1),s=>sum4bit(i),cout=>carry(i));
end generate;
reg :  register_4bit  port map(din=>sum4bit,r=>reset,clk=>clk,dout=>reg_out);
ac_out<=sum4bit;

end;
