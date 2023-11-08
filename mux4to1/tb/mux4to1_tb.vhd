----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2023 11:30:18 AM
-- Design Name: 
-- Module Name: mux4to1_tb - Behavioral
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

entity mux4to1_tb is
--  Port ( );
end mux4to1_tb;

architecture arch_muxtb of mux4to1_tb is

component mux4to1 is
  Port ( 
        a: in std_logic;
        b: in std_logic;
        c: in std_logic;
        d: in std_logic;
        sel: in std_logic_vector(1 downto 0);
        z: out std_logic
        );
end component;

signal sig_a: std_logic;
signal sig_b: std_logic;
signal sig_c: std_logic;
signal sig_d: std_logic;
signal sig_sel: std_logic_vector(1 downto 0);
signal sig_z: std_logic;
        
begin

dut: mux4to1
  Port map ( 
        a => sig_a,
        b => sig_b,
        c => sig_c,
        d => sig_d,
        sel => sig_sel,
        z => sig_z
        );


move_inputs: process
begin
    sig_a <= '1';
    sig_b <= '0';
    sig_c <= '1';
    sig_d <= '1';
    sig_sel <= "00";
    
    wait for 10 ns;
    
    sig_a <= '1';
    sig_b <= '0'; 
    sig_c <= '1';
    sig_d <= '1';
    sig_sel <= "01";
        
    wait for 10 ns;
    
    sig_a <= '1';
    sig_b <= '0';  
    sig_c <= '1';
    sig_d <= '1';
    sig_sel <= "10";
    
    wait;
     
end process;        

end arch_muxtb;
