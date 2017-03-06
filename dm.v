`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:29:15 03/14/2016 
// Design Name: 
// Module Name:    dm 
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
module dm(reset,dwe,addr,wdata,rdata);
input reset, dwe;
input [7:0] addr;
input [15:0] wdata;
output reg[15:0] rdata;
reg [15:0] d_mem[63:0];

always @(*)
begin
  if(!reset)
  begin
  rdata <= 0;
  
  //最大公因数 最小公倍数data
  /*d_mem[0] <= 16'h0000;
  d_mem[1] <= 16'h0020;
  d_mem[2] <= 16'h0018;
  //*/
  //冒泡排序data
  /*d_mem[0] <= 16'h000a;
  d_mem[1] <= 16'h0004;
  d_mem[2] <= 16'h0005;
  d_mem[3] <= 16'h2369;
  d_mem[4] <= 16'h69c3;
  d_mem[5] <= 16'h0060;
  d_mem[6] <= 16'h0fff;
  d_mem[7] <= 16'h5555;
  d_mem[8] <= 16'h6152;
  d_mem[9] <= 16'h1057;
  d_mem[10] <= 16'h2895;//*/
  
  //sort
  /*d_mem[0] <= 16'h000a;
  d_mem[1] <= 16'h0009;
  d_mem[2] <= 16'h0006;
  d_mem[3] <= 16'h0005;
  d_mem[4] <= 16'h0001;
  d_mem[5] <= 16'h0004;
  d_mem[6] <= 16'h0003;
  d_mem[7] <= 16'h0011;
  //*/
  //64badde
  d_mem[0] <= 16'hfffe;
  d_mem[1] <= 16'hfffe;
  d_mem[2] <= 16'hfffe;
  d_mem[3] <= 16'h0000;
  d_mem[4] <= 16'hffff;
  d_mem[5] <= 16'hffff;
  d_mem[6] <= 16'hffff;
  d_mem[7] <= 16'h0000;//*/
  //init_test
  /*d_mem[0] <= 16'hfffd;
  d_mem[1] <= 16'h0004;
  d_mem[2] <= 16'h0005;
  d_mem[3] <= 16'hc369;
  d_mem[4] <= 16'h69c3;
  d_mem[5] <= 16'h0041;
  d_mem[6] <= 16'hffff;
  d_mem[7] <= 16'h0001;//*/
  end
  else
  begin
    if(dwe) d_mem[addr] <= wdata;
	 else rdata <= d_mem[addr];
  end
end

endmodule
