----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2023 12:59:27 PM
-- Design Name: 
-- Module Name: half_adder - half_add_arch
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

entity half_adder is
  Port ( 
        a: in std_logic;
        b: in std_logic;
        sum: out std_logic;
        carry: out std_logic
        );
end half_adder;

architecture half_add_arch of half_adder is

begin

    sum <= a xor b;
    carry <= a and b;
    
end half_add_arch;