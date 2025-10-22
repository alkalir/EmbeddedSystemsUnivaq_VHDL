----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2023 01:05:04 PM
-- Design Name: 
-- Module Name: half_adder_tb - arch_half_adder_tb
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

entity half_adder_tb is
--  Port ( );
end half_adder_tb;

architecture arch_half_adder_tb of half_adder_tb is

component half_adder is
  Port ( 
        a: in std_logic;
        b: in std_logic;
        sum: out std_logic;
        carry: out std_logic
        );
end component;

signal sig_a: std_logic; -- input generators
signal sig_b: std_logic;

signal sig_sum: std_logic; -- logic analyzer (or oscilloscope)
signal sig_carry: std_logic;

begin


dut: half_adder
    port map (
                a => sig_a,
                b => sig_b,
                sum => sig_sum,
                carry => sig_carry
                );
                
                
move_inputs: process
begin
    sig_a <= '1';
    sig_b <= '0';
    
    wait for 10 ns;
    
    sig_a <= '1';
    sig_b <= '1'; 
    
    wait for 10 ns;
    
    sig_a <= '0';
    sig_b <= '1';  
    
    wait;
     
end process;       


end arch_half_adder_tb;