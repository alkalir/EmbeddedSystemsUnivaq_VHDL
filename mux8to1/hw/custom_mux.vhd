library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity custom_mux is

  Port ( 
        a: in std_logic;
        b: in std_logic;
        c: in std_logic;
        d: in std_logic;
        sel: in std_logic_vector(2 downto 0);
        z: out std_logic
        );
        
end custom_mux;


architecture arch of custom_mux is

-- declaration area

component mux_8to1 is
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
end component;

signal gnd: std_logic;

begin

gnd <= '0';

first_mux: mux_8to1
    port map (
                a => a,
                b => b,
                c => c,
                d => d,
                e => gnd,
                f => gnd,
                g => gnd,
                h => gnd,
                sel => sel,
                z => z
             );
    
end architecture;
