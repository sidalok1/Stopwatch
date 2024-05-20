`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 10:29:41 AM
// Design Name: 
// Module Name: Test_Leds
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Test_Leds(
    output wire [15:0] led,
    input clk
    );
    
    wire rst;
    
    wire [3:0] sysClks;
    
    assign rst = 0;
    
    clock sysClock(
            .rst(rst),
            .clk(clk),
            .clk_1hz(sysClks[3]),
            .clk_2hz(sysClks[2]),
            .clk_10hz(sysClks[1]),
            .clk_100hz(sysClks[0])
            );
            
     counter cnt(
            .rst(rst),
            .clk(sysClks[1]),
            .seconds(led[7:0]),
            .minutes(led[15:8])
            );
    
endmodule
