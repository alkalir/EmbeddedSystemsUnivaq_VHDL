----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2023 01:14:29 PM
-- Design Name: 
-- Module Name: dff - dff_arch
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

entity dff is
  Port ( 
    d: in std_logic;
    clk: in std_logic;
    q: out std_logic
    );
end dff;

architecture dff_arch of dff is

begin

process(clk)
begin
    if (clk='1' and clk'event) then
        q <= d;
    end if;
end process;

end dff_arch;
