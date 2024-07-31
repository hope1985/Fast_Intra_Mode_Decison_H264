--================================ D flipixflopix====================================================

library ieee;
use ieee.std_logic_1164.all;


entity dff is
  port(

    clk : in std_logic;
    din   : in std_logic;
    dout : out std_logic 
    );
end;
architecture arch_dff of dff is
begin
  process(clk) 
  begin
     if(clk'event and clk='1') then
          dout<= din;
        end if;  
  end process;      
end;
