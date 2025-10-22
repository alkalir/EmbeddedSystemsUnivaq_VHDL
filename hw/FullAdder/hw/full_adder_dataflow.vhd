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

entity full_adder_dataflow is
  Port ( 
        a: in std_logic;
        b: in std_logic;
        c: in std_logic;
        s: out std_logic;
        cout: out std_logic
        );
end full_adder_dataflow;

architecture arch_fa_df of full_adder_dataflow is

begin

    s <= a xor b xor c;
    cout <= (a and b) or (c and (a or b));



end arch_fa_df;