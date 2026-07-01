`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 14:16:57
// Design Name: 
// Module Name: ahb_master_driver
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

(* keep_hierarchy = "yes" *)
(* dont_touch = "true" *)

module ahb_master_driver (
    input  wire        HCLK,
    input  wire        HRESETn,
    input  wire        HREADY,
    input  wire [31:0] HRDATA,
    input  wire        HRESP, // Now handled!
    output reg  [31:0] HADDR,
    output reg  [1:0]  HTRANS,
    output reg         HWRITE,
    output reg         HSEL,
    output reg  [2:0]  HSIZE,
    output reg  [2:0]  HBURST,
    output reg  [31:0] HWDATA,
    output wire  [3:0] State_LED
);

reg [3:0] seq;

always @(posedge HCLK or posedge HRESETn) begin
    if (HRESETn) begin
        seq <= 0; HTRANS <= 0; HSEL <= 0;
        HADDR <= 0; HWDATA <= 0; HWRITE <= 0;
        HSIZE <= 3'b010; HBURST <= 3'b000;
    end else if (HRESP && HREADY) begin
        // ERROR HANDLING PROTOCOL: If an error is detected, safely park the master
        HTRANS <= 2'b00;
        HSEL   <= 1'b0;
        seq    <= 0; // Reset your test sequence sequence loop back to the start
    end else begin
//        case (seq)
//            0: begin // Safe Start Write 0xFF to reg0
//                if (HREADY) begin
//                    HSEL<=1; HTRANS<=2'b10; HWRITE<=1;
//                    HADDR<=32'h0000_0000; seq<=1;
//                end
//            end
//            1: begin
//                if (HREADY) begin
//                    HWDATA<=32'hFF; HTRANS<=2'b00;
//                    HSEL<=0; seq<=2;
//                end
//            end
//            2: begin // Write 0xAA to reg1
//                if (HREADY) begin
//                    HSEL<=1; HTRANS<=2'b10; HWRITE<=1;
//                    HADDR<=32'h0000_0004; seq<=3;
//                end
//            end
//            3: begin
//                if (HREADY) begin
//                    HWDATA<=32'hAA; HTRANS<=2'b00;
//                    HSEL<=0; seq<=4;
//                end
//            end
//            4: begin // Read reg0
//                if (HREADY) begin
//                    HSEL<=1; HTRANS<=2'b10; HWRITE<=0;
//                    HADDR<=32'h0000_0000; seq<=5;
//                end
//            end
//            5: begin
//                if (HREADY) begin
//                    HTRANS<=2'b00; HSEL<=0; seq<=6;
//                end
//            end
//            6: begin
//                if (HREADY) begin
//                    seq<=0; // Safely loop back
//                end
//            end
//            default: seq <= 0;
//        endcase

        case (seq)
            0: begin // Transaction A (Write): Start Address Phase
                if (HREADY) begin
                    HSEL   <= 1'b1; 
                    HTRANS <= 2'b10; // NONSEQ
                    HWRITE <= 1'b1;
                    HADDR  <= 32'h0000_0000; 
                    seq    <= 1;
                end
            end
            
            1: begin // Transaction B (Write): Hold Address Phase B 
                     // and supply Data Phase A ONLY when the bus is ready!
                if (HREADY) begin
                    HWDATA <= 32'h0000_00FF; // Data for A
                    HADDR  <= 32'h0000_0004; // Address for B
                    HTRANS <= 2'b11;         // SEQ (Burst continue)
                    HWRITE <= 1'b1;
                    seq    <= 2;
                end
            end
            
            2: begin // Transaction C (Read): Hold Address Phase C
                     // and supply Data Phase B ONLY when the bus is ready!
                if (HREADY) begin
                    HWDATA <= 32'h0000_00AA; // Data for B
                    HADDR  <= 32'h0000_0008; // Address for C
                    HTRANS <= 2'b11;         // SEQ (Burst continue)
                    HWRITE <= 1'b0;         // Switch to Read command
                    seq    <= 3;
                end
            end
            
            3: begin // Wrap up the Data Phase for Transaction C
                if (HREADY) begin
                    HTRANS <= 2'b00; // End of burst sequence
                    HSEL   <= 1'b0;
                    seq    <= 4;
                end
            end
            
            4: begin
                if (HREADY) begin
                    seq <= 0; // Loop test bench indefinitely
                end
            end
            default: seq <= 0;
        endcase
    end
end
assign State_LED = seq;
endmodule
