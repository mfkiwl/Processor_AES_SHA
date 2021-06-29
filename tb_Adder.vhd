----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.06.2021 19:01:51
-- Design Name: 
-- Module Name: tb_Adder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_Adder is
--  Port ( );
end tb_Adder;

architecture Behavioral of tb_Adder is
    component Adder is
        Port ( Instruction : in STD_LOGIC_VECTOR (31 downto 0);
               OutAdder : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal instructionAddress, nextAddress: STD_LOGIC_VECTOR (31 downto 0);
begin
    instructionAddress <= x"00000003" after 0 ns, x"00000012" after 10 ns;    
    
    Address_adder: adder port map(instructionAddress, nextAddress);

end Behavioral;
