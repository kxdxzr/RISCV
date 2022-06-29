library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.common.all;

entity interme1_control is
    port (reset : in  std_logic;
          clk   : in  std_logic;
          addrin : in std_logic;
          addrout : out std_logic);
end entity interme1_control;

--
-- Note: Because this core is FPGA-targeted, the idea is that these registers
--   will get implemented as dual-port Distributed RAM.  Because there is no
--   such thing as triple-port memory in an FPGA (that I know of), and we
--   need 3 ports to support 2 reads and 1 write per cycle, the easiest way
--   to implement that is to have two identical banks of registers that contain
--   the same data.  Each uses 2 ports and everybody's happy.
--
architecture rtl of interme1_control is

    signal reg0 : std_logic := '0';
begin  -- architecture Behavioral

    -- purpose: create registers
    -- type   : sequential
    -- inputs : clk
    -- outputs:
    registers_proc : process (clk) is
    begin  -- process registers_proc
        if rising_edge(clk) then
            reg0 <= addrin;
        end if;
    end process registers_proc;

    -- asynchronous read
    addrout <= reg0;
end architecture rtl;
