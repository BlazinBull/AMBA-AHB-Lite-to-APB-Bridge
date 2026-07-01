//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
//Date        : Tue Jun 16 16:48:52 2026
//Host        : LAPTOP-16F8RVH6 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (HCLK,
    HRESETn,
    LED_OUT,
    State_LED);
  input HCLK;
  input HRESETn;
  output [7:0]LED_OUT;
  output [3:0]State_LED;

  wire HCLK;
  wire HRESETn;
  wire [7:0]LED_OUT;
  wire [3:0]State_LED;

  design_1 design_1_i
       (.HCLK(HCLK),
        .HRESETn(HRESETn),
        .LED_OUT(LED_OUT),
        .State_LED(State_LED));
endmodule
