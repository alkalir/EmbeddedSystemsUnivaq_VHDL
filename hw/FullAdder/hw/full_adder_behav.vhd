----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.10.2021 12:44:39
-- Design Name: 
-- Module Name: full_adder_behav - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder_behav is
  Port ( 
        a: in std_logic;
        b: in std_logic;
        c: in std_logic;
        s: out std_logic;
        cout: out std_logic
        );
end full_adder_behav;

architecture Behavioral of full_adder_behav is

begin

full_adder_proc: process (a, b, c)

begin

  if(A='0' and B='0' and C='0')then
    S<='0';
    Cout<='0';
  elsif( A='0' and B='0' and C='1')then
   S<='1';
   Cout<='0';
  elsif( A='0' and B='1' and C='0')then
   S<='1';
   Cout<='0';
  elsif( A='0' and B='1' and C='1')then
   S<='0';
   Cout<='1';
elsif( A='1' and B='0' and C='0')then
   S<='1';
   Cout<='0';
  elsif( A='1' and B='0' and C='1')then
   S<='0';
   Cout<='1';
  elsif( A='1' and B='1' and C='0')then
   S<='0';
   Cout<='1';
  else
   S<='1';
   Cout<='1';
  end if;

   
end process;


end Behavioral;