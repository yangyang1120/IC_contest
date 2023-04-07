module JAM (
input CLK,
input RST,
output [2:0] W,
output [2:0] J,
input [6:0] Cost,
output reg [3:0] MatchCount,
output reg [9:0] MinCost,
output Valid );

reg [1:0] n_state;
reg [1:0] c_state;

reg [2:0] idx;
reg [2:0] sort_list[0:7];//qiyou -- 要排序的陣列
reg [2:0] cost_list[0:7];//qiyou -- 計算成本的陣列
reg [2:0] fp_index;      //qiyou -- 替換點的 index
reg [2:0] fpr_min;
reg [2:0] fpr_index;     //qiyou -- 替換點右邊比替換點大的最小值的 index 
reg [9:0] cost_sum; // cost sum
reg [2:0] cnt_idx;
wire fin_flag;

parameter STATE_IDLE = 0,
          STATE_IN = 1, 
          STATE_OUT = 2,
          STATE_FIN = 3
;
// W & J
assign W = cnt_idx;
assign J = cost_list[cnt_idx];
assign fin_flag = (sort_list[0] == 3'd7 && 
                   sort_list[1] == 3'd6 && 
                   sort_list[2] == 3'd5 &&
                   sort_list[3] == 3'd4 && 
                   sort_list[4] == 3'd3 &&
                   sort_list[5] == 3'd2 && 
                   sort_list[6] == 3'd1 &&
                   sort_list[7] == 3'd0 &&
                   c_state == STATE_OUT
                   );
assign Valid = (c_state == STATE_FIN);
//==============================
//     c_state
//==============================
always@(posedge CLK or posedge RST) begin
    if (RST) c_state <= STATE_IDLE;
    else c_state <= n_state;
end

//==============================
//     n_state
//==============================
always@(*) begin
    case(c_state)
        STATE_IDLE : n_state = STATE_IN;
        STATE_IN   : n_state = (cnt_idx == 3'd7) ? STATE_OUT : c_state;
        STATE_OUT  : n_state = (fin_flag) ? STATE_FIN : STATE_IN;
        STATE_FIN  : n_state = c_state;
    endcase
end

//==============================
//     cnt_idx
//==============================
always@(posedge CLK or posedge RST) begin
    if (RST) cnt_idx <= 3'd0;
    else if (c_state == STATE_IN) cnt_idx <= cnt_idx + 3'd1;
    else if (cnt_idx == 3'd7) cnt_idx <= 3'd0;
end
//==============================
//     cost_list
//==============================
always @(posedge CLK or posedge RST) begin
    if(RST)begin
        cost_list[0] <= 3'd0;
        cost_list[1] <= 3'd1;
        cost_list[2] <= 3'd2;
        cost_list[3] <= 3'd3;
        cost_list[4] <= 3'd4;
        cost_list[5] <= 3'd5;
        cost_list[6] <= 3'd6;
        cost_list[7] <= 3'd7;
    end
    else if (c_state == STATE_OUT)begin
        cost_list[0] <= sort_list[0];
        cost_list[1] <= sort_list[1];
        cost_list[2] <= sort_list[2];
        cost_list[3] <= sort_list[3];
        cost_list[4] <= sort_list[4];
        cost_list[5] <= sort_list[5];
        cost_list[6] <= sort_list[6];
        cost_list[7] <= sort_list[7];
    end
end
//==============================
//     sort_list
//==============================
always @(posedge CLK or posedge RST) begin
    if(RST)begin
        sort_list[0] <= 3'd0;
        sort_list[1] <= 3'd1;
        sort_list[2] <= 3'd2;
        sort_list[3] <= 3'd3;
        sort_list[4] <= 3'd4;
        sort_list[5] <= 3'd5;
        sort_list[6] <= 3'd6;
        sort_list[7] <= 3'd7;
    end
    else if(c_state == STATE_IN && cnt_idx == 3'd2)begin
        sort_list[fp_index] <= sort_list[fpr_index];
        sort_list[fpr_index] <= sort_list[fp_index];
    end
    else if(c_state == STATE_IN && cnt_idx == 3'd3)begin
        if(fp_index == 3'd5)begin
            sort_list[7] <= sort_list[6];
            sort_list[6] <= sort_list[7];
        end
        else if (fp_index == 3'd4) begin
            sort_list[7] <= sort_list[5];
            sort_list[5] <= sort_list[7];
        end
        else if (fp_index == 3'd3) begin
            sort_list[7] <= sort_list[4];
            sort_list[6] <= sort_list[5];
            sort_list[5] <= sort_list[6];
            sort_list[4] <= sort_list[7];
        end
        else if (fp_index == 3'd2) begin
            sort_list[7] <= sort_list[3];
            sort_list[6] <= sort_list[4];
            sort_list[4] <= sort_list[6];
            sort_list[3] <= sort_list[7];
        end
        else if (fp_index == 3'd1) begin
            sort_list[7] <= sort_list[2];
            sort_list[6] <= sort_list[3];
            sort_list[5] <= sort_list[4];
            sort_list[4] <= sort_list[5];
            sort_list[3] <= sort_list[6];
            sort_list[2] <= sort_list[7];
        end
        else if (fp_index == 3'd0) begin
            sort_list[7] <= sort_list[1];
            sort_list[6] <= sort_list[2];
            sort_list[5] <= sort_list[3];
            sort_list[3] <= sort_list[5];
            sort_list[2] <= sort_list[6];
            sort_list[1] <= sort_list[7];
        end
    end
end
//==============================
//     fp_index
//==============================
always @(*) begin
    if(c_state == STATE_IN && cnt_idx == 3'd0) begin
        if(sort_list[7] > sort_list[6]) fp_index = 3'd6;
        else if(sort_list[6] > sort_list[5]) fp_index = 3'd5;
        else if(sort_list[5] > sort_list[4]) fp_index = 3'd4;
        else if(sort_list[4] > sort_list[3]) fp_index = 3'd3;
        else if(sort_list[3] > sort_list[2]) fp_index = 3'd2;
        else if(sort_list[2] > sort_list[1]) fp_index = 3'd1;
        else fp_index = 3'd0;
    end
end
//==============================
//     fpr_index & fpr_min
//==============================
always @(*) begin
    if(c_state == STATE_IN && cnt_idx == 3'd1)begin
        fpr_min = 3'd7;
        if(7 > fp_index && sort_list[7] > sort_list[fp_index] && sort_list[7] <= fpr_min) begin
            fpr_index = 3'd7;
            fpr_min   = sort_list[7];
        end
        if(6 > fp_index && sort_list[6] > sort_list[fp_index] && sort_list[6] <= fpr_min)begin
            fpr_index = 3'd6;
            fpr_min   = sort_list[6];
        end
        if(5 > fp_index && sort_list[5] > sort_list[fp_index] && sort_list[5] <= fpr_min)begin
            fpr_index = 3'd5;
            fpr_min   = sort_list[5];
        end
        if(4 > fp_index && sort_list[4] > sort_list[fp_index] && sort_list[4] <= fpr_min)begin
            fpr_index = 3'd4;
            fpr_min   = sort_list[4];
        end
        if(3 > fp_index && sort_list[3] > sort_list[fp_index] && sort_list[3] <= fpr_min)begin
            fpr_index = 3'd3;
            fpr_min   = sort_list[3];
        end
        if(2 > fp_index && sort_list[2] > sort_list[fp_index] && sort_list[2] <= fpr_min)begin
            fpr_index = 3'd2;
            fpr_min   = sort_list[2];
        end
        if(1 > fp_index && sort_list[1] > sort_list[fp_index] && sort_list[1] <= fpr_min)begin
            fpr_index = 3'd1;
            fpr_min   = sort_list[1];
        end
    end
end
//==============================
//     cost_sum
//==============================
always@(posedge CLK or posedge RST) begin
    if (RST) cost_sum <= 10'd0;
    else if (c_state == STATE_IN) cost_sum <= cost_sum + Cost;
    else if (c_state == STATE_OUT) cost_sum <= 10'd0;
end
//==============================
//     MinCost & MatchCount
//==============================
always@(posedge CLK or posedge RST) begin
    if (RST) begin
        MatchCount <= 4'd0;
        MinCost <= 10'd1023;
    end
    else if (c_state == STATE_OUT) begin
        if (cost_sum < MinCost) begin
            MinCost <= cost_sum;
            MatchCount <= 4'd1;
        end
        else if (cost_sum == MinCost) begin
            MinCost <= MinCost;
            MatchCount <= MatchCount + 4'd1;
        end
    end 
end

endmodule