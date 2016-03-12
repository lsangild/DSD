library verilog;
use verilog.vl_types.all;
entity full_adder_vlg_check_tst is
    port(
        c1              : in     vl_logic;
        c2              : in     vl_logic;
        cout            : in     vl_logic;
        s1              : in     vl_logic;
        sum             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end full_adder_vlg_check_tst;
