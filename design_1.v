//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
//Date        : Tue Jun 16 16:48:52 2026
//Host        : LAPTOP-16F8RVH6 running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,da_ps7_cnt=1,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
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
  wire [31:0]ahb_apb_bridge_0_HRDATA;
  wire ahb_apb_bridge_0_HREADY;
  wire ahb_apb_bridge_0_HRESP;
  wire [31:0]ahb_apb_bridge_0_PADDR;
  wire ahb_apb_bridge_0_PENABLE;
  wire [3:0]ahb_apb_bridge_0_PSEL;
  wire [31:0]ahb_apb_bridge_0_PWDATA;
  wire ahb_apb_bridge_0_PWRITE;
  wire [31:0]ahb_master_driver_0_HADDR;
  wire [2:0]ahb_master_driver_0_HBURST;
  wire ahb_master_driver_0_HSEL;
  wire [2:0]ahb_master_driver_0_HSIZE;
  wire [1:0]ahb_master_driver_0_HTRANS;
  wire [31:0]ahb_master_driver_0_HWDATA;
  wire ahb_master_driver_0_HWRITE;
  wire [31:0]apb_slave_regs_0_PRDATA;
  wire apb_slave_regs_0_PREADY;
  wire apb_slave_regs_0_PSLVERR;
  wire [0:0]xlslice_0_Dout;

  design_1_ahb_apb_bridge_0_0 ahb_apb_bridge_0
       (.HADDR(ahb_master_driver_0_HADDR),
        .HBURST(ahb_master_driver_0_HBURST),
        .HCLK(HCLK),
        .HRDATA(ahb_apb_bridge_0_HRDATA),
        .HREADY(ahb_apb_bridge_0_HREADY),
        .HRESETn(HRESETn),
        .HRESP(ahb_apb_bridge_0_HRESP),
        .HSEL(ahb_master_driver_0_HSEL),
        .HSIZE(ahb_master_driver_0_HSIZE),
        .HTRANS(ahb_master_driver_0_HTRANS),
        .HWDATA(ahb_master_driver_0_HWDATA),
        .HWRITE(ahb_master_driver_0_HWRITE),
        .PADDR(ahb_apb_bridge_0_PADDR),
        .PENABLE(ahb_apb_bridge_0_PENABLE),
        .PRDATA(apb_slave_regs_0_PRDATA),
        .PREADY(apb_slave_regs_0_PREADY),
        .PSEL(ahb_apb_bridge_0_PSEL),
        .PSLVERR(apb_slave_regs_0_PSLVERR),
        .PWDATA(ahb_apb_bridge_0_PWDATA),
        .PWRITE(ahb_apb_bridge_0_PWRITE));
  design_1_ahb_master_driver_0_0 ahb_master_driver_0
       (.HADDR(ahb_master_driver_0_HADDR),
        .HBURST(ahb_master_driver_0_HBURST),
        .HCLK(HCLK),
        .HRDATA(ahb_apb_bridge_0_HRDATA),
        .HREADY(ahb_apb_bridge_0_HREADY),
        .HRESETn(HRESETn),
        .HRESP(ahb_apb_bridge_0_HRESP),
        .HSEL(ahb_master_driver_0_HSEL),
        .HSIZE(ahb_master_driver_0_HSIZE),
        .HTRANS(ahb_master_driver_0_HTRANS),
        .HWDATA(ahb_master_driver_0_HWDATA),
        .HWRITE(ahb_master_driver_0_HWRITE),
        .State_LED(State_LED));
  design_1_apb_slave_regs_0_0 apb_slave_regs_0
       (.LED_OUT(LED_OUT),
        .PADDR(ahb_apb_bridge_0_PADDR),
        .PCLK(HCLK),
        .PENABLE(ahb_apb_bridge_0_PENABLE),
        .PRDATA(apb_slave_regs_0_PRDATA),
        .PREADY(apb_slave_regs_0_PREADY),
        .PRESETn(HRESETn),
        .PSEL(xlslice_0_Dout),
        .PSLVERR(apb_slave_regs_0_PSLVERR),
        .PWDATA(ahb_apb_bridge_0_PWDATA),
        .PWRITE(ahb_apb_bridge_0_PWRITE));
  design_1_xlslice_0_0 xlslice_0
       (.Din(ahb_apb_bridge_0_PSEL),
        .Dout(xlslice_0_Dout));
endmodule
