--================================= half_adder 1 bit=================================================
library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
  port(
    i,cin : in std_logic;
    s,cout:out std_logic
    );
end;
architecture b_half_adder of half_adder is
begin
s <= i xor cin;
cout <= i and cin;
end;
