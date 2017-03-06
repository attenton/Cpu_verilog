`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:28:29 03/27/2016 
// Design Name: 
// Module Name:    PCPUclk 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PCPUclk(
	input clock,
	output cpuclk				
    );
reg cpu_clk;
reg [1:0] key;
reg encount;
reg [20:0] wdcount = 0;

always @ (posedge clock)//°´¼üÏû¶¶
begin
	key <= {key[0],clock};
	encount <= key[1] ^ key[0];
	if(encount)
	   wdcount <= 0;
	else
		wdcount <= wdcount + 1'b1;
	if(wdcount[20] == 1)
	   cpu_clk = key[0];
end
assign cpuclk = cpu_clk;

endmodule
