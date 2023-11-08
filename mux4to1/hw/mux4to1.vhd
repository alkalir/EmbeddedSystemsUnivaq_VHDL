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

entity mux4to1 is
  Port ( 
        a: in std_logic;
        b: in std_logic;
        c: in std_logic;
        d: in std_logic;
        sel: in std_logic_vector(1 downto 0);
        z: out std_logic
        );
end mux4to1;

architecture Behavioral of mux4to1 is
-- declaration part
begin

    z <= a when sel = "00" else
        b when sel = "01" else
        c when sel = "10" else
        d;

end Behavioral;
