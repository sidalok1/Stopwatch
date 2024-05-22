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
    input sel_clk,
    input rst,
    input int,
    input sel,
    input adj,
    output [7:0] seconds,
    output [7:0] minutes
    );
    
    wire selected_clock;
    reg [5:0] s;
    reg [6:0] m;
    
    assign selected_clock = (adj) ? sel_clk : clk;
    
    initial begin
        s = 0;
        m = 0;
    end
    
    always @ (posedge selected_clock, posedge rst) begin
        if (rst) begin
            s <= 0;
            m <= 0;
        end
        else if (~adj) begin
            if (~int) begin
                if (s == 'd59) begin
                    s <= 0;
                    m <= m + 1;
                end 
                else s <= s + 1;
            end
        end
        else begin
            if (~int) begin
                if (sel) begin
                    if (s == 'd59) begin
                        s <= 0;
                    end 
                    else s <= s + 1;
                end 
                else m <= m + 1;
            end
        end
    end

    assign seconds = s;
    
    assign minutes = m;
endmodule
