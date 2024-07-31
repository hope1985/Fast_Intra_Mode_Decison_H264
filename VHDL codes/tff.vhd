--================================ T flipflop====================================================

library ieee;
use ieee.std_logic_1164.all;


entity tff is
  port(

    clk,clear,load : in std_logic;
    t   : in std_logic;
    dload : in std_logic;    
    q  : inout std_logic
    );
end;
architecture arch_tff of tff is
begin
  process(clk)
 
  begin
     if(clk'event and clk='1') then
        if(clear='1') then
          q<= '0';
        elsif(load='1') then
            q<=dload;
        else
          q<=q xor t;
          -- if(t='1') then 
          --  q<=not q ;         
          -- else
          --   q<=q;     
          --end if;
      end if;  
      end if; 
  end process;      
end;