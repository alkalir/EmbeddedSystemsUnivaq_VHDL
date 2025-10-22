library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PIPO is
    Generic (
        N : integer := 8  -- Data width (default to 8 bits)
    );
    Port (
        clk     : in  STD_LOGIC;                    -- Clock signal
        rst     : in  STD_LOGIC;                    -- Reset signal
        load    : in  STD_LOGIC;                    -- Load control signal
        data_in : in  STD_LOGIC_VECTOR(N-1 downto 0);  -- Parallel data input
        data_out : out STD_LOGIC_VECTOR(N-1 downto 0)  -- Parallel data output
    );
end PIPO;

architecture Behavioral of PIPO is
    signal reg : STD_LOGIC_VECTOR(N-1 downto 0);  -- Internal register for PIPO
begin
    process(clk, rst)
    begin
        if rst = '1' then
            reg <= (others => '0');  -- Reset the register
        elsif rising_edge(clk) then
            if load = '1' then
                reg <= data_in;  -- Load the data into the register
            end if;
        end if;
    end process;

    data_out <= reg;  -- Output the contents of the register

end Behavioral;

