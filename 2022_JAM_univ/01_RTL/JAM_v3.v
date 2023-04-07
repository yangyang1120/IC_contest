module JAM (
input CLK,
input RST,
output reg [2:0] W,
output reg [2:0] J,
input [6:0] Cost,
output reg [3:0] MatchCount,
output reg [9:0] MinCost,
output Valid );

reg [2:0] c_state, n_state;
reg [2:0] sequence [0:7];
reg [2:0] cnt_cost;
reg [9:0] sum_cost;
wire [2:0] left_idx;
reg [2:0] right_idx,min_value,min_index,idx_temp,find_idx;
reg find_flag;

parameter IDLE = 0, FIND_PNT = 1, MIN_PNT = 2, CHANGE = 3, SORT = 4, CAL_COST = 5,RESULT = 6, FIN = 7;

//========================
// FSM(c_state & n_state)               
//========================
always@(posedge CLK or posedge RST) begin
    if (RST) c_state <= IDLE;
    else c_state <= n_state;
end

always@(*) begin
    case(c_state)
    IDLE: n_state = CAL_COST;
    FIND_PNT:begin
        if (sequence[0] == 3'd7 && sequence[1] == 3'd6 && sequence[2] == 3'd5 && sequence[3] == 3'd4 && sequence[4] == 3'd3 && sequence[5] == 3'd2 && sequence[6] == 3'd1 && sequence[7] == 3'd0) n_state = FIN;
        else if (find_flag == 1'b1)  n_state = MIN_PNT;
        else n_state = c_state;
    end
    MIN_PNT: n_state = (idx_temp == 3'd7) ? CHANGE : c_state;
    CHANGE: n_state = SORT;
    SORT: n_state = CAL_COST;
    CAL_COST:begin
        if (sum_cost > MinCost) n_state = FIND_PNT;
        else if (W == 3'd7) n_state = RESULT;
        else n_state = c_state;
    end
    RESULT: n_state = (sequence[0] == 3'd7 && sequence[1] == 3'd6 && sequence[2] == 3'd5 && sequence[3] == 3'd4 && sequence[4] == 3'd3 && sequence[5] == 3'd2 && sequence[6] == 3'd1 && sequence[7] == 3'd0) ? FIN : FIND_PNT;
    FIN: n_state = c_state;
    endcase
end

//========================
//       sequence               
//========================
always@(posedge CLK or posedge RST) begin
    if (RST) begin
        sequence[0] <= 3'd0;
        sequence[1] <= 3'd1;
        sequence[2] <= 3'd2;
        sequence[3] <= 3'd3;
        sequence[4] <= 3'd4;
        sequence[5] <= 3'd5;
        sequence[6] <= 3'd6;
        sequence[7] <= 3'd7;
    end
    else if (c_state == CHANGE) begin
        sequence[find_idx] <= sequence[min_index];
        sequence[min_index] <= sequence[find_idx];
    end
    else if (c_state == SORT) begin
        case(find_idx)
        3'd0: begin
            sequence[1] <= sequence[7] ;
            sequence[2] <= sequence[6] ;
            sequence[3] <= sequence[5] ;
            sequence[4] <= sequence[4] ;
            sequence[5] <= sequence[3] ;
            sequence[6] <= sequence[2] ;
            sequence[7] <= sequence[1] ;
        end
        3'd1: begin
            sequence[2] <= sequence[7] ;
            sequence[3] <= sequence[6] ;
            sequence[4] <= sequence[5] ;
            sequence[5] <= sequence[4] ;
            sequence[6] <= sequence[3] ;
            sequence[7] <= sequence[2] ;
        end
        3'd2: begin
            sequence[3] <= sequence[7] ;
            sequence[4] <= sequence[6] ;
            sequence[5] <= sequence[5] ;
            sequence[6] <= sequence[4] ;
            sequence[7] <= sequence[3] ;
        end
        3'd3: begin
            sequence[4] <= sequence[7] ;
            sequence[5] <= sequence[6] ;
            sequence[6] <= sequence[5] ;
            sequence[7] <= sequence[4] ; 
        end
        3'd4: begin
            sequence[5] <= sequence[7] ;
            sequence[6] <= sequence[6] ;
            sequence[7] <= sequence[5] ; 
        end
        3'd5: begin
            sequence[6] <= sequence[7] ;
            sequence[7] <= sequence[6] ;
        end
        endcase
    end
end


//========================
//       CAL_COST               
//========================
// W & J
always@(posedge CLK or posedge RST) begin
    if (RST) begin
        W <= 3'd0;
        J <= 3'd0;
    end
    else if ((c_state == CAL_COST || n_state == CAL_COST) && sum_cost <= MinCost) begin
        W <= cnt_cost;
        J <= sequence[cnt_cost];
    end    
    else begin
        W <= 3'd0;
        J <= 3'd0;
    end
end

// cnt_cost
always@(posedge CLK or posedge RST) begin
    if (RST) cnt_cost <= 3'd0;
    else if (c_state == CAL_COST || n_state == CAL_COST) cnt_cost <= (sum_cost > MinCost) ? 3'd0 : cnt_cost + 3'd1;
    else if (c_state == RESULT) cnt_cost <= 3'd0;
    else cnt_cost <= cnt_cost;
end

// sum_cost
always@(posedge CLK or posedge RST) begin
    if (RST) sum_cost <= 10'd0;
    else if (c_state == CAL_COST) sum_cost <= (sum_cost > MinCost) ? 10'd0 : sum_cost + Cost;
    else if (c_state == RESULT) sum_cost <= 10'd0;
end

// MinCost & MatchCount
always@(posedge CLK or posedge RST) begin
    if (RST) begin 
        MinCost <= 10'd1023;
        MatchCount <= 4'd0;
    end
    else if (c_state == RESULT) begin
        if(sum_cost < MinCost) begin
            MinCost <= sum_cost;
            MatchCount <= 4'd1;
        end
        else if (sum_cost == MinCost) begin
            MinCost <= MinCost;
            MatchCount <= MatchCount + 4'd1;
        end
        else begin
            MinCost <= MinCost;
            MatchCount <= MatchCount;
        end
    end
end

//========================
//       FINISH               
//========================
// Valid
assign Valid = (c_state == FIN) ? 1'b1 : 1'b0;

//========================
//       FIND_PNT               
//========================

//find_flag
always@(posedge CLK or posedge RST) begin
    if (RST) find_flag <= 1'b0;
    else if (c_state == FIND_PNT && find_flag == 1'b0) find_flag <= (sequence[right_idx] > sequence[left_idx]) ? 1'b1 : find_flag;
    else if (c_state == CAL_COST) find_flag <= 1'b0;
end

// find_idx
always@(posedge CLK or posedge RST) begin
    if (RST) find_idx <= 3'd0;
    else if (c_state == FIND_PNT && find_flag == 1'b0) find_idx <= (sequence[right_idx] > sequence[left_idx]) ? left_idx : find_idx;
    else if (c_state == CAL_COST) find_idx <= 3'd0;
end

// right_idx 
always@(posedge CLK or posedge RST) begin
    if (RST) right_idx <= 3'd7;
    else if (c_state == FIND_PNT && find_idx == 3'd0) right_idx <= right_idx - 3'd1;
    else right_idx <= 3'd7;
end

// left_idx
assign left_idx = right_idx - 3'd1;


//========================
// Find min index & value               
//========================
//idx_temp
always@(posedge CLK or posedge RST) begin
    if (RST) idx_temp <= 3'd0;
    else if (c_state == MIN_PNT && idx_temp < 3'd7) idx_temp <= idx_temp + 3'd1;
    else if (c_state == FIND_PNT) idx_temp <= find_idx + 3'd1;
end

//min_value && min_index
always@(posedge CLK or posedge RST) begin
    if (RST) begin
            min_value <= 3'd7;
            min_index <= 3'd0;
    end
    else if (c_state == MIN_PNT) begin
        if ((sequence[find_idx] < sequence[idx_temp]) && (sequence[idx_temp] <= min_value)) begin
            min_value <= sequence[idx_temp];
            min_index <= idx_temp;
        end
    end
    else if(c_state == CAL_COST) min_value <= 3'd7;
end
endmodule


