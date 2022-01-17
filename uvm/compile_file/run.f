-uvmhome $UVMHOME
-incdir ../uvm

# Add package and top module to compile and simulate
../uvm/test_pkg/hello_pkg.sv
../uvm/interface/test_ifc.sv
../uvm/test_pkg/base_test_pkg.sv
../uvm/tb_top/top.sv