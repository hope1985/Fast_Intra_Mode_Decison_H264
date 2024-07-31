  library ieee;
  use ieee.std_logic_1164.all;
---------------------------------
-- components :
--  sad
---------------------------------  
  entity stage3 is
    port(
   -- clock,reset : in std_logic;
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
  end;
  
  architecture arch_stage3 of stage3 is
    
  
  component tsad_m5to8
  port(
    psad1,psad2 : in std_logic_vector(8 downto 0);
    sign1,sign2 : in  std_logic;
    output : out std_logic_vector(7 downto 0)
    );
    end  component;
  component tsad_m0to4
  port(
    psad1,psad2 : in std_logic_vector(8 downto 0);
    sign1,sign2 : in  std_logic;
    output : out std_logic_vector(7 downto 0)
    );
    end  component; 
      
  begin
  sadH   : tsad_m0to4 port map(psad1=>isad_h1,psad2=>isad_h2,sign1=>sg_h1,sign2=>sg_h2,output=>sad_h);
  sadV   : tsad_m0to4 port map(psad1=>isad_v1,psad2=>isad_v2,sign1=>sg_v1,sign2=>sg_v2,output=>sad_v);
  sadDDL : tsad_m0to4 port map(psad1=>isad_ddl1,psad2=>isad_ddl2,sign1=>sg_ddl1,sign2=>sg_ddl2,output=>sad_ddl);
  sadDDR : tsad_m0to4 port map(psad1=>isad_ddr1,psad2=>isad_ddr2,sign1=>sg_ddr1,sign2=>sg_ddr2,output=>sad_ddr);
  sadVR  : tsad_m5to8 port map(psad1=>isad_vr1,psad2=>isad_vr2,sign1=>sg_vr1,sign2=>sg_vr2,output=>sad_vr);
  sadVL  : tsad_m5to8 port map(psad1=>isad_vl1,psad2=>isad_vl2,sign1=>sg_vl1,sign2=>sg_vl2,output=>sad_vl);
  sadHD  : tsad_m5to8 port map(psad1=>isad_hd1,psad2=>isad_hd2,sign1=>sg_hd1,sign2=>sg_hd2,output=>sad_hd);
  sadHU  : tsad_m5to8 port map(psad1=>isad_hu1,psad2=>isad_hu2,sign1=>sg_hu1,sign2=>sg_hu2,output=>sad_hu);
  end;








