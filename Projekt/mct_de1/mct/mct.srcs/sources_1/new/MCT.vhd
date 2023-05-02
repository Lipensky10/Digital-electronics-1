----------------------------------------------------------------------------------
-- University: Brno University of Technology
-- Authors: Daniel Graf & Lukáš Lipenský
-- 
-- Create Date: 22.04.2023 18:51:52
-- Project Name: One letter morse code transmitter
-- Module Name: MorseCodeTransmitter 

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity MorseCodeTransmitter is
generic(
ClockFrequency : integer := 100e6;            --FPGAs 100 MHz clock signal
SimulationDevider : integer :=1               --Deviding cycles for simulation purposes
);
Port (
    clk : in std_logic;
    rst   : in std_logic;                    --Reset
    bin   : in std_logic_vector(4 downto 0); --Binary input of letters
    morse : out std_logic                    --Morse code output (Blinking RGB led, output signal on pmod pins)
    
 );
end MorseCodeTransmitter;

architecture Behavioral of MorseCodeTransmitter is
    signal ticks : integer := 0;
begin
    
    MCT : process(clk) is
    begin
    
        if rising_edge(clk) then
            if rst= '1' then 
                morse <='0';
                ticks <=0;
                
            else
                ticks <= ticks+1;
                
                if bin ="00000" then --A
                
                    if ticks= 0 then --Start, LED ON for 1 cycle (dot)
                        morse<= '1';
                    elsif ticks=((ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse<='0';
                    elsif ticks=((2*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <= '1';
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((8*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0;
                    end if;
                end if;
              
              
              if bin="00001" then --B
                   
                    if ticks=0 then -- START, LED ON for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <= '1'; 
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((6*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((8*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((9*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((12*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0; 
                    end if;
                end if;  
                
                
              if bin="00010" then --C
                   
                    if ticks= 0 then -- START, LED ON for 3 cycles (dash)
                        morse <= '1';
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <= '1';
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((6*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((9*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((10*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';                 
                    elsif ticks=((11*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse<='0';
                    elsif ticks =((14*ClockFrequency)/3)/SimulationDevider then --counter reset
                         ticks<=0; 
                    end if;
                end if; 
                
                
              if bin="00011" then --D
                   
                    if ticks= 0 then -- START, LED ON for 3 cycles (dash)
                        morse <= '1';
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <= '1';
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((6*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';                
                    elsif ticks =((10*ClockFrequency)/3)/SimulationDevider then --counter reset
                         ticks<=0; 
                    end if;
                end if;
                
                
                 if bin ="00100" then --E
                
                    if ticks= 0 then --Start, LED ON for 1 cycle (dot)
                        morse<= '1';
                    elsif ticks=((ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse<='0';
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0;
                    end if;
                end if;
                
                
                if bin="00101" then --F
                   
                    if ticks=0 then -- START, LED ON for 1 cycle (dot)
                        morse <= '1'; 
                    elsif ticks=((ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((2*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <= '1'; 
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((8*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((9*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((12*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0; 
                    end if;
                end if;
                
                
                if bin="00110" then --G
                   
                    if ticks= 0 then -- START, LED ON for 3 cycles (dash)
                        morse <= '1';
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <= '1';
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((8*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((9*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';                
                    elsif ticks =((12*ClockFrequency)/3)/SimulationDevider then --counter reset
                         ticks<=0; 
                    end if;
                end if;
                
                
                if bin="00111" then --H 
                   
                    if ticks=0 then -- START, LED ON for 1 cycles (dot)
                        morse <= '1'; 
                    elsif ticks=((1*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((2*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <= '1'; 
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((6*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((10*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0; 
                    end if;
                end if;
                
                
                if bin="01000" then --Ch
                   
                    if ticks=0 then -- START, LED ON for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((8*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((11*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((12*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((15*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((18*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0; 
                    end if;
                end if;
                
                
                if bin ="01001" then --I
                
                    if ticks= 0 then --Start, LED ON for 1 cycle (dot)
                        morse<= '1';
                    elsif ticks=((ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse<='0';
                    elsif ticks=((2*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <= '1';
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((6*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0;
                    end if;
                end if;
                
                
                if bin="01010" then --J
                   
                    if ticks=0 then -- START, LED ON for 1 cycle (dot)
                        morse <= '1'; 
                    elsif ticks=((ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((2*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((6*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((9*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((10*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((13*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((16*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0; 
                    end if;
                end if;
                
                
                if bin="01011" then --K
                   
                    if ticks= 0 then -- START, LED ON for 3 cycles (dash)
                        morse <= '1';
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <= '1';
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((6*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((9*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';                
                    elsif ticks =((12*ClockFrequency)/3)/SimulationDevider then --counter reset
                         ticks<=0; 
                    end if;
                end if;
                
                
                if bin="01100" then --L
                   
                    if ticks=0 then -- START, LED ON for 1 cycle (dot)
                        morse <= '1'; 
                    elsif ticks=((ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((2*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((6*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((8*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((9*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((12*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0; 
                    end if;
                end if;
                
                
                if bin ="01101" then --M
                
                    if ticks= 0 then --Start, LED ON for 3 cycles (dash)
                        morse<= '1';
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse<='0';
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <= '1';
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((10*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0;
                    end if;
                end if;
                
                
                if bin ="01110" then --N
                
                    if ticks= 0 then --Start, LED ON for 3 cycles (dash)
                        morse<= '1';
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse<='0';
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <= '1';
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((8*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0;
                    end if;
                end if;
                
                
                if bin="01111" then --O
                   
                    if ticks= 0 then -- START, LED ON for 3 cycles (dash)
                        morse <= '1';
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <= '1';
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((8*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((11*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';                
                    elsif ticks =((14*ClockFrequency)/3)/SimulationDevider then --counter reset
                         ticks<=0; 
                    end if;
                end if;
                
                
                if bin="10000" then --P
                   
                    if ticks=0 then -- START, LED ON for 1 cycle (dot)
                        morse <= '1'; 
                    elsif ticks=((ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((2*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((6*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((9*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((10*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((11*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((14*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0; 
                    end if;
                end if;
                
                
                if bin="10001" then --Q
                   
                    if ticks=0 then -- START, LED ON for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((8*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((9*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((10*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((13*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((16*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0; 
                    end if;
                end if;
                
                
                if bin="10010" then --R
                   
                    if ticks= 0 then -- START, LED ON for 1 cycle (dot)
                        morse <= '1';
                    elsif ticks=((ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((2*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <= '1';
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((6*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';                
                    elsif ticks =((10*ClockFrequency)/3)/SimulationDevider then --counter reset
                         ticks<=0; 
                    end if;
                end if;
                
                
                if bin="10011" then --S
                   
                    if ticks= 0 then -- START, LED ON for 1 cycle (dot)
                        morse <= '1';
                    elsif ticks=((ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((2*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <= '1';
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';                
                    elsif ticks =((8*ClockFrequency)/3)/SimulationDevider then --counter reset
                         ticks<=0; 
                    end if;
                end if;
                
                
                if bin ="10100" then --T
                
                    if ticks= 0 then --Start, LED ON for 3 cycles (dash)
                        morse<= '1';
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse<='0';
                    elsif ticks=((6*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0;
                    end if;
                end if;
                
                
                if bin="10101" then --U
                   
                    if ticks= 0 then -- START, LED ON for 1 cycle (dot)
                        morse <= '1';
                    elsif ticks=((ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((2*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <= '1';
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';                
                    elsif ticks =((10*ClockFrequency)/3)/SimulationDevider then --counter reset
                         ticks<=0; 
                    end if;
                end if;
                
                
                if bin="10110" then --V
                   
                    if ticks=0 then -- START, LED ON for 1 cycle (dot)
                        morse <= '1'; 
                    elsif ticks=((ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((2*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <= '1'; 
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((6*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((9*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((12*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0; 
                    end if;
                end if;
                
                
                if bin="10111" then --W
                   
                    if ticks= 0 then -- START, LED ON for 1 cycle (dot)
                        morse <= '1';
                    elsif ticks=((ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((2*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <= '1';
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((6*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((9*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';                
                    elsif ticks =((12*ClockFrequency)/3)/SimulationDevider then --counter reset
                         ticks<=0; 
                    end if;
                end if;
                
                
                if bin="11000" then --X
                   
                    if ticks=0 then -- START, LED ON for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <= '1'; 
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((6*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((8*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((11*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((14*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0; 
                    end if;
                end if;
                
                
                if bin="11001" then --Y
                   
                    if ticks=0 then -- START, LED ON for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <= '1'; 
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((6*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((9*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((10*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((13*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((16*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0; 
                    end if;
                end if;
                
                
                if bin="11010" then --Z
                   
                    if ticks=0 then -- START, LED ON for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((8*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((9*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((10*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((11*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((14*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0; 
                    end if;
                end if;
                
                
                if bin="11011" then --Teèka
                   
                    if ticks=0 then -- START, LED ON for 1 cycle (dot)
                        morse <= '1'; 
                    elsif ticks=((ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((2*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((5*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((6*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((8*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((11*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((12*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((13*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((14*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((17*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((20*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0; 
                    end if;
                end if;
                
                
                if bin="11100" then --Otazník
                   
                    if ticks=0 then -- START, LED ON for 1 cycle (dot)
                        morse <= '1'; 
                    elsif ticks=((ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((2*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <= '1'; 
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((8*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((11*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((12*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((13*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((14*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((15*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=(18*ClockFrequency)/3 then --counter reset
                        ticks<=0; 
                    end if;
                end if;
                
                
                if bin="11101" then --Vykøièník
                   
                    if ticks=0 then -- START, LED ON for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((8*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((9*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((10*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((11*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((12*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((13*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((14*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((17*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((20*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0; 
                    end if;
                end if;
                
                
                if bin="11110" then --Èárka
                   
                    if ticks=0 then -- START, LED ON for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((8*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((9*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((10*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((11*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((12*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((15*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((16*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((19*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((22*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0; 
                    end if;
                end if;
                
                
                if bin="11111" then --Dvojteèka
                   
                    if ticks=0 then -- START, LED ON for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((3*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((4*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <= '1'; 
                    elsif ticks=((7*ClockFrequency)/3)/SimulationDevider then  --off for 1 cycle (pause)
                        morse <='0'; 
                    elsif ticks=((8*ClockFrequency)/3)/SimulationDevider then --on for 3 cycles (dash)
                        morse <='1';
                    elsif ticks=((11*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((12*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((13*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((14*ClockFrequency)/3)/SimulationDevider then --on for 1 cycle (dot)
                        morse <='1';
                    elsif ticks=((15*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((16*ClockFrequency)/3)/SimulationDevider then --on for 1 cycles (dot)
                        morse <='1';
                    elsif ticks=((17*ClockFrequency)/3)/SimulationDevider then --off for 1 cycle (pause)
                        morse <='0';
                    elsif ticks=((20*ClockFrequency)/3)/SimulationDevider then --counter reset
                        ticks<=0; 
                    end if;
                end if;
                
                
            end if;
        end if;
    
    end process MCT;
end architecture Behavioral;
