`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:00:30 03/27/2016 
// Design Name: 
// Module Name:    led 
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
module led(
	input [15:0]y,
	input clk,
	input reset,
	output [6:0] a_to_g,
	output [3:0] en,
	output dp
    );
reg [3:0] an;
reg [6:0] ag;
reg [3:0] digit;   
reg [20:0] cot;  
assign dp = 1;   
assign s = cot[18:17];   

always @ ( * ) 
case (s)   
 0: digit = y[15:12];  
 1: digit = y[11:8]; 
 2: digit = y[7:4];
 3: digit = y[3:0]; 
 default: digit = y[15:12];  
endcase 
 
always @ ( * )  
 case (digit)   
 0: ag = 7'b000_0001;  
 1: ag = 7'b100_1111;
 2: ag = 7'b001_0010;  
 3: ag = 7'b000_0110;  
 4: ag = 7'b100_1100;  
 5: ag = 7'b010_0100;  
 6: ag = 7'b010_0000;  
 7: ag = 7'b000_1111;  
 8: ag = 7'b000_0000;  
 9: ag = 7'b000_0100;  
 'hA: ag = 7'b000_1000;  
 'hB: ag = 7'b110_0000;  
 'hC: ag = 7'b011_0001;  
 'hD: ag = 7'b100_0010;  
 'hE: ag = 7'b011_0000;  
 'hF: ag = 7'b011_1000;   
 default: ag = 7'b000_0001;   
endcase   
 always @ ( * )  
 begin   
 an = 4'b1111;   
 an[s] = 0;  
 end     
always @ (posedge clk or negedge reset)  
 begin   
 if (!reset)  
	cot <= 0;  
else 
   	cot <= cot + 1; 
end
assign a_to_g = ag;
assign en = an;
endmodule
