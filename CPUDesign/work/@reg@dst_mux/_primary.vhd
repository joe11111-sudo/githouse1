library verilog;
use verilog.vl_types.all;
entity RegDst_mux is
    port(
        RegDst          : in     vl_logic_vector(1 downto 0);
        Instrl_rs       : in     vl_logic_vector(20 downto 16);
        Instrl_rt       : in     vl_logic_vector(15 downto 11);
        Reg_rd          : out    vl_logic_vector(4 downto 0)
    );
end RegDst_mux;
