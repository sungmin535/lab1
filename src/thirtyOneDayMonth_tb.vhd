--+----------------------------------------------------------------------------
--| 
--| COPYRIGHT 2017 United States Air Force Academy All rights reserved.
--| 
--| United States Air Force Academy     __  _______ ___    _________ 
--| Dept of Electrical &               / / / / ___//   |  / ____/   |
--| Computer Engineering              / / / /\__ \/ /| | / /_  / /| |
--| 2354 Fairchild Drive Ste 2F6     / /_/ /___/ / ___ |/ __/ / ___ |
--| USAF Academy, CO 80840           \____//____/_/  |_/_/   /_/  |_|
--| 
--| ---------------------------------------------------------------------------
--|
--| FILENAME      : thirtyOneDayMonth_tb.vhd (TEST BENCH)
--| AUTHOR(S)     : Capt Dan Johnson, ***Your Name Here***
--| CREATED       : 12/12/2019 Last Modified 06/24/2020
--| DESCRIPTION   : This file tests to ensure thirtyOneDayMonthMux works properly
--|
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES :
--|
--|    Libraries : ieee
--|    Packages  : std_logic_1164, numeric_std, unisim
--|    Files     : thirtyOneDayMonth.vhd
--|
--+----------------------------------------------------------------------------
--|
--| NAMING CONVENSIONS :
--|
--|    xb_<port name>           = off-chip bidirectional port ( _pads file )
--|    xi_<port name>           = off-chip input port         ( _pads file )
--|    xo_<port name>           = off-chip output port        ( _pads file )
--|    b_<port name>            = on-chip bidirectional port
--|    i_<port name>            = on-chip input port
--|    o_<port name>            = on-chip output port
--|    c_<signal name>          = combinatorial signal
--|    f_<signal name>          = synchronous signal
--|    ff_<signal name>         = pipeline stage (ff_, fff_, etc.)
--|    <signal name>_n          = active low signal
--|    w_<signal name>          = top level wiring signal
--|    g_<generic name>         = generic
--|    k_<constant name>        = constant
--|    v_<variable name>        = variable
--|    sm_<state machine type>  = state machine type definition
--|    s_<signal name>          = state name
--|
--+----------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  
entity thirtyOneDayMonth_tb is --notice entity is empty.  The testbench has no external connections.
end thirtyOneDayMonth_tb;

architecture test_bench of thirtyOneDayMonth_tb is 
	
  -- declare the component of your top-level design unit under test (UUT) (looks very similar to entity declaration)
  component thirtyoneDayMonth is
    port(
	i_A : in std_logic;
	i_B : in std_logic;
	i_C : in std_logic;
	i_D : in std_logic;
	o_Y : out std_logic
    );	
  end component;

  -- declare any additional components required
  
  signal w_sw : std_logic_vector (3 downto 0):= (others=> '0');
  signal w_Y : std_logic := '0';

  
begin
	-- PORT MAPS ----------------------------------------
	-- map ports for any component instances (port mapping is like wiring hardware)
    thirtyOneDayMonthMux_inst : thirtyOneDayMonth port map (
			i_D => w_sw(0),
			i_C => w_sw(1),
			i_B => w_sw(2),
			i_A => w_sw(3),
	    	o_Y => w_Y
        );
	-----------------------------------------------------

	-- PROCESSES ----------------------------------------	
	-- Test Plan Process --------------------------------
	-- Implement the test plan here.  Body of process is continuous from time = 0  
	test_process : process 
	begin
	-- Place test cases here. The first two have been written for you
        w_sw <= x"0";  wait for 10 ns;
            assert (w_Y = '0') report "Error on x0" severity failure;
        w_sw <= x"1";  wait for 10 ns;
            assert (w_Y = '1') report "Error on Jan (x1)" severity failure;
        w_sw <= x"2";  wait for 10 ns;
            assert (w_Y = '0') report "Error on Feb (x2)" severity failure;
        w_sw <= x"3";  wait for 10 ns;
            assert (w_Y = '1') report "Error on Mar (x3)" severity failure;
        w_sw <= x"4";  wait for 10 ns;
            assert (w_Y = '0') report "Error on Apr (x4)" severity failure;
        w_sw <= x"5";  wait for 10 ns;
            assert (w_Y = '1') report "Error on May (x5)" severity failure;
        w_sw <= x"6";  wait for 10 ns;
            assert (w_Y = '0') report "Error on Jun (x6)" severity failure;
        w_sw <= x"7";  wait for 10 ns;
            assert (w_Y = '1') report "Error on Jul (x7)" severity failure;
        w_sw <= x"8";  wait for 10 ns;
            assert (w_Y = '1') report "Error on Aug (x8)" severity failure;
        w_sw <= x"9";  wait for 10 ns;
            assert (w_Y = '0') report "Error on Sep (x9)" severity failure;
        w_sw <= x"A";  wait for 10 ns;
            assert (w_Y = '1') report "Error on Oct (xA)" severity failure;
        w_sw <= x"B";  wait for 10 ns;
            assert (w_Y = '0') report "Error on Nov (xB)" severity failure;
        w_sw <= x"C";  wait for 10 ns;
            assert (w_Y = '1') report "Error on Dec (xC)" severity failure;
        
		wait; -- wait forever
	end process;	
	-----------------------------------------------------	
	
end test_bench;
