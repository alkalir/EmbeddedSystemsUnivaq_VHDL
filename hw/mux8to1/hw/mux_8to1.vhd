----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.10.2021 15:50:19
-- Design Name: 
-- Module Name: half_adder - Behavioral
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

entity mux_8to1 is
  Port ( 
        a: in std_logic;
        b: in std_logic;
        c: in std_logic;
        d: in std_logic;
        e: in std_logic;
        f: in std_logic;
        g: in std_logic;
        h: in std_logic; 
        sel: in std_logic_vector(2 downto 0);
        z: out std_logic
        );
end mux_8to1;

architecture arch_mux8to1 of mux_8to1 is
-- declaration part
begin

    with sel select 
        z <= a when "000",
            b when "001",
            c when "010",
            d when "011",
            e when "100",
            f when "101",
            g when "110",
            h when "111",
            '0' when others;

end arch_mux8to1;
