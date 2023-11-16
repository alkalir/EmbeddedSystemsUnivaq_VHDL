LIBRARY ieee ;
USE ieee.std_logic_1164.ALL;

-----------------------------------------------------

ENTITY seq_detector IS
PORT(	x:		IN std_logic;
		clock:	IN std_logic;
		reset:	IN std_logic;
		y:		OUT std_logic
);
END seq_detector;

-----------------------------------------------------

ARCHITECTURE behav OF seq_detector IS

    -- define the states of FSM model

    TYPE state_type IS (IDLE, FIRST_BIT, SEC_BIT, DETECT);
    SIGNAL next_state, current_state: state_type;

BEGIN
    
    -- state register
    state_reg: PROCESS(clock, reset)
    BEGIN

	IF (reset='1') THEN
            current_state <= IDLE;
	ELSIF (clock'event and clock='1') THEN
	    current_state <= next_state;
	END IF;

    END PROCESS;						  

    -- next state logic
    comb_logic: PROCESS(current_state, x)
    BEGIN

	CASE current_state IS

	    WHEN IDLE =>
			IF x='0' THEN
			    next_state <= IDLE;
			ELSIF x ='1' THEN
			    next_state <= FIRST_BIT;
			END IF;

	    WHEN FIRST_BIT =>
			IF x='0' then 
			    next_state <= SEC_BIT;
			ELSIF x='1' THEN
			    next_state <= IDLE;
			END IF;

	    WHEN SEC_BIT =>
			IF x='0' then
			    next_state <= IDLE;
			ELSIF x='1' THEN
			    next_state <= DETECT;
			END IF;

	    WHEN DETECT =>
			IF x='0' THEN 
			    next_state <= IDLE;
			ELSIF x='1' THEN 
			    next_state <= FIRST_BIT;
			END IF;

	    WHEN OTHERS =>
			next_state <= IDLE;

	END CASE;

    END PROCESS;
	
	-- Output Logic
	y <= '1' WHEN current_state = DETECT ELSE '0';

END behav;
