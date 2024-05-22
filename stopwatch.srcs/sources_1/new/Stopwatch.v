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
    input btn_rst,
    input btn_ps,
    input btn_sel,
    input btn_adj,
    output [6:0] seg,
    output [3:0] an
    );

    
    wire [7:0] min;
    wire [7:0] sec;

    wire [3:0] sysClks;
    
    
    
    clock sysClock(
            .clk(clk),
            .clk_1hz(sysClks[3]),
            .clk_2hz(sysClks[2]),
            .clk_5hz(sysClks[1]),
            .clk_100hz(sysClks[0])
            );

    counter cnter(
            .rst(btn_rst),
            .int(btn_ps),
            .clk(sysClks[3]),
            .sel_clk(sysClks[2]),
            .sel(btn_sel),
            .adj(btn_adj),
            .seconds(sec),
            .minutes(min)
            );

    display disp(
            .disp_clk(sysClks[0]),
            .adj_clk(sysClks[1]), 
            .adj(btn_adj),
            .sel(btn_sel),
            .minutes(min), 
            .seconds(sec), 
            .segment(seg), 
            .anodes(an)
            );
            
    

endmodule
