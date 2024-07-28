library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LED_Blink is
    Port ( 
           CLK : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR(3 downto 0);
           LED : out STD_LOGIC_VECTOR(3 downto 0));
end LED_Blink;

architecture Behavioral of LED_Blink is
    signal counter : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
begin

LED(0) <= counter(23) when (sw(0) = '1') else '0';
LED(1) <= counter(22) when (sw(1) = '1') else '0';
LED(2) <= counter(21) when (sw(2) = '1') else '0';
LED(3) <= counter(20) when sw(3) = '1' else '0';

    process(CLK)
    begin
        if rising_edge(CLK) then
            
            counter <= std_logic_vector(TO_UNSIGNED((TO_INTEGER(unsigned(counter)) + 1),24));
            
            
        end if;
    end process;
end Behavioral;

