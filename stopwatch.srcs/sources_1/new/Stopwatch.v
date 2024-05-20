`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2024 12:14:51 AM
// Design Name: 
// Module Name: Stopwatch
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


module Stopwatch(
    input clk,
    output [6:0] seg,
    output [3:0] an
    );

    wire rst;
    
    wire [7:0] min;
    wire [7:0] sec;

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
            .clk(sysClks[3]),
            .seconds(sec),
            .minutes(min)
            );

    display disp(
            .disp_clk(sysClks[0]), 
            .minutes(min), 
            .seconds(sec), 
            .segment(seg), 
            .anodes(an)
            );

endmodule
