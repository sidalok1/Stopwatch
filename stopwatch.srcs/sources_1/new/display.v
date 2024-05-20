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


module display(disp_clk, minutes, seconds, segment, anodes);
    input disp_clk;
    input [7:0] minutes;
    input [7:0] seconds;
    output [6:0] segment;
    output reg [3:0] anodes;
    
    reg [1:0] counter;
    reg [3:0] currentNum;
    
    DecimalDecoder decode(.bin(currentNum), .cathodes(segment));
    
    initial 
        counter = 2'b00;
    
    always @ (disp_clk) begin 
        counter <= counter + 1;
        case (counter)
            2'b00: begin
                anodes <= 4'b1110;
                currentNum <= (((seconds % 1000) % 100) % 10);
            end
            2'b01: begin
                anodes <= 4'b1101;
                currentNum <= ((seconds % 1000) % 100) / 10;
            end
            2'b10: begin
                anodes <= 4'b1011;
                currentNum <= (((minutes % 1000) % 100) % 10);
            end
            2'b11: begin
                anodes <= 4'b0111;
                currentNum <= ((minutes % 1000) % 100) / 10;
            end
        endcase
    end
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