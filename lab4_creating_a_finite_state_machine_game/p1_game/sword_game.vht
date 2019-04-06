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
-- Generated on "03/02/2019 12:13:37"
                                                            
-- Vhdl Test Bench template for design  :  sword_game
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY sword_game_vhd_tst IS
END sword_game_vhd_tst;
ARCHITECTURE sword_game_arch OF sword_game_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL d : STD_LOGIC;
SIGNAL roomBits : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL rst : STD_LOGIC;
SIGNAL s : STD_LOGIC;
SIGNAL swordBit : STD_LOGIC;
SIGNAL w : STD_LOGIC;
SIGNAL winLose : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT sword_game
	PORT (
	a : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	d : IN STD_LOGIC;
	roomBits : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	rst : IN STD_LOGIC;
	s : IN STD_LOGIC;
	swordBit : OUT STD_LOGIC;
	w : IN STD_LOGIC;
	winLose : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : sword_game
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	clk => clk,
	d => d,
	roomBits => roomBits,
	rst => rst,
	s => s,
	swordBit => swordBit,
	w => w,
	winLose => winLose
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN   
 a <= '0'; s<='0'; d <= '0';w<= '0';
 rst <= '1'; wait for 40 ns;
 rst <= '0'; wait for 30 ns;
 d <= '1'; wait for 15 ns;
 d <= '0';wait for 30 ns;
 s <= '1'; wait for 15 ns;
 s <= '0'; wait for 30 ns;
-- a <= '1'; wait for 15 ns; -- without going to sword room, you will lose
-- a <= '0'; wait for 30 ns;
 d <= '1'; wait for 15 ns;
 d <= '0'; wait for 20 ns;
 d <= '1'; wait for 15 ns;
  
 
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations

              
BEGIN 
	for i in 1 to 100 loop
			clk <= '0'; wait for 5 ns ;
			clk <= '1'; wait for 5 ns ;
	end loop;   
                                                                           
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END sword_game_arch;
