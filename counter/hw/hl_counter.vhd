library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- NOTE ABOUT DESCRIPTION PRACTICES--
-- Good description practices say that the ports of entities should be of type std_logic/std_logic_vector, while the internal signals should be of type signed/unsigned

ENTITY hl_counter is
    PORT ( clk       : in   STD_LOGIC;
			  reset     : in   STD_LOGIC;
           count_out : out  STD_LOGIC_VECTOR (3 downto 0));
END hl_counter;

ARCHITECTURE behav OF hl_counter IS

	SIGNAL temp_count  : std_logic_vector(3 downto 0) := "0000"; 
	SIGNAL temp_count_internal: unsigned (3 downto 0);
	SIGNAL slow_clk    : std_logic;
	SIGNAL clk_divider : std_logic_vector(23 downto 0) := x"000000";
	SIGNAL clk_divider_internal: unsigned(23 downto 0);

BEGIN

	clk_division : PROCESS (clk, reset) 
	BEGIN
	
	   IF reset = '1' THEN
	      slow_clk<='0';
          clk_divider<=(others=>'0');
          clk_divider_internal<=(others=>'0');
		ELSIF clk'event AND clk = '1' THEN
		  clk_divider_internal <= clk_divider_internal + 1; 
		  clk_divider<=std_logic_vector(clk_divider_internal);
		  
		END IF; 
		 
		slow_clk <= clk_divider(23); 

	END PROCESS; 
	
	counting : PROCESS(reset,slow_clk, temp_count) 
	BEGIN
		
		IF reset = '1' THEN
			temp_count_internal <= "0000";
			temp_count<=std_logic_vector(temp_count_internal);
			
		ELSIF slow_clk'event AND slow_clk= '1' THEN
			IF temp_count_internal < 9 then
				temp_count_internal <= temp_count_internal + 1; 
				temp_count<=std_logic_vector(temp_count_internal);
			ELSE
				temp_count_internal <= "0000";
				temp_count<=std_logic_vector(temp_count_internal);
			END IF;
		END IF;
		
		count_out <= temp_count; 
END PROCESS; 
        
        END behav;
