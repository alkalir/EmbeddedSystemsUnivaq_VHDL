library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity gcd_msf_dp is
    port(
        rst, clk, go_i: in std_logic;
        x_i, y_i: in std_logic_vector(3 downto 0);
        d_o: out std_logic_vector(3 downto 0)
    );
end gcd_msf_dp;

architecture gcd_arc of gcd_msf_dp is

    component fsm is
        port(
            rst       : in std_logic;
            clk       : in std_logic;
            proceed   : in std_logic;
            comparison: in std_logic_vector(1 downto 0);
            enable    : out std_logic;
            xsel      : out std_logic;
            ysel      : out std_logic;
            xld       : out std_logic;
            yld       : out std_logic
        );
    end component;

    component mux is
        port(
            rst    : in std_logic;
            sLine  : in std_logic;
            load   : in std_logic_vector(3 downto 0);
            result : in std_logic_vector(3 downto 0);
            output : out std_logic_vector(3 downto 0)
        );
    end component;

    component comparator is
        port(
            rst   : in std_logic;
            x     : in std_logic_vector(3 downto 0);
            y     : in std_logic_vector(3 downto 0);
            output: out std_logic_vector(1 downto 0)
        );
    end component;

    component subtractor is
        port(
            rst : in std_logic;
            cmd : in std_logic_vector(1 downto 0);
            x   : in std_logic_vector(3 downto 0);
            y   : in std_logic_vector(3 downto 0);
            xout: out std_logic_vector(3 downto 0);
            yout: out std_logic_vector(3 downto 0)
        );
    end component;

    component regis is
        port(
            rst   : in std_logic;
            clk   : in std_logic;
            load  : in std_logic;
            input : in std_logic_vector(3 downto 0);
            output: out std_logic_vector(3 downto 0)
        );
    end component;

    signal xld, yld, xsel, ysel, enable: std_logic;
    signal comparison: std_logic_vector(1 downto 0);
    signal result: std_logic_vector(3 downto 0);
    signal xsub, ysub, xmux, ymux, xreg, yreg: std_logic_vector(3 downto 0);

begin

    TOFSM: fsm port map(
        rst        => rst,
        clk        => clk,
        proceed    => go_i,
        comparison => comparison,
        enable     => enable,
        xsel       => xsel,
        ysel       => ysel,
        xld        => xld,
        yld        => yld
    );

    X_MUX: mux port map(
        rst    => rst,
        sLine  => xsel,
        load   => x_i,
        result => xsub,
        output => xmux
    );

    Y_MUX: mux port map(
        rst    => rst,
        sLine  => ysel,
        load   => y_i,
        result => ysub,
        output => ymux
    );

    X_REG: regis port map(
        rst    => rst,
        clk    => clk,
        load   => xld,
        input  => xmux,
        output => xreg
    );

    Y_REG: regis port map(
        rst    => rst,
        clk    => clk,
        load   => yld,
        input  => ymux,
        output => yreg
    );

    U_COMP: comparator port map(
        rst    => rst,
        x      => xreg,
        y      => yreg,
        output => comparison
    );

    X_SUB: subtractor port map(
        rst  => rst,
        cmd  => comparison,
        x    => xreg,
        y    => yreg,
        xout => xsub,
        yout => ysub
    );

    OUT_REG: regis port map(
        rst    => rst,
        clk    => clk,
        load   => enable,
        input  => xsub,
        output => result
    );

    d_o <= result;

end gcd_arc;
