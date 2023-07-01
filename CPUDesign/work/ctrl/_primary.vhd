library verilog;
use verilog.vl_types.all;
entity ctrl is
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        func            : in     vl_logic_vector(5 downto 0);
        RegDst          : out    vl_logic_vector(1 downto 0);
        ALUSrc          : out    vl_logic;
        MemRead         : out    vl_logic;
        RegWrite        : out    vl_logic;
        MemWrite        : out    vl_logic;
        DatatoReg       : out    vl_logic_vector(1 downto 0);
        PC_sel          : out    vl_logic_vector(1 downto 0);
        ExtOp           : out    vl_logic;
        ALUCtrl         : out    vl_logic_vector(4 downto 0);
        Memout          : out    vl_logic
    );
end ctrl;
