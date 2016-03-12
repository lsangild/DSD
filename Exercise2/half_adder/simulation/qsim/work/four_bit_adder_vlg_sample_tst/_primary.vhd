library verilog;
use verilog.vl_types.all;
entity four_bit_adder_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        cin             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end four_bit_adder_vlg_sample_tst;
