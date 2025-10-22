library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity subtractor is
    port( 
        rst: in std_logic;
        cmd: in std_logic_vector( 1 downto 0 );
        x, y: in unsigned ( 3 downto 0 );
        xout, yout: out unsigned ( 3 downto 0 )
    );
end subtractor;

architecture subtractor_arc of subtractor is
begin
    process( rst, cmd, x, y )
    begin
        if( rst = '1' or cmd = "00" ) then
            xout <= "0000";
            yout <= "0000";
        elsif( cmd = "10" ) then
            xout <= ( x - y );
            yout <= y;
        elsif( cmd = "01" ) then
            xout <= x;
            yout <= ( y - x );
        else
            xout <= x;
            yout <= y;
        end if;
    end process;
end subtractor_arc;
