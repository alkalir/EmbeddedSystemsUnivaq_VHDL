library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TopModule is
    Port (
        clk        : in  STD_LOGIC;
        rst        : in  STD_LOGIC;
        load       : in  STD_LOGIC;
        data_in    : in  STD_LOGIC_VECTOR(15 downto 0);  -- 16-bit data input
        data_out   : out STD_LOGIC_VECTOR(15 downto 0)   -- 16-bit data output
    );
end TopModule;

architecture Behavioral of TopModule is
    -- Instantiate the PIPO register with 16-bit width
    component PIPO
        Generic (
            N : integer := 16  -- Configure the PIPO width as 16
        );
        Port (
            clk     : in  STD_LOGIC;
            rst     : in  STD_LOGIC;
            load    : in  STD_LOGIC;
            data_in : in  STD_LOGIC_VECTOR(15 downto 0);
            data_out : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

begin
    -- Instantiate PIPO in the top module
    PIPO_inst : PIPO
        Generic map (
            N => 16  -- Set the data width to 16
        )
        Port map (
            clk     => clk,
            rst     => rst,
            load    => load,
            data_in => data_in,
            data_out => data_out
        );

end Behavioral;

