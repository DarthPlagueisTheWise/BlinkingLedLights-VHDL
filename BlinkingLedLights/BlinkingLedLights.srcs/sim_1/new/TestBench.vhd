library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LED_Blink_tb is
end LED_Blink_tb;

architecture Behavioral of LED_Blink_tb is
    component LED_Blink
        Port ( CLK : in STD_LOGIC;
               LED : out STD_LOGIC);
    end component;

    signal CLK : STD_LOGIC := '0';
    signal LED : STD_LOGIC;

    constant CLK_PERIOD : time := 10 ns;

begin
    uut: LED_Blink Port map (
          CLK => CLK,
          LED => LED
        );

    CLK_process : process
    begin
        while true loop
            CLK <= '0';
            wait for CLK_PERIOD/2;
            CLK <= '1';
            wait for CLK_PERIOD/2;
        end loop;
    end process;

    stimulus_process : process
    begin
        wait for 1000 * CLK_PERIOD;
        wait;
    end process;

end Behavioral;
