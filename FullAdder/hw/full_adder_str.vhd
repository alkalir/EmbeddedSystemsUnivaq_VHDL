----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2023 01:34:08 PM
-- Design Name: 
-- Module Name: full_adder_str - arch_full_adder_str
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

entity full_adder_str is
  Port ( 
        a: in std_logic;
        b: in std_logic;
        c: in std_logic;
        s: out std_logic;
        cout: out std_logic
        );
  end full_adder_str;

architecture arch_full_adder_str of full_adder_str is

signal s1 ,c1 ,c2: std_logic;


component half_adder
port (A: in std_logic;
	  B: in std_logic ;
      sum: out std_logic;
      carry: out std_logic
);
end component ;


begin


HA1 : half_adder 
    port map( A => a,
               B => b,
                sum=> s1,
                carry => c1
					);
HA2 : half_adder 
    port map( A => s1,
               B => C,
                sum=> S,
                carry => c2
            );
            
Cout <= c1 or c2;


end arch_full_adder_str;
