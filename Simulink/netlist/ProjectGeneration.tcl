# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator. 
#


namespace eval ::xilinx::dsp::planaheaddriver {
	set BoardFileVersion {3.3}
	set BoardName {zcu102}
	set BoardRevision {1.0}
	set BoardVendor {xilinx.com}
	set Compilation {IP Catalog}
	set CompilationFlow {IP}
	set CreateInterfaceDocument {on}
	set DSPDevice {xczu9eg}
	set DSPFamily {zynquplus}
	set DSPPackage {ffvb1156}
	set DSPSpeed {-2-e}
	set FPGAClockPeriod 10
	set GenerateTestBench 1
	set HDLLanguage {verilog}
	set IPOOCCacheRootPath {C:/Users/prodrigu/AppData/Local/Xilinx/Sysgen/SysgenVivado/win64.o/ip}
	set IP_Auto_Infer {1}
	set IP_Categories_Text {System Generator for DSP}
	set IP_Common_Repos {0}
	set IP_Description {}
	set IP_Dir {}
	set IP_Library_Text {SysGen}
	set IP_LifeCycle_Menu {1}
	set IP_Logo {sysgen_icon_100.png}
	set IP_Name {untitled}
	set IP_Revision {200392715}
	set IP_Socket_IP {0}
	set IP_Socket_IP_Proj_Path {}
	set IP_Vendor_Text {User Company}
	set IP_Version_Text {1.0}
	set ImplStrategyName {Vivado Implementation Defaults}
	set PostProjectCreationProc {dsp_package_for_vivado_ip_integrator}
	set Project {pe}
	set ProjectFiles {
		{{conv_pkg.v}}
		{{synth_reg.v}}
		{{synth_reg_w_init.v}}
		{{convert_type.v}}
		{{xlclockdriver_rd.v}}
		{{vivado_ip.tcl}}
		{{pe_entity_declarations.v}}
		{{pe.v}}
		{{pe_tb.v}}
		{{pe_clock.xdc}}
		{{pe.xdc}}
		{{pe.htm}}
	}
	set SimPeriod 1
	set SimTime 10
	set SimulationTime {310.00000000 ns}
	set SynthStrategyName {Vivado Synthesis Defaults}
	set SynthesisTool {Vivado}
	set TargetDir {C:/Users/prodrigu/git/simpleNeuralNetwork/Simulink/netlist}
	set TestBenchModule {pe_tb}
	set TopLevelModule {pe}
	set TopLevelSimulinkHandle 0.00012207
	set TopLevelPortInterface {}
	dict set TopLevelPortInterface rst_in Name {rst_in}
	dict set TopLevelPortInterface rst_in Type Bool
	dict set TopLevelPortInterface rst_in ArithmeticType xlUnsigned
	dict set TopLevelPortInterface rst_in BinaryPoint 0
	dict set TopLevelPortInterface rst_in Width 1
	dict set TopLevelPortInterface rst_in DatFile {pe_rst_in.dat}
	dict set TopLevelPortInterface rst_in IconText {rst_in}
	dict set TopLevelPortInterface rst_in Direction in
	dict set TopLevelPortInterface rst_in Period 1
	dict set TopLevelPortInterface rst_in Interface 0
	dict set TopLevelPortInterface rst_in InterfaceName {}
	dict set TopLevelPortInterface rst_in InterfaceString {DATA}
	dict set TopLevelPortInterface rst_in ClockDomain {pe}
	dict set TopLevelPortInterface rst_in Locs {}
	dict set TopLevelPortInterface rst_in IOStandard {}
	dict set TopLevelPortInterface x_in Name {x_in}
	dict set TopLevelPortInterface x_in Type XFloat_8_24
	dict set TopLevelPortInterface x_in ArithmeticType xlFloat
	dict set TopLevelPortInterface x_in BinaryPoint 24
	dict set TopLevelPortInterface x_in Width 32
	dict set TopLevelPortInterface x_in DatFile {pe_x_in.dat}
	dict set TopLevelPortInterface x_in IconText {X_in}
	dict set TopLevelPortInterface x_in Direction in
	dict set TopLevelPortInterface x_in Period 1
	dict set TopLevelPortInterface x_in Interface 0
	dict set TopLevelPortInterface x_in InterfaceName {}
	dict set TopLevelPortInterface x_in InterfaceString {DATA}
	dict set TopLevelPortInterface x_in ClockDomain {pe}
	dict set TopLevelPortInterface x_in Locs {}
	dict set TopLevelPortInterface x_in IOStandard {}
	dict set TopLevelPortInterface w_in Name {w_in}
	dict set TopLevelPortInterface w_in Type XFloat_8_24
	dict set TopLevelPortInterface w_in ArithmeticType xlFloat
	dict set TopLevelPortInterface w_in BinaryPoint 24
	dict set TopLevelPortInterface w_in Width 32
	dict set TopLevelPortInterface w_in DatFile {pe_w_in.dat}
	dict set TopLevelPortInterface w_in IconText {W_in}
	dict set TopLevelPortInterface w_in Direction in
	dict set TopLevelPortInterface w_in Period 1
	dict set TopLevelPortInterface w_in Interface 0
	dict set TopLevelPortInterface w_in InterfaceName {}
	dict set TopLevelPortInterface w_in InterfaceString {DATA}
	dict set TopLevelPortInterface w_in ClockDomain {pe}
	dict set TopLevelPortInterface w_in Locs {}
	dict set TopLevelPortInterface w_in IOStandard {}
	dict set TopLevelPortInterface w_out Name {w_out}
	dict set TopLevelPortInterface w_out Type XFloat_8_24
	dict set TopLevelPortInterface w_out ArithmeticType xlFloat
	dict set TopLevelPortInterface w_out BinaryPoint 24
	dict set TopLevelPortInterface w_out Width 32
	dict set TopLevelPortInterface w_out DatFile {pe_w_out.dat}
	dict set TopLevelPortInterface w_out IconText {W_out}
	dict set TopLevelPortInterface w_out Direction out
	dict set TopLevelPortInterface w_out Period 1
	dict set TopLevelPortInterface w_out Interface 0
	dict set TopLevelPortInterface w_out InterfaceName {}
	dict set TopLevelPortInterface w_out InterfaceString {DATA}
	dict set TopLevelPortInterface w_out ClockDomain {pe}
	dict set TopLevelPortInterface w_out Locs {}
	dict set TopLevelPortInterface w_out IOStandard {}
	dict set TopLevelPortInterface x_out Name {x_out}
	dict set TopLevelPortInterface x_out Type XFloat_8_24
	dict set TopLevelPortInterface x_out ArithmeticType xlFloat
	dict set TopLevelPortInterface x_out BinaryPoint 24
	dict set TopLevelPortInterface x_out Width 32
	dict set TopLevelPortInterface x_out DatFile {pe_x_out.dat}
	dict set TopLevelPortInterface x_out IconText {X_out}
	dict set TopLevelPortInterface x_out Direction out
	dict set TopLevelPortInterface x_out Period 1
	dict set TopLevelPortInterface x_out Interface 0
	dict set TopLevelPortInterface x_out InterfaceName {}
	dict set TopLevelPortInterface x_out InterfaceString {DATA}
	dict set TopLevelPortInterface x_out ClockDomain {pe}
	dict set TopLevelPortInterface x_out Locs {}
	dict set TopLevelPortInterface x_out IOStandard {}
	dict set TopLevelPortInterface result_out Name {result_out}
	dict set TopLevelPortInterface result_out Type XFloat_8_24
	dict set TopLevelPortInterface result_out ArithmeticType xlFloat
	dict set TopLevelPortInterface result_out BinaryPoint 24
	dict set TopLevelPortInterface result_out Width 32
	dict set TopLevelPortInterface result_out DatFile {pe_result_out.dat}
	dict set TopLevelPortInterface result_out IconText {result_out}
	dict set TopLevelPortInterface result_out Direction out
	dict set TopLevelPortInterface result_out Period 1
	dict set TopLevelPortInterface result_out Interface 0
	dict set TopLevelPortInterface result_out InterfaceName {}
	dict set TopLevelPortInterface result_out InterfaceString {DATA}
	dict set TopLevelPortInterface result_out ClockDomain {pe}
	dict set TopLevelPortInterface result_out Locs {}
	dict set TopLevelPortInterface result_out IOStandard {}
	dict set TopLevelPortInterface clk Name {clk}
	dict set TopLevelPortInterface clk Type -
	dict set TopLevelPortInterface clk ArithmeticType xlUnsigned
	dict set TopLevelPortInterface clk BinaryPoint 0
	dict set TopLevelPortInterface clk Width 1
	dict set TopLevelPortInterface clk DatFile {}
	dict set TopLevelPortInterface clk Direction in
	dict set TopLevelPortInterface clk Period 1
	dict set TopLevelPortInterface clk Interface 6
	dict set TopLevelPortInterface clk InterfaceName {}
	dict set TopLevelPortInterface clk InterfaceString {CLOCK}
	dict set TopLevelPortInterface clk ClockDomain {pe}
	dict set TopLevelPortInterface clk Locs {}
	dict set TopLevelPortInterface clk IOStandard {}
	dict set TopLevelPortInterface clk AssociatedInterfaces {}
	dict set TopLevelPortInterface clk AssociatedResets {}
	set MemoryMappedPort {}
}

source SgPaProject.tcl
::xilinx::dsp::planaheadworker::dsp_create_project