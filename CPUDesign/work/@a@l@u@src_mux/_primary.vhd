library verilog;
use verilog.vl_types.all;
entity ALUSrc_mux is
    port(
        grf_out         : in     vl_logic_vector(31 downto 0);
        extend_out      : in     vl_logic_vector(31 downto 0);
        ALUSrc          : in     vl_logic;
        ALUSrc_mux_out  : out    vl_logic_vector(31 downto 0)
    );
end ALUSrc_mux;
