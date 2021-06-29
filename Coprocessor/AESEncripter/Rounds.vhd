library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Rounds is
    Port ( Round_in : in STD_LOGIC_VECTOR (127 downto 0);
           Key_in : in STD_LOGIC_VECTOR (127 downto 0);
           Key_out : inout STD_LOGIC_VECTOR (127 downto 0);
           Rcon_in : in STD_LOGIC_VECTOR (7 downto 0);
           Round_out : out STD_LOGIC_VECTOR (127 downto 0));
end Rounds;

architecture Behavioral of Rounds is
    
    Component KeyExpansion is 
        Port ( K : in STD_LOGIC_VECTOR (127 downto 0);
               Rcon : in STD_LOGIC_VECTOR (7 downto 0);
               W : out STD_LOGIC_VECTOR (127 downto 0));
    end Component;
    
    Component ByteSub is 
        Port ( Sub_in : in STD_LOGIC_VECTOR (127 downto 0);
               Sub_out : out STD_LOGIC_VECTOR (127 downto 0));
    end Component;
    
    Component ShiftRow is 
        Port ( Shift_in : in STD_LOGIC_VECTOR (127 downto 0);
               Shift_out : out STD_LOGIC_VECTOR (127 downto 0));
    end Component;
    
    Component MixColumns is
        Port ( Mix_in : in STD_LOGIC_VECTOR (127 downto 0);
               Mix_out : out STD_LOGIC_VECTOR (127 downto 0));
    end Component;
    
    Component AddRoundKey is 
        Port ( S_in : in STD_LOGIC_VECTOR (127 downto 0);
               Kr_in : in STD_LOGIC_VECTOR (127 downto 0);
               Add_out : out STD_LOGIC_VECTOR (127 downto 0));
    end Component;
    
    signal Sub_inout, Shift_inout, Mix_inout : STD_LOGIC_VECTOR (127 downto 0);

begin
    S1: KeyExpansion port map (Key_in, Rcon_in, Key_out);
    
    S2: ByteSub port map (Round_in, Sub_inout);
    
    S3: ShiftRow port map (Sub_inout, Shift_inout);
    
    S4: MixColumns port map (Shift_inout, Mix_inout);
    
    S5: AddRoundKey port map (Mix_inout, Key_out, Round_out);

end Behavioral;
