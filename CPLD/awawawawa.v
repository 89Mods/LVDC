`default_nettype none

module awawawawa(
    input IORb,
    input IOWb,
    input RPULSE,
    input RD0,
    input RD1,
    output RPULSE_OUT,
    output reg RD0_OUT = 0,
    output reg RD1_OUT = 0,
    input RCHECK,
    output BDIR,
    inout [15:0] bus,
    input KEY_CLEARb,
    output GPIO_LOAD,
    output GPIO_READb,
    input INT_INHIBIT,
    input [3:0] I,
    output [2:0] SSEL_R1,
    output reg [7:0] R1_SEGS = 0,
    output reg [7:0] R2_SEGS = 0,
    
    output reg SDO = 0,
    input SDI,
    output SCK_FLASH,
    output SCK_LED1,
    output SCK_LED2,
    
    output reg SID_CEb = 1,
    output INTERRUPT,
    output LED,
    
    input clk
);
assign RPULSE_OUT = !RPULSE;

wire radio_read = !IORb && I == 4'b1000;
wire status_read = !IORb && I == 4'b1110;
assign BDIR = (!IORb && I == 4'b1010) || status_read || radio_read;
assign bus = BDIR ? (status_read ? {13'hxx, radio_int_source, key_int_state, timer_int_state} : (radio_read ? radio_word : spi_inbuff)) : 16'hzzzz;

reg iow_edge = 1;
wire iow_trigger = iow_edge && !IOWb;

reg GPIO_LOAD_edge = 0;
wire GPIO_LOAD_condition = !IOWb && I == 4'b0101;
assign GPIO_LOAD = !GPIO_LOAD_edge && GPIO_LOAD_condition;

assign GPIO_READb = !(!IORb && I == 4'b0101);

reg SCK = 0;
reg [7:0] spi_outbuff = 0;
reg [15:0] spi_inbuff = 0;
reg [4:0] spi_step = 0;
wire spi_active = spi_step != 0;
reg [2:0] which_spi = 0;
assign SCK_FLASH = SCK & which_spi[0];
assign SCK_LED1 = SCK & which_spi[1];
assign SCK_LED2 = SCK & which_spi[2];

reg [15:0] radio_word = 0;
reg last_rpulse = 0;
reg transmission_valid = 1;
wire next_transmission_valid = transmission_valid & (RCHECK == RD1 ^ RD0);
reg [3:0] radio_step = 0;
reg radio_int_source = 0;

reg [25:0] R1 = 0;
reg [25:0] R2 = 0;
reg [7:0] MM = 0;
reg [6:0] R1_DP_states = 0;
reg [6:0] R2_DP_states = 0;

reg [3:0] disp_step = 0;
assign SSEL_R1 = disp_step[3:1];
reg [3:0] curr_nibble_r1;
reg [3:0] curr_nibble_r2;
reg curr_dp_r1;
reg curr_dp_r2;
always @(*) begin
    case(disp_step[3:1])
        0: begin
            curr_nibble_r1 = R1[3:0];
            curr_nibble_r2 = R2[3:0];
            curr_dp_r1 = R1_DP_states[0];
            curr_dp_r2 = R2_DP_states[0];
        end
        1: begin
            curr_nibble_r1 = R1[7:4];
            curr_nibble_r2 = R2[7:4];
            curr_dp_r1 = R1_DP_states[1];
            curr_dp_r2 = R2_DP_states[1];
        end
        2: begin
            curr_nibble_r1 = R1[11:8];
            curr_nibble_r2 = R2[11:8];
            curr_dp_r1 = R1_DP_states[2];
            curr_dp_r2 = R2_DP_states[2];
        end
        3: begin
            curr_nibble_r1 = R1[15:12];
            curr_nibble_r2 = R2[15:12];
            curr_dp_r1 = R1_DP_states[3];
            curr_dp_r2 = R2_DP_states[3];
        end
        4: begin
            curr_nibble_r1 = R1[19:16];
            curr_nibble_r2 = R2[19:16];
            curr_dp_r1 = R1_DP_states[4];
            curr_dp_r2 = R2_DP_states[4];
        end
        5: begin
            curr_nibble_r1 = R1[23:20];
            curr_nibble_r2 = R2[23:20];
            curr_dp_r1 = R1_DP_states[5];
            curr_dp_r2 = R2_DP_states[5];
        end
        6: begin
            curr_nibble_r1 = {2'b00, R1[25:24]};
            curr_nibble_r2 = {2'b00, R1[25:24]};
            curr_dp_r1 = R1_DP_states[6];
            curr_dp_r2 = R2_DP_states[6];
        end
        7: begin
            curr_nibble_r1 = MM[3:0];
            curr_nibble_r2 = MM[7:4];
            curr_dp_r1 = 1'b0;
            curr_dp_r2 = 1'b0;
        end
    endcase
end

always @(*) begin
    case(curr_nibble_r1)
        0: R1_SEGS = {curr_dp_r1, 7'b0111111};
        1: R1_SEGS = {curr_dp_r1, 7'b0000110};
        2: R1_SEGS = {curr_dp_r1, 7'b1011011};
        3: R1_SEGS = {curr_dp_r1, 7'b1001111};
        4: R1_SEGS = {curr_dp_r1, 7'b1100110};
        5: R1_SEGS = {curr_dp_r1, 7'b1101101};
        6: R1_SEGS = {curr_dp_r1, 7'b1111101};
        7: R1_SEGS = {curr_dp_r1, 7'b0000111};
        8: R1_SEGS = {curr_dp_r1, 7'b1111111};
        9: R1_SEGS = {curr_dp_r1, 7'b1101111};
        10: R1_SEGS = {curr_dp_r1, 7'b1110111};
        11: R1_SEGS = {curr_dp_r1, 7'b1111100};
        12: R1_SEGS = {curr_dp_r1, 7'b0111001};
        13: R1_SEGS = {curr_dp_r1, 7'b1011110};
        14: R1_SEGS = {curr_dp_r1, 7'b1111001};
        15: R1_SEGS = {curr_dp_r1, 7'b1110001};
    endcase
end

always @(*) begin
    case(curr_nibble_r2)
        0: R2_SEGS = {curr_dp_r2, 7'b0111111};
        1: R2_SEGS = {curr_dp_r2, 7'b0000110};
        2: R2_SEGS = {curr_dp_r2, 7'b1011011};
        3: R2_SEGS = {curr_dp_r2, 7'b1001111};
        4: R2_SEGS = {curr_dp_r2, 7'b1100110};
        5: R2_SEGS = {curr_dp_r2, 7'b1101101};
        6: R2_SEGS = {curr_dp_r2, 7'b1111101};
        7: R2_SEGS = {curr_dp_r2, 7'b0000111};
        8: R2_SEGS = {curr_dp_r2, 7'b1111111};
        9: R2_SEGS = {curr_dp_r2, 7'b1101111};
        10: R2_SEGS = {curr_dp_r2, 7'b1110111};
        11: R2_SEGS = {curr_dp_r2, 7'b1111100};
        12: R2_SEGS = {curr_dp_r2, 7'b0111001};
        13: R2_SEGS = {curr_dp_r2, 7'b1011110};
        14: R2_SEGS = {curr_dp_r2, 7'b1111001};
        15: R2_SEGS = {curr_dp_r2, 7'b1110001};
    endcase
end

reg timer_int_state = 0;
reg key_int_state = 0;
reg last_key_state = 1;
assign INTERRUPT = key_int_state || timer_int_state || radio_int_source;

reg timer_active = 0;
reg [16:0] timer = 0;
assign LED = timer[16];

always @(posedge clk) begin
	 iow_edge <= IOWb;
    SID_CEb <= !(!IOWb && I == 4'hF);
    GPIO_LOAD_edge <= GPIO_LOAD_condition;
    disp_step <= disp_step + 1;
    last_key_state <= KEY_CLEARb;
    last_rpulse <= RPULSE;
    if(timer_active) begin
        timer <= timer + 1;
        if(timer == 17'h1FFFF) timer_int_state <= 1;
    end
    if(iow_trigger && I[1]) begin
        case({I[3], I[2], I[0]})
            0: R1[15:0] <= bus;
            1: R1[25:16] <= bus[9:0];
            2: R2[15:0] <= bus;
            3: R2[25:16] <= bus[9:0];
            4: begin
                if(spi_step == 0) begin
                    spi_step <= 1;
                    spi_outbuff <= bus[7:0];
                    which_spi <= bus[10:8];
                end
            end
            5: radio_word <= bus;
            6: begin
                if(bus[0]) key_int_state <= 0;
                if(bus[1]) timer_int_state <= 0;
                if(bus[2]) radio_int_source <= 0;
                if(bus[3]) timer_active <= bus[4];
                if(bus[7]) MM <= bus[15:8];
            end
        endcase
    end
    
    if(!KEY_CLEARb && last_key_state && !INT_INHIBIT) begin
        key_int_state <= 1;
    end
    
    if(spi_active) begin
        spi_step <= spi_step == 5'b10001 ? 5'h00 : spi_step + 1;
        if(spi_step[0]) begin
            SCK <= 1'b0;
            SDO <= spi_outbuff[7];
            spi_outbuff <= {spi_outbuff[6:0], 1'b0};
        end else begin
            SCK <= 1'b1;
            spi_inbuff <= {spi_inbuff[14:0], SDI};
        end
    end
    
    if(RPULSE == 1 && RD1 == 1 && RD0 == 1 && RCHECK == 1) begin
        radio_step <= 0;
        transmission_valid <= 1;
    end
    
    if(radio_step != 7 && RPULSE && !last_rpulse) begin
        radio_step <= radio_step + 1;
        radio_word <= {radio_word[13:0], RD1, RD0};
        RD1_OUT <= radio_word[15];
        RD0_OUT <= radio_word[14];
        transmission_valid <= next_transmission_valid;
        if(radio_step == 6) radio_int_source <= next_transmission_valid;
    end
end

endmodule
