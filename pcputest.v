`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:22:23 05/14/2016
// Design Name:   PCPUCTRL
// Module Name:   E:/CSP/Lab_floder/PCPU/pcputest.v
// Project Name:  PCPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PCPUCTRL
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pcputest;

	// Inputs
	reg clk;
	reg enable;
	reg reset;
	reg [3:0] select_y;
	reg start;
	reg clock;

	// Outputs
	wire [6:0] a_to_g;
	wire [3:0] en;
	wire dp;

	// Instantiate the Unit Under Test (UUT)
	PCPUCTRL uut (
		.clk(clk), 
		.enable(enable), 
		.reset(reset), 
		.select_y(select_y), 
		.start(start), 
		.clock(clock), 
		.a_to_g(a_to_g), 
		.en(en), 
		.dp(dp)
	);
always #5	clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		enable = 0;
		reset = 0;
		select_y = 0;
		start = 0;
		clock = 0;
        
		// Add stimulus here
$display("pc:     id_ir      :i_datain:     ex_ir      :     ALUo      :reg_A:reg_B:reg_C:da: dd :w:reC1:gr0: gr1: gr2: gr3: gr4: gr5: gr6: gr7:cf:nf:zf");
$monitor("%h:%b:  %h  :%b:%b: %h :%h:%h:%h:%h:%b:%h:%h:%h:%h:%h:%h:%h:%h:%h:%b:%b:%b", 
	uut.pcpu.pc, uut.pcpu.id_ir, uut.pcpu.i_datain,uut.pcpu.ex_ir,uut.pcpu.ALUo , uut.pcpu.reg_A, uut.pcpu.reg_B, uut.pcpu.reg_C,
	uut.pcpu.d_addr, uut.pcpu.d_dataout, uut.pcpu.d_we, uut.pcpu.reg_C1, uut.pcpu.gr[0], uut.pcpu.gr[1], uut.pcpu.gr[2], uut.pcpu.gr[3],
	uut.pcpu.gr[4], uut.pcpu.gr[5], uut.pcpu.gr[6],uut.pcpu.gr[7], uut.pcpu.cf, uut.pcpu.nf,uut.pcpu.zf);


		// Wait 100 ns for global reset to finish
		#10;
        start <= 0; 
			reset = 1;
		#10;
		reset <= 0;
		#10;
		start <= 1;
		
		reset <= 1;
		
		enable <= 1;
		#100;
		start <= 0;
		 
	
			
		// Add stimulus here

	end 
      
endmodule

