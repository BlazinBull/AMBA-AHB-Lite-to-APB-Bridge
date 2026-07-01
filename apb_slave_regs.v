`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 14:10:57
// Design Name: 
// Module Name: apb_slave_regs
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

module apb_slave_regs (
    input  wire        PCLK,
    input  wire        PRESETn,
    input  wire [31:0] PADDR,
    input  wire        PSEL,
    input  wire        PENABLE,
    input  wire        PWRITE,
    input  wire [31:0] PWDATA,
    output reg  [31:0] PRDATA,
    output wire        PREADY,
    output wire        PSLVERR,
    output wire [7:0]  LED_OUT  // connect to ZedBoard LEDs
);

assign PREADY  = 1'b1;
assign PSLVERR = 1'b0;

reg [31:0] reg0, reg1, reg2, reg3;

assign LED_OUT = reg0[7:0];

always @(posedge PCLK or posedge PRESETn) begin
    if (PRESETn) begin
        reg0 <= 0; reg1 <= 0;
        reg2 <= 0; reg3 <= 0;
    end else if (PSEL && PENABLE && PWRITE) begin
        case (PADDR[3:2])
            2'b00: reg0 <= PWDATA;
            2'b01: reg1 <= PWDATA;
            2'b10: reg2 <= PWDATA;
            2'b11: reg3 <= PWDATA;
        endcase
    end
end

always @(*) begin
    case (PADDR[3:2])
        2'b00: PRDATA = reg0;
        2'b01: PRDATA = reg1;
        2'b10: PRDATA = reg2;
        2'b11: PRDATA = reg3;
        default: PRDATA = 32'h0;
    endcase
end

endmodule
