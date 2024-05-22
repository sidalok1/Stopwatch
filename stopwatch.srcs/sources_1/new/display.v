`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2024 12:08:26 AM
// Design Name: 
// Module Name: display
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


module display(disp_clk, adj_clk, adj, sel, minutes, seconds, segment, anodes);
    input disp_clk;
    input adj_clk;
    input adj;
    input sel;
    input [7:0] minutes;
    input [7:0] seconds;
    output [6:0] segment;
    output wire [3:0] anodes;
    
    wire [3:0] a;

    wire [1:0] m;
    wire [1:0] s;
    
    reg [1:0] cnt;
    reg [3:0] currentNum;
    reg [3:0] disp_anodes;
    
    DecimalDecoder decode(.bin(currentNum), .cathodes(segment));
    
    initial 
        cnt = 2'b00;
    
    always @ (posedge disp_clk) begin 
        cnt <= cnt + 1;
        case (cnt)
            2'b00: begin
                disp_anodes <= 4'b1110;
                currentNum <= (((seconds % 1000) % 100) % 10);
            end
            2'b01: begin
                disp_anodes <= 4'b1101;
                currentNum <= ((seconds % 1000) % 100) / 10;
            end
            2'b10: begin
                disp_anodes <= 4'b1011;
                currentNum <= (((minutes % 1000) % 100) % 10);
            end
            2'b11: begin
                disp_anodes <= 4'b0111;
                currentNum <= ((minutes % 1000) % 100) / 10;
            end
        endcase
    end
    
    //assign a = (sel & adj) ? (disp_anodes | 4'b1100) : (disp_anodes | 4'b0011);

    assign m = (adj & ~sel) ? (disp_anodes[3:2] | {2{adj_clk}}) : disp_anodes[3:2];

    assign s = (adj & sel) ? (disp_anodes[1:0] | {2{adj_clk}}) : disp_anodes[1:0];
    
    assign anodes = {m, s};
    
endmodule

module DecimalDecoder(bin, cathodes);
    input [3:0] bin;
    
    output reg [6:0] cathodes;
    
    always @ (*) begin
        case(bin)
            4'd1: cathodes = 7'b1111001;
            4'd2: cathodes = 7'b0100100;
            4'd3: cathodes = 7'b0110000;
            4'd4: cathodes = 7'b0011001;
            4'd5: cathodes = 7'b0010010;
            4'd6: cathodes = 7'b0000010;
            4'd7: cathodes = 7'b1111000;
            4'd8: cathodes = 7'b0000000;
            4'd9: cathodes = 7'b0011000;
            default: cathodes = 7'b1000000;
        endcase
    end
endmodule 