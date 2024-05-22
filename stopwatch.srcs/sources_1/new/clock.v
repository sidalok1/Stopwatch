`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 10:31:53
// Design Name: 
// Module Name: clock
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


module clock(
    input clk,
    output reg clk_1hz,
    output reg clk_2hz,
    output reg clk_5hz,
    output reg clk_100hz
    );
    
    reg [27:0] clk_dvd;
    
    initial begin
        clk_dvd <= 28'b0;
        clk_1hz <= 0;
        clk_2hz <= 0;
        clk_5hz <= 0;
        clk_100hz <= 0;  
    end
    
    
    always @ (posedge clk) begin       
        if (clk_dvd == 'd100_000_000) clk_dvd <= 28'b0;
        else begin 
            clk_dvd <= clk_dvd + 1'b1;
            if (clk_dvd % 'd250_000 == 0) 
                clk_100hz <= ~clk_100hz;
            if (clk_dvd % 'd10_000_000 == 0) 
                clk_5hz <= ~clk_5hz;
            if (clk_dvd % 'd25_000_000 == 0) 
                clk_2hz <= ~clk_2hz;
            if (clk_dvd % 'd50_000_000 == 0) 
                clk_1hz <= ~clk_1hz;
        end
    end
    
    
    
endmodule
