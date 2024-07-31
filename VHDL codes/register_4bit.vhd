--================================register 4 bit====================================================
library ieee;
use ieee.std_logic_1164.all;


entity register_4bit is
   generic(n:integer:=4);
  port(
    din   : in std_logic_vector(n-1 downto 0);
    r,clk : in std_logic;
    dout  : out std_logic_vector(n-1 downto 0)
    );
end;
architecture arch_register_4bit of register_4bit is
begin
  process(clk)
  begin
     if(clk'event and clk='1') then
        if(r='1') then
          dout<= (others =>'0');
       else
         dout<=din;
       end if;
     end if; 
  end process;      
end;
