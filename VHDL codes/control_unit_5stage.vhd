library ieee;
use ieee.std_logic_1164.all;

entity contol_unit_5stage is
  port(

       clock : in std_logic;
       reset_counter : in std_logic;
       acc_reset : out std_logic;
       chroma_mode_st4 : out std_logic;
       chroma_mode_st5 : out std_logic
       
    );
end;

architecture arch_contol_unit_5stage of  contol_unit_5stage is
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
preset <= "00101";
inb1 <= cnt(0);
inb2 <= cnt(0) and cnt(1);
inb3 <= cnt(0) and cnt(1) and cnt(2);
inb4 <= cnt(0) and cnt(1) and cnt(2) and cnt(3);

--========================================
-- Note :
-- Input Init ==> reset_counter=1 in first clock 
-- count>27 ==> don't care 
--========================================




b0 : tff port map(clk=>clock,clear=>reset_counter,load=>en_load,t=>'1'  ,dload=>preset(0),q=>cnt(0));
b1 : tff port map(clk=>clock,clear=>reset_counter,load=>en_load,t=>inb1 ,dload=>preset(1),q=>cnt(1));
b2 : tff port map(clk=>clock,clear=>reset_counter,load=>en_load,t=>inb2 ,dload=>preset(2),q=>cnt(2));
b3 : tff port map(clk=>clock,clear=>reset_counter,load=>en_load,t=>inb3 ,dload=>preset(3),q=>cnt(3));
b4 : tff port map(clk=>clock,clear=>reset_counter,load=>en_load,t=>inb4 ,dload=>preset(4),q=>cnt(4));

-- count 4  -> reset for begin process 
-- count 20 -> end luma/begin chroma 
-- count 28 -> begin luma/end chroma 
im1 <= cnt(1) nor cnt(0) ;
im2 <= cnt(4) and  cnt(2) and im1 ;
im3 <= ( cnt(4) nor cnt(3) ) and cnt(2) and im1 ;  
acc_reset <= reset_counter or (im3  or im2 ) ;    --Sync


-- count 28 -> counter set to 5 
en_load<=cnt(4) and cnt(3) and cnt(2)  ;  --11100=28       --Sync

--count 21-28 ==> chroma_mode_st4=1  
chroma_mode_st5 <=  cnt(4)  and (  cnt(3) or ( ( cnt(1) or cnt(0)) and cnt(2) ) ) ;--Async  

--count 20-27 ==> chroma_mode_st5=1
chroma_mode_st4 <=  cnt(4) and ( (cnt(3) xor cnt(2))  or  (cnt(3) and cnt(2)) ) ; --Async  
 
end;







