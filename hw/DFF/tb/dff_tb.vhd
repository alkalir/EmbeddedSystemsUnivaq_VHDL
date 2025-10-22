----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2023 01:18:50 PM
-- Design Name: 
-- Module Name: dff_tb - arch_dff_tb
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

entity dff_tb is
--  Port ( );
end dff_tb;

architecture arch_dff_tb of dff_tb is

component dff is
  Port ( 
    d: in std_logic;
    clk: in std_logic;
    q: out std_logic
    );
end component;

signal sig_d: std_logic;
signal sig_clk: std_logic:='0';
signal sig_q: std_logic;
constant half_period: time:=5 ns;

begin

dut: dff
    port map (
        d => sig_d,
        clk => sig_clk,
        q => sig_q
    );

sig_clk <= not sig_clk after half_period;

inputs: process
begin
    sig_d <= '0';
    wait for 20 ns;
    sig_d <= '1';
    wait for 20 ns;
    sig_d <= '0';
    wait;
end process;

end arch_dff_tb;
