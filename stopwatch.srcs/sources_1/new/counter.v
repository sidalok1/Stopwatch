`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 11:39:58
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input rst,
    output seconds,
    output minutes
    );
    
    reg [5:0] s;
    reg [6:0] m;
    
    initial begin
        s = 0;
        m = 0;
    end
    
    always @ (posedge rst) begin
        s = 0;
        m = 0;
    end
    
    always @ (posedge clk) begin
        s <= s + 1;
        if (s % 59 == 0) begin
            s <= 0;
            m <= m + 1;
        end
    end
    
    assign seconds = s;
    
    assign minutes = m;
endmodule