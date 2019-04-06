-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/02/2019 14:01:58"
                                                            
-- Vhdl Test Bench template for design  :  turn_signals
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY turn_signals_vhd_tst IS
END turn_signals_vhd_tst;
ARCHITECTURE turn_signals_arch OF turn_signals_vhd_tst IS
constant clk_period : time := 100000 ns;                                               
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL l : STD_LOGIC;
SIGNAL lSignal : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL r : STD_LOGIC;
SIGNAL rSignal : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT turn_signals
	PORT (
	clk : IN STD_LOGIC;
	l : IN STD_LOGIC;
	lSignal : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	r : IN STD_LOGIC;
	rSignal : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : turn_signals
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	l => l,
	lSignal => lSignal,
	r => r,
	rSignal => rSignal
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
   r<= '0';l <= '1'; wait for 2*clk_period;
	l <= '0'; wait for 4*clk_period;
	l <= '1'; r<='1'; wait for 2*clk_period;
	l <= '0'; wait for 2*clk_period;
	r <= '0'; wait for 4*clk_period;
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN
for i in 1 to 20 loop
	clk<= '0'; wait for clk_period/2;
	clk<= '1'; wait for clk_period/2;  
end loop;	
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END turn_signals_arch;
