--================================register 9 bit====================================================
library ieee;
use ieee.std_logic_1164.all;


entity register_9bit is
   generic(n:integer:=9);
  port(
    din   : in std_logic_vector(n-1 downto 0);
    clk   : in std_logic;
    dout  : out std_logic_vector(n-1 downto 0)
    );
end;
architecture arch_register_9bit of register_9bit is
--=======================
component dff 
  port(

    clk : in std_logic;
    din   : in std_logic;
    dout : out std_logic 
    );
end component;
--=======================
begin
 g_reg : for i in 0 to n-1 generate
            dff_i : dff port map(clk=>clk ,din=>din(i),dout=> dout(i)); 
         end generate;     
end;

