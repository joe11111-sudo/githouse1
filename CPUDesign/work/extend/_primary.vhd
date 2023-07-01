library verilog;
use verilog.vl_types.all;
entity extend is
    port(
        \in\            : in     vl_logic_vector(15 downto 0);
        ExtOp           : in     vl_logic;
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end extend;
