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
-- Generated on "03/18/2019 15:27:56"
                                                            
-- Vhdl Test Bench template for design  :  alu
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY alu_vhd_tst IS
END alu_vhd_tst;
ARCHITECTURE alu_arch OF alu_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL alu_ctl : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL alu_flgs : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL result : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT alu
	PORT (
	A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	alu_ctl : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	alu_flgs : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : alu
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	alu_ctl => alu_ctl,
	alu_flgs => alu_flgs,
	B => B,
	result => result
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN  
alu_ctl<="00";                                                      
A<=x"00000000"; B<=x"00000000"; wait for 10 ns;
A<=x"00000000"; B<=x"FFFFFFFF"; wait for 10 ns;
A<=x"00000001"; B<=x"ffffffff"; wait for 10 ns;
A<=x"000000FF"; B<=x"00000001"; wait for 10 ns;

alu_ctl<="01";
A<=x"00000000"; B<=x"00000000"; wait for 10 ns;
A<=x"00000000"; B<=x"FFFFFFFF"; wait for 10 ns;
A<=x"00000001"; B<=x"00000001"; wait for 10 ns;
A<=x"00000100"; B<=x"00000001"; wait for 10 ns;

alu_ctl<="10";
A<=x"FFFFFFFF"; B<=x"FFFFFFFF"; wait for 10 ns;
A<=x"FFFFFFFF"; B<=x"12345678"; wait for 10 ns;
A<=x"12345678"; B<=x"87654321"; wait for 10 ns;
A<=x"00000000"; B<=x"FFFFFFFF"; wait for 10 ns;

alu_ctl<="11";
A<=x"FFFFFFFF"; B<=x"FFFFFFFF"; wait for 10 ns;
A<=x"12345678"; B<=x"87654321"; wait for 10 ns;
A<=x"00000000"; B<=x"FFFFFFFF"; wait for 10 ns;
A<=x"00000000"; B<=x"00000000"; wait for 10 ns;
                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END alu_arch;
