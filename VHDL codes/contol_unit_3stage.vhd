library ieee;
use ieee.std_logic_1164.all;

entity contol_unit_3stage is
  port(

       clock : in std_logic;
       reset_counter : in std_logic;
       acc_reset : out std_logic;
       chroma_mode : out std_logic
    );
end;

architecture arch_contol_unit_3stage of  contol_unit_3stage is
component tff is
  port(
    clk,clear,load  : in std_logic;
    t   : in std_logic;
    dload : in std_logic;    
    q  : inout std_logic

    );
end component;

signal cnt : std_logic_vector(4 downto 0);
signal preset : std_logic_vector(4 downto 0) ;
signal inb1,inb2,inb3,inb4 : std_logic ;
signal en_load : std_logic ;
signal im1,im2,im3 : std_logic ;

begin
preset <= "00011";
inb1 <= cnt(0);
inb2 <= cnt(0) and cnt(1);
inb3 <= cnt(0) and cnt(1) and cnt(2);
inb4 <= cnt(0) and cnt(1) and cnt(2) and cnt(3);

--========================================
-- Note :
-- Input Init ==> reset_counter=1 in first clock 
-- count>26 ==> don't care 
--========================================


b0 : tff port map(clk=>clock,clear=>reset_counter,load=>en_load,t=>'1'  ,dload=>preset(0),q=>cnt(0));
b1 : tff port map(clk=>clock,clear=>reset_counter,load=>en_load,t=>inb1 ,dload=>preset(1),q=>cnt(1));
b2 : tff port map(clk=>clock,clear=>reset_counter,load=>en_load,t=>inb2 ,dload=>preset(2),q=>cnt(2));
b3 : tff port map(clk=>clock,clear=>reset_counter,load=>en_load,t=>inb3 ,dload=>preset(3),q=>cnt(3));
b4 : tff port map(clk=>clock,clear=>reset_counter,load=>en_load,t=>inb4 ,dload=>preset(4),q=>cnt(4));

-- count 2  -> reset for begin process 
-- count 18 -> end luma/begin chroma 
-- count 26 -> begin luma/end chroma 
im1 <= (  cnt(0) nor  cnt(2) ) and cnt(1);
im2 <=  im1 and ( cnt(4) or (cnt(4) nor cnt(3)) ) ;  
acc_reset <= reset_counter or im2 ;  --Sync

-- count 26 -> counter set to 3
-- 11010=26 
en_load<=cnt(4) and cnt(3) and cnt(1); --Sync


-- count 19-26 ==> chroma_mode=1
im3 <= cnt(1)  and  cnt(0) ;
chroma_mode <=  cnt(4) and (  ( cnt(3) xor cnt(2) ) or  im3 );  --Async

 
end;









