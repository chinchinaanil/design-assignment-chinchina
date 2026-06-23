`include "dma_axi_simple_defines.v"
`include "dma_axi_simple_core_read.v"
`include "dma_axi_simple_core_write.v"
`include "dma_axi_simple_fifo_sync_small.v"
`timescale 1ns/1ns

module dma_axi_simple_core
     #(parameter AXI_MST_ID   =1
               , AXI_WIDTH_CID=4
               , AXI_WIDTH_ID =4
               , AXI_WIDTH_AD =32
               , AXI_WIDTH_DA =32
               , AXI_WIDTH_DS =(AXI_WIDTH_DA/8)
               , AXI_WIDTH_DSB=clogb2(AXI_WIDTH_DS)
               , AXI_WIDTH_SID=AXI_WIDTH_CID+AXI_WIDTH_ID
               , SG_ENABLE    =1
               , SG_MAX_TRANSFER_BYTES=32'h7FFF_FFFF
               , AXI_TIMEOUT  =1024
               )
(
       input  wire                     ARESETn
     , input  wire                     ACLK
     //-----------------------------------------------------------
     `undef Otype `define Otype wire
     `undef Itype `define Itype wire
     `AMBA_AXI_MASTER_PORT
     //-----------------------------------------------------------
     , input   wire            DMA_EN
     , input   wire            DMA_GO
     , output  wire            DMA_BUSY
     , output  wire            DMA_DONE
     , output  wire            DMA_ERROR
     , output  wire  [ 7:0]    DMA_ERROR_CODE
     , input   wire  [31:0]    DMA_SRC
     , input   wire  [31:0]    DMA_DST
     , input   wire  [31:0]    DMA_BNUM
     , input   wire  [ 7:0]    DMA_CHUNK
     //-----------------------------------------------------------
     , input   wire            SG_MODE
     , input   wire  [31:0]    SG_DESC_ADDR
     , output  wire            SG_BUSY
     , output  wire            SG_DONE
     , output  wire            SG_ERROR
     , output  wire  [ 7:0]    SG_STATE
     , output  wire  [ 7:0]    SG_ERROR_CODE
     , output  wire  [31:0]    SG_CURDESC
     , output  wire  [31:0]    SG_NEXTDESC
     , output  wire  [31:0]    SG_CUR_SRC
     , output  wire  [31:0]    SG_CUR_DST
     , output  wire  [31:0]    SG_CUR_LEN
     , output  wire  [31:0]    SG_CUR_CTRL
     , output  wire  [31:0]    SG_CUR_STATUS
     , output  wire  [31:0]    SG_BYTES_DONE
     , output  wire  [31:0]    SG_DESC_DONE
);
   //-----------------------------------------------------
   assign M_MID = AXI_MST_ID[AXI_WIDTH_CID-1:0];
   //-----------------------------------------------------
   wire sg_capable = (SG_ENABLE!=0);
   //-----------------------------------------------------
   localparam FIFO_DW = AXI_WIDTH_DS + AXI_WIDTH_DA;
   localparam FIFO_AW = 5;
   //-----------------------------------------------------
   wire data_busy_r;
   wire data_done_r;
   wire data_error_r;
   wire [7:0] data_error_code_r;
          sg_M_ARPROT  <= 3'h2;
`endif
`ifdef AMBA_AXI4
          sg_M_ARQOS   <= 4'h0;
          sg_M_ARREGION<= 4'h0;
`endif
          sg_M_ARVALID <= 1'b1;
          sg_timeout_cnt <= 32'h0;
          sg_state_reg <= `DMA_SG_STATE_FETCH_AR;
      end
      end
   `DMA_SG_STATE_DONE: begin
      sg_busy_reg <= 1'b0;
      sg_done_reg <= 1'b1;
      sg_data_go  <= 1'b0;
      if (DMA_GO==1'b0) begin
          sg_owned <= 1'b0;
          sg_done_reg <= 1'b0;
          sg_state_reg <= `DMA_SG_STATE_IDLE;
      end
      end
   `DMA_SG_STATE_ERROR: begin
      sg_busy_reg <= 1'b0;
      sg_done_reg <= 1'b1;
      sg_error_reg <= 1'b1;
      sg_data_go <= 1'b0;
      sg_M_ARVALID <= 1'b0;
      sg_M_RREADY  <= 1'b0;
      sg_M_AWVALID <= 1'b0;
      sg_M_WVALID  <= 1'b0;
      sg_M_BREADY  <= 1'b0;
      if (DMA_GO==1'b0) begin
          sg_owned <= 1'b0;
          sg_done_reg <= 1'b0;
          sg_error_reg <= 1'b0;
          sg_state_reg <= `DMA_SG_STATE_IDLE;
      end
      end
   default: begin
      sg_state_reg <= `DMA_SG_STATE_IDLE;
      sg_busy_reg <= 1'b0;
      sg_data_go <= 1'b0;
   end
   endcase
   end
   end
   //-----------------------------------------------------------
   function [31:0] get_bus_word;
      input [AXI_WIDTH_DA-1:0] data;
      input [31:0]             addr;
      integer                   shift_bits;
   begin
      shift_bits = (((addr & (AXI_WIDTH_DS-1)) >> 2) << 5);
      get_bus_word = data >> shift_bits;
   end
   endfunction
   //-----------------------------------------------------------
   function [AXI_WIDTH_DA-1:0] put_bus_word;
      input [31:0] word;
      input [31:0] addr;
      integer      shift_bits;
      reg [AXI_WIDTH_DA-1:0] word_ext;
   begin
      shift_bits = (((addr & (AXI_WIDTH_DS-1)) >> 2) << 5);
      word_ext = word;
      put_bus_word = word_ext << shift_bits;
   end
   endfunction
   //-----------------------------------------------------------
   function [AXI_WIDTH_DS-1:0] get_word_strb;
      input [31:0] addr;
      integer      shift_bytes;
   begin
      shift_bytes = (((addr & (AXI_WIDTH_DS-1)) >> 2) << 2);
      get_word_strb = ({AXI_WIDTH_DS{1'b0}} | 4'hF) << shift_bytes;
   end
   endfunction
   //-----------------------------------------------------------
   function [31:0] make_status;
      input        error;
      input [7:0]  code;
      input [31:0] length;
   begin
      make_status = {1'b1,error,1'b0,5'h0,code,length[15:0]};
   end
   endfunction
   //-----------------------------------------------------------
   function integer clogb2;
   input [31:0] value;
   reg   [31:0] tmp;
   begin
      tmp = value - 1;
      for (clogb2 = 0; tmp > 0; clogb2 = clogb2 + 1) tmp = tmp >> 1;
   end
   endfunction
   //-----------------------------------------------------------
   // synthesis translate_off
   always @ (posedge ACLK) begin
       if (DMA_EN&DMA_GO&(~sg_path_selected)) begin
           if (DMA_SRC[AXI_WIDTH_DSB-1:0]!==DMA_DST[AXI_WIDTH_DSB-1:0]) begin
               $display($time,,"%m src dst not aligned: 0x%X 0x%X",
                        DMA_SRC[AXI_WIDTH_DSB-1:0],DMA_DST[AXI_WIDTH_DSB-1:0]);
           end
       end
   end
   // synthesis translate_on
   //-----------------------------------------------------------
endmodule
//----------------------------------------------------------
// Revision history
//
// 2015.07.12: Started by Ando Ki.
// 2026.06.20: Added scatter-gather descriptor supervisor.
//----------------------------------------------------------
