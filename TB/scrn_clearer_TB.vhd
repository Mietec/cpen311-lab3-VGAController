library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.scrn_clearerDecs.all; 

entity scrn_clearer_TB is
end entity; 

architecture impl of scrn_clearer_TB is
  
  signal CLOCK_50: std_logic := '0';
  signal rst : std_logic := '0';
  signal color: std_logic_vector(2 downto 0);
  signal x : std_logic_vector(7 downto 0);
  signal y : std_logic_vector(6 downto 0);
  signal plot : std_logic;
  signal done : std_logic;
  
  begin
    
    DUT : scrn_clearer port map(CLOCK_50 => CLOCK_50, rst => rst, color => color, x => x,
                                y => y, plot => plot, done => done);  
    
    process begin
      
      wait for 10 ps;
      
      rst <= '1'; 
      
      wait for 10 ps; 
      
      rst <= '0';
      
      for I in 0 to 50000 loop
        
        
        wait for 10 ps;
        
        CLOCK_50 <= not CLOCK_50; 
        
        if(I = 18) then
          wait for 5 ps;
          rst <= '1';
          wait for 2 ps;
          rst <= '0';
        end if;
        
      end loop; 
      wait; 
    end process; 
end impl; 