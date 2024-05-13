`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 11:07:21
// Design Name: 
// Module Name: tb
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


module tb(

    );
    
    reg clk;
    wire [3:0] clk_read;
    
    
    initial begin 
        clk = 0;
    forever #5 clk = ~clk;
    end
    
    clock clk_mod(
        .clk(clk), 
        .clk_1hz(clk_read[3]), 
        .clk_2hz(clk_read[2]),
        .clk_10hz(clk_read[1]),
        .clk_100hz(clk_read[0])
    );
    
    //counter timer(.clk(clk)
endmodule
