----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2023 01:56:23
-- Design Name: 
-- Module Name: Top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Top is
    Port ( 
    SW         : in STD_LOGIC_VECTOR (4 downto 0);   --Switches representing binary input of letters
    BTNC       : in STD_LOGIC;                      --Reset button
    CLK100MHZ  : in STD_LOGIC;                       --FPGAs 100 MHz internal clock signal
    --morse     : out STD_LOGIC;                     
    LED        : out STD_LOGIC;                        --Output of LED signal
    MORS       : out STD_LOGIC                         --Output of morse pin signal
    );                     
end Top;

architecture Behavioral of Top is
signal sig_morse : std_logic;
begin
MCT : entity work.MorseCodeTransmitter
generic map( 
ClockFrequency => 100e6
)
Port map(
rst   =>BTNC,
bin   => SW,
clk   => CLK100MHZ,
morse =>  sig_morse 


);


LED <= sig_morse;
MORS <= sig_morse;
 
 
end Behavioral;
