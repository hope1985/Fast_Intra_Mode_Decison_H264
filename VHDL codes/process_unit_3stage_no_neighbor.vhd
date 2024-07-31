
--================================ process_unit_3stage_no_neighbor ====================================================

library ieee;
use ieee.std_logic_1164.all;

---------------------------------
-- components :
--  stage1 
--  stage2
--  stage3
--  stage4
--  stage5_no_neighbor
--  register_8bit
--  register_9bit
---------------------------------
entity process_unit_3stage_no_neighbor is
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
    --all_neg,
    --up_neg: in std_logic ;
       
    sel0_c8i16,sel1_c8i16,sel3_c8i16 : out std_logic;
    sel_m01,sel_m34,sel_m58,sel_m67 : out std_logic;
    test4x4 : out std_logic
    );
end;
architecture arch_process_unit_3stage_no_neighbor of process_unit_3stage_no_neighbor is

--====================================================================
component stage1 
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
end component;
--====================================================================
component stage2 
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
end component;
--====================================================================
component stage3 

    port(
    --clock,reset : in std_logic;
    isad_h1,isad_h2,
    isad_v1,isad_v2,
    isad_ddl1,isad_ddl2,
    isad_ddr1,isad_ddr2,
    isad_vr1,isad_vr2,
    isad_vl1,isad_vl2,
    isad_hd1,isad_hd2, 
    isad_hu1,isad_hu2 : in std_logic_vector(8 downto 0);
    
    sg_h1,sg_h2,
    sg_v1,sg_v2,
    sg_ddl1,sg_ddl2,
    sg_ddr1,sg_ddr2,
    sg_vr1,sg_vr2,
    sg_vl1,sg_vl2,
    sg_hd1,sg_hd2, 
    sg_hu1,sg_hu2 : in std_logic;
    
    sad_h,
    sad_v,
    sad_ddl,
    sad_ddr,
    sad_vr,
    sad_vl,
    sad_hd, 
    sad_hu : out std_logic_vector(7 downto 0)
      );
end component;
--====================================================================
component stage4 
  port(
     md0,md1,md3,md4,md5,md6,md7,md8 : in std_logic_vector(7 downto 0);
     chroma_mode : in std_logic;
     d01_sadx2,s01_sad,d34_sadx2,s34_sad,d58_sadx2,s58_sad,d67_sadx2,s67_sad : out std_logic_vector(8 downto 0);
     m0_loe_m1,m3_loe_m4,m5_loe_m8,m6_loe_m7: out std_logic;
     m0_c8i16,m1_c8i16,m3_c8i16 : out std_logic
    );
end component;
--====================================================================
component  stage5_no_neighbor
  port(
       clock,reset : in std_logic;
       chroma_mode : in std_logic;
       
       d01_sadx2,s01_sad, 
       d34_sadx2,s34_sad,
       d58_sadx2,s58_sad,
       d67_sadx2,s67_sad : in std_logic_vector(8 downto 0);
       
       --left_neg don't need
       --all_neg,
       --up_neg: in std_logic ;
              
       m0_loe_m1,m3_loe_m4,m5_loe_m8,m6_loe_m7 : in std_logic;
       
       m0_c8i16,m1_c8i16,m3_c8i16 : in std_logic;
       
       sel0_c8i16,sel1_c8i16,sel3_c8i16 : out std_logic;
       sel_m01,sel_m34,sel_m58,sel_m67 : out std_logic;
       test4x4 : out std_logic
    );
end component;
--====================================================================
component register_8bit 
  port(
    din   : in std_logic_vector(7 downto 0);
    clk   : in std_logic;
    dout  : out std_logic_vector(7 downto 0)
    );
end component;
--====================================================================
component register_9bit 
  port(
    din   : in std_logic_vector(8 downto 0);
    clk   : in std_logic;
    dout  : out std_logic_vector(8 downto 0)
    );
end component;
--====================================================================
type std_logic_16x9 is array (0 to 15) of std_logic_vector(8 downto 0);
type std_logic_16x8 is array (0 to 15) of std_logic_vector(7 downto 0);
type std_logic_8x8 is array (0 to 7) of std_logic_vector(7 downto 0);
type std_logic_8x9 is array (0 to 7) of std_logic_vector(8 downto 0);
--====================================================================
signal out_st1 : std_logic_16x9 ;
--===============
signal in_st2  : std_logic_16x9 ;
signal out_sad_st2  : std_logic_16x9 ;
signal out_sg_st2 : std_logic_vector(0 to 15);
--===============
signal in_sad_st3  : std_logic_16x9 ;
signal in_sg_st3 : std_logic_vector(0 to 15);
signal out_sad_st3 : std_logic_8x8 ;
--===============
signal in_sad_st4 : std_logic_8x8 ;
signal out_sad_st4  : std_logic_8x9 ;
signal out_cmp4x4_st4  : std_logic_vector(0 to 3) ;
signal out_m16l8c_st4  : std_logic_vector(0 to 2) ;
--===============
signal in_sad_st5  : std_logic_8x9 ;
signal in_cmp4x4_st5  : std_logic_vector(0 to 3) ;
signal in_m16l8c_st5  : std_logic_vector(0 to 2) ;

--====================================================================
begin
st1 : stage1  port map ( 
                  p0=>p0,p1=>p1,p2=>p2,p3=>p3,
                  p4=>p4,p5=>p5,p6=>p6,p7=>p7,
                  p8=>p8,p9=>p9,p10=>p10,p11=>p11,
                  p12=>p12,p13=>p13,p14=>p14,p15=>p15,
                       
                  d1=>out_st1(0),d2=>out_st1(1),d3=>out_st1(2),
                  d4=>out_st1(3),d5=>out_st1(4),d6=>out_st1(5),d7=>out_st1(6),
                  d8=>out_st1(7),d9=>out_st1(8),d10=>out_st1(9),d11=>out_st1(10),
                  d12=>out_st1(11),d13=>out_st1(12),d14=>out_st1(13),d15=>out_st1(14),d16=>out_st1(15)
                  );  
g_out_st1 : for i in 0 to 15 generate
   st1_out : register_9bit port map(clk=>global_clk,din=>out_st1(i) ,dout=>in_st2(i) );
end generate;
--====================================================================
st2  : stage2  port map ( 

                  
                  d1=>in_st2(0),  d2=>in_st2(1),  d3=>in_st2(2),
                  d4=>in_st2(3),  d5=>in_st2(4),  d6=>in_st2(5),  d7=>in_st2(6),
                  d8=>in_st2(7),  d9=>in_st2(8),  d10=>in_st2(9), d11=>in_st2(10),
                  d12=>in_st2(11),d13=>in_st2(12),d14=>in_st2(13),d15=>in_st2(14),d16=>in_st2(15),
                                                   
                  sad_v1=>out_sad_st2(0),
                  sad_v2=>out_sad_st2(1),
                  sad_h1=>out_sad_st2(2),
                  sad_h2=>out_sad_st2(3), 
                  sad_ddl1=>out_sad_st2(4),  
                  sad_ddl2=>out_sad_st2(5), 
                  sad_ddr1=>out_sad_st2(6), 
                  sad_ddr2=>out_sad_st2(7),                 
                  sad_vr1=>out_sad_st2(8),
                  sad_vr2=>out_sad_st2(9),
                  sad_hd1=>out_sad_st2(10),
                  sad_hd2=>out_sad_st2(11),
                  sad_vl1=>out_sad_st2(12), 
                  sad_vl2=>out_sad_st2(13), 
                  sad_hu1=>out_sad_st2(14), 
                  sad_hu2=>out_sad_st2(15), 
                  
                  sg_v1=>out_sg_st2(0),sg_v2=>out_sg_st2(1),
                  sg_h1=>out_sg_st2(2),sg_h2=>out_sg_st2(3),
                  sg_ddl1=>out_sg_st2(4),sg_ddl2=>out_sg_st2(5),
                  sg_ddr1=>out_sg_st2(6),sg_ddr2=>out_sg_st2(7),
                  sg_vr1=>out_sg_st2(8),sg_vr2=>out_sg_st2(9),
                  sg_hd1=>out_sg_st2(10),sg_hd2=>out_sg_st2(11),
                  sg_vl1=>out_sg_st2(12),sg_vl2=>out_sg_st2(13),
                  sg_hu1=>out_sg_st2(14),sg_hu2=>out_sg_st2(15)
                  
                                  
                  );

                  
g_out_sad_st2 : for i in 0 to 15 generate
   sad_st2_out : in_sad_st3(i)<=out_sad_st2(i);
   sg_st2_out  : in_sg_st3(i)<=out_sg_st2(i);
end generate;
--====================================================================
st3  : stage3  port map ( 
                  isad_v1=>in_sad_st3(0),isad_v2=>in_sad_st3(1),
                  isad_h1=>in_sad_st3(2),isad_h2=>in_sad_st3(3),
                  isad_ddl1=>in_sad_st3(4),isad_ddl2=>in_sad_st3(5),
                  isad_ddr1=>in_sad_st3(6),isad_ddr2=>in_sad_st3(7),
                  isad_vr1=>in_sad_st3(8),isad_vr2=>in_sad_st3(9),
                  isad_hd1=>in_sad_st3(10),isad_hd2=>in_sad_st3(11),
                  isad_vl1=>in_sad_st3(12),isad_vl2=>in_sad_st3(13),
                  isad_hu1=>in_sad_st3(14),isad_hu2=>in_sad_st3(15),

                  
                  sg_v1=>in_sg_st3(0),sg_v2=>in_sg_st3(1),
                  sg_h1=>in_sg_st3(2),sg_h2=>in_sg_st3(3),
                  sg_ddl1=>in_sg_st3(4),sg_ddl2=>in_sg_st3(5),
                  sg_ddr1=>in_sg_st3(6),sg_ddr2=>in_sg_st3(7),
                  sg_vr1=>in_sg_st3(8),sg_vr2=>in_sg_st3(9),
                  sg_hd1=>in_sg_st3(10),sg_hd2=>in_sg_st3(11),
                  sg_vl1=>in_sg_st3(12),sg_vl2=>in_sg_st3(13),
                  sg_hu1=>in_sg_st3(14),sg_hu2=>in_sg_st3(15),
                  
                                    
                  sad_v=>out_sad_st3(0),
                  sad_h=>out_sad_st3(1),
                  sad_ddl=>out_sad_st3(2),
                  sad_ddr=>out_sad_st3(3),
                  sad_vr=>out_sad_st3(4),
                  sad_hd=>out_sad_st3(5),
                  sad_vl=>out_sad_st3(6),
                  sad_hu=>out_sad_st3(7)
                  );
                  
g_out_sad_st3 : for i in 0 to 7 generate
   sad_st3_out : register_8bit port map(clk=>global_clk,din=>out_sad_st3(i) ,dout=>in_sad_st4(i) );
end generate;                  
--====================================================================
st4  : stage4  port map ( 

                  chroma_mode=>chroma_mode_enable,            
                  md0=>in_sad_st4(0),
                  md1=>in_sad_st4(1),
                  md3=>in_sad_st4(2),
                  md4=>in_sad_st4(3),
                  md5=>in_sad_st4(4),
                  md6=>in_sad_st4(5),
                  md7=>in_sad_st4(6),
                  md8=>in_sad_st4(7),
                  
                  d01_sadx2=>out_sad_st4(0),
                  s01_sad=>out_sad_st4(1),
                  d34_sadx2=>out_sad_st4(2),
                  s34_sad=>out_sad_st4(3),
                  d58_sadx2=>out_sad_st4(4),
                  s58_sad=>out_sad_st4(5),
                  d67_sadx2=>out_sad_st4(6),
                  s67_sad=>out_sad_st4(7), 
                  
                  m0_loe_m1=>out_cmp4x4_st4(0),
                  m3_loe_m4=>out_cmp4x4_st4(1),
                  m5_loe_m8=>out_cmp4x4_st4(2),
                  m6_loe_m7=>out_cmp4x4_st4(3),
                  
                  m0_c8i16=>out_m16l8c_st4(0),
                  m1_c8i16=>out_m16l8c_st4(2),
                  m3_c8i16=>out_m16l8c_st4(1)                
                  
                  );

g_out_sad_st4 : for i in 0 to 7 generate
  sad_st4_out : in_sad_st5(i)<=out_sad_st4(i) ;
end generate;

g_out_cmp4x4_st4 : for i in 0 to 3 generate
  cmp4x4_st4_out : in_cmp4x4_st5(i)<=out_cmp4x4_st4(i) ;
end generate;

g_out_m16l8c_st4 : for i in 0 to 2 generate
  m16l8c_st4_out : in_m16l8c_st5(i)<=out_m16l8c_st4(i) ; 
end generate;                
--====================================================================

st5_no_neig  :  stage5_no_neighbor  port map ( 

                  clock=>global_clk,
                  reset=>reset_acc,
                  chroma_mode=>chroma_mode_enable,                             

                  --left_neg don't need
                  --all_neg=>all_neg,
                  --up_neg=>up_neg,
                  
                  d01_sadx2=>in_sad_st5(0),
                  s01_sad=>in_sad_st5(1),
                  d34_sadx2=>in_sad_st5(2),
                  s34_sad=>in_sad_st5(3),
                  d58_sadx2=>in_sad_st5(4),
                  s58_sad=>in_sad_st5(5),
                  d67_sadx2=>in_sad_st5(6),
                  s67_sad=>in_sad_st5(7), 
                  
                  m0_loe_m1=>in_cmp4x4_st5(0),
                  m3_loe_m4=>in_cmp4x4_st5(1),
                  m5_loe_m8=>in_cmp4x4_st5(2),
                  m6_loe_m7=>in_cmp4x4_st5(3),
                  
                  m0_c8i16=>in_m16l8c_st5(0),
                  m1_c8i16=>in_m16l8c_st5(2),
                  m3_c8i16=>in_m16l8c_st5(1),      
                  
                  sel0_c8i16=>sel0_c8i16,
                  sel1_c8i16=>sel1_c8i16,
                  sel3_c8i16=>sel3_c8i16,
                   
                  sel_m01=>sel_m01,
                  sel_m34=>sel_m34,
                  sel_m58=>sel_m58,
                  sel_m67=>sel_m67,
                  
                  test4x4=> test4x4                       
                  
                  );
--====================================================================

end;




