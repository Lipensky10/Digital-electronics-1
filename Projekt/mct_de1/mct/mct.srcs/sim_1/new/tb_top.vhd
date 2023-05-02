----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.04.2023 22:48:34
-- Design Name: 
-- Module Name: tb_TOP - Behavioral
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


entity tb_TOP is

end tb_TOP;

architecture testbench of tb_TOP is
    constant ClockFrequency : integer :=100e6;
    constant ClockPeriod    : time    := 1000 ms/ClockFrequency;
    
    signal clk     : std_logic := '1';
    signal bin     : std_logic_vector(4 downto 0) := "00000";
    signal rst     : std_logic := '0';
    signal LED     : std_logic;
    signal MORS    : std_logic;
begin
uut_TOP : entity work.TOP

port map(
SW =>bin,
CLK100MHz => clk,
BTNC => rst,
LED => LED,
MORS =>MORS
);
--dut


--Clock
clk <= not clk after ClockPeriod/2;

p_stimulus : process is
begin
wait for 1 ns;
rst <='1';
wait for 1 ns;
rst <='0';
--0 A
bin <="00000";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--1 B
wait for 50 us;
bin <="00001";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--2 C
wait for 50 us;
bin <="00010";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--3 D
wait for 50 us;
bin <="00011";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--4 E
wait for 50 us;
bin <="00100";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--5 F
wait for 50 us;
bin <="00101";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--6 G
wait for 50 us;
bin <="00110";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--7 H
wait for 50 us;
bin <="00111";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--8 Ch
wait for 50 us;
bin <="01000";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--9 I
wait for 50 us;
bin <="01001";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--10 J
wait for 50 us;
bin <="01010";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--11 K
wait for 50 us;
bin <="01011";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--12 L
wait for 50 us;
bin <="01100";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--13 M
wait for 50 us;
bin <="01101";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--14 N
wait for 50 us;
bin <="01110";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--15 O
wait for 50 us;
bin <="01111";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--16 P
wait for 50 us;
bin <="10000";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--17 Q
wait for 50 us;
bin <="10001";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--18 R
wait for 50 us;
bin <="10010";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--19 S
wait for 50 us;
bin <="10011";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--20 T
wait for 50 us;
bin <="10100";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--21 U
wait for 50 us;
bin <="10101";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--22 V
wait for 50 us;
bin <="10110";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--23 W
wait for 50 us;
bin <="10111";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--24 X
wait for 50 us;
bin <="11000";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--25 Y
wait for 50 us;
bin <="11001";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--26 Z
wait for 50 us;
bin <="11010";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--27 Teèka
wait for 50 us;
bin <="11011";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--28  Otazník
wait for 50 us;
bin <="11100";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--29 Vykøièník
wait for 50 us;
bin <="11101";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--30 Èárka
wait for 50 us;
bin <="11110";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';
--31 Dvojteèka
wait for 50 us;
bin <="11111";
wait for 15 ns;
rst <='1';
wait for 15 ns;
rst <='0';




wait for 10 us;
rst <='1';
wait;
end process p_stimulus;
end testbench;
