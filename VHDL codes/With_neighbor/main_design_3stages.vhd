--================================ main_design 3 stage====================================================

library ieee;
use ieee.std_logic_1164.all;


entity main_design_3stages is
  port(
    reset_counter : in std_logic ;  
    global_clock : in std_logic ;


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

     --left_neg don't need
     all_neg,
     up_neg: in std_logic ;
       
    sel0_c8i16,sel1_c8i16,sel3_c8i16 : out std_logic;
    sel_m01,sel_m34,sel_m58,sel_m67 : out std_logic;
    test4x4 : out std_logic
    );
end;
architecture arch_main_design_3stages of main_design_3stages is

--====================================================================
component  process_unit_3stage 
  port(
    global_clk : in std_logic ;
    reset_acc : in std_logic;
    chroma_mode_enable : in std_logic;
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

     --left_neg don't need
     all_neg,
     up_neg: in std_logic ;
       
    sel0_c8i16,sel1_c8i16,sel3_c8i16 : out std_logic;
    sel_m01,sel_m34,sel_m58,sel_m67 : out std_logic;
    test4x4 : out std_logic
    );
end component;
--====================================================================
component  contol_unit_3stage 
  port(

       clock : in std_logic;
       reset_counter : in std_logic;
       acc_reset : out std_logic;
       chroma_mode : out std_logic
       
    );
end component;
--====================================================================
--type std_logic_16x9 is array (0 to 15) of std_logic_vector(8 downto 0);

signal acc_rst : std_logic ;
signal chroma_en : std_logic ;
--====================================================================
begin
  
cu  : contol_unit_3stage   port map ( 
         
       clock =>global_clock,
       reset_counter => reset_counter,
       acc_reset =>  acc_rst,
       chroma_mode => chroma_en                          
        );  
 --==================================================================== 
pu : process_unit_3stage  port map ( 

    global_clk=>global_clock,
    
    -- control unit inputs
    reset_acc=> acc_rst,
    chroma_mode_enable=>chroma_en,
  
    -- main design inputs  
    p0=>p0,   p1 =>p1,   p2 =>p2,   p3 =>p3,
    p4 =>p4,  p5 =>p5,   p6 =>p6,   p7 =>p7,
    p8 =>p8,  p9 =>p9,   p10 =>p10, p11 =>p11,
    p12 =>p12,p13 =>p13, p14 =>p14, p15 =>p15,
    
    --left_neg don't need
     all_neg=>all_neg,
     up_neg=>up_neg,
       
    sel0_c8i16=>sel0_c8i16,
    sel1_c8i16=>sel1_c8i16,
    sel3_c8i16=>sel3_c8i16,
    
    sel_m01=>sel_m01,
    sel_m34=>sel_m34,
    sel_m58=>sel_m58,
    sel_m67=>sel_m67,
    test4x4=>test4x4
    );
end;

