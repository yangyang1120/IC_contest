/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Mon Feb 27 14:43:45 2023
/////////////////////////////////////////////////////////////


module JAM_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [9:1] carry;

  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XNOR2X1 U2 ( .A(A[9]), .B(n3), .Y(SUM[9]) );
  XOR2XL U3 ( .A(A[8]), .B(n2), .Y(SUM[8]) );
  XOR2XL U4 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
  XOR2XL U5 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  NAND2X1 U6 ( .A(A[8]), .B(n2), .Y(n3) );
  AND2X2 U7 ( .A(A[7]), .B(carry[7]), .Y(n2) );
endmodule


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N102,
         N103, N104, N105, N106, n740, n741, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755,
         \sequence[0][2] , \sequence[0][1] , \sequence[0][0] ,
         \sequence[1][2] , \sequence[1][1] , \sequence[1][0] ,
         \sequence[2][2] , \sequence[2][1] , \sequence[2][0] ,
         \sequence[3][2] , \sequence[3][1] , \sequence[3][0] ,
         \sequence[4][2] , \sequence[4][1] , \sequence[4][0] ,
         \sequence[5][2] , \sequence[5][1] , \sequence[5][0] ,
         \sequence[6][2] , \sequence[6][1] , \sequence[6][0] ,
         \sequence[7][2] , \sequence[7][1] , \sequence[7][0] , N152, N153,
         N154, N253, N254, N255, N256, N257, N258, N259, N260, N261, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N321, N329, N330,
         N331, N339, N340, N341, N342, N343, N344, N345, N346, N347, N348,
         N371, N407, N408, N409, N410, N412, N429, N430, N431, N446, N447,
         N448, N451, N452, N453, n39, n49, n50, n51, n54, n56, n58, n59, n61,
         n62, n66, n68, n69, n71, n72, n74, n76, n81, n83, n84, n86, n87, n89,
         n93, n97, n98, n103, n105, n106, n107, n108, n110, n112, n113, n116,
         n117, n120, n121, n122, n123, n125, n127, n128, n129, n131, n132,
         n133, n136, n137, n138, n139, n140, n143, n145, n146, n147, n148,
         n149, n153, n154, n157, n158, n159, n160, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n192, n193, n194, n195, n196, n197, n198, n200, n201, n202,
         n203, n205, n206, n207, n208, n212, n213, n214, n215, n217, n220,
         n222, n223, n225, n226, n228, n229, n230, n235, n238, n239, n240,
         n241, n243, n244, n245, n246, n247, n248, n249, n250, n253, n255,
         n256, n257, n258, n260, n261, n262, n263, n264, n265, n266, n267,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n325, n326, n328, n329,
         n330, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, \r441/GT , n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n448,
         n451, n453, n455, n459, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532,
         n533, n534, n535, n536, n537, n538, n539, n540, n541, n542, n543,
         n544, n545, n546, n547, n548, n549, n550, n551, n552, n553, n554,
         n555, n556, n557, n558, n559, n560, n561, n562, n563, n564, n565,
         n566, n567, n568, n569, n570, n571, n572, n573, n574, n575, n576,
         n577, n578, n579, n580, n581, n582, n583, n584, n585, n586, n587,
         n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598,
         n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609,
         n610, n611, n612, n613, n614, n615, n616, n617, n618, n619, n620,
         n621, n622, n623, n624, n625, n626, n627, n628, n629, n630, n631,
         n632, n633, n634, n635, n636, n637, n638, n639, n640, n641, n642,
         n643, n644, n645, n646, n647, n648, n649, n650, n651, n652, n653,
         n654, n655, n656, n657, n658, n659, n660, n661, n662, n663, n664,
         n665, n666, n667, n668, n669, n670, n671, n672, n673, n674, n675,
         n676, n677, n678, n679, n680, n681, n682, n683, n684, n685, n686,
         n687, n688, n689, n690, n691, n692, n693, n694, n695, n696, n697,
         n698, n699, n700, n701, n702, n703, n704, n705, n706, n707, n708,
         n709, n710, n711, n712, n713, n714, n715, n716, n717, n718, n719,
         n720, n721, n722, n723, n724, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, n739;
  wire   [2:0] n_state;
  wire   [9:0] sum_cost;

  JAM_DW01_add_0 add_144_S2 ( .A(sum_cost), .B({1'b0, 1'b0, 1'b0, Cost}), .CI(
        1'b0), .SUM({N348, N347, N346, N345, N344, N343, N342, N341, N340, 
        N339}) );
  DFFRX1 \cnt_cost_reg[2]  ( .D(N331), .CK(CLK), .RN(n510), .Q(N97), .QN(n318)
         );
  DFFSX1 \min_value_reg[0]  ( .D(n314), .CK(CLK), .SN(n512), .QN(n283) );
  DFFRX1 find_flag_reg ( .D(n374), .CK(CLK), .RN(n509), .QN(n321) );
  DFFSX1 \min_value_reg[1]  ( .D(n375), .CK(CLK), .SN(n511), .QN(n329) );
  DFFRX1 \cnt_cost_reg[1]  ( .D(N330), .CK(CLK), .RN(n510), .Q(N96), .QN(n319)
         );
  DFFRX1 \sequence_reg[6][0]  ( .D(n362), .CK(CLK), .RN(n681), .Q(
        \sequence[6][0] ) );
  DFFSX1 \sequence_reg[5][0]  ( .D(n359), .CK(CLK), .SN(n511), .Q(
        \sequence[5][0] ), .QN(n444) );
  DFFSX1 \sequence_reg[6][2]  ( .D(n360), .CK(CLK), .SN(n511), .Q(
        \sequence[6][2] ), .QN(n431) );
  DFFSX1 \sequence_reg[6][1]  ( .D(n361), .CK(CLK), .SN(n511), .Q(
        \sequence[6][1] ), .QN(n430) );
  DFFSX1 \sequence_reg[7][2]  ( .D(n363), .CK(CLK), .SN(n511), .Q(
        \sequence[7][2] ), .QN(n442) );
  DFFSX1 \sequence_reg[7][0]  ( .D(n365), .CK(CLK), .SN(n511), .Q(
        \sequence[7][0] ), .QN(n441) );
  DFFSX1 \right_idx_reg[1]  ( .D(N430), .CK(CLK), .SN(n512), .Q(N99), .QN(n281) );
  DFFRX1 \idx_temp_reg[2]  ( .D(n370), .CK(CLK), .RN(n510), .Q(N106), .QN(n325) );
  DFFRX1 \sequence_reg[5][1]  ( .D(n358), .CK(CLK), .RN(n509), .Q(
        \sequence[5][1] ), .QN(n445) );
  DFFSX1 \sequence_reg[5][2]  ( .D(n357), .CK(CLK), .SN(n512), .Q(
        \sequence[5][2] ), .QN(n433) );
  DFFSX1 \sequence_reg[7][1]  ( .D(n364), .CK(CLK), .SN(n511), .Q(
        \sequence[7][1] ), .QN(n443) );
  DFFSX1 \sequence_reg[3][1]  ( .D(n352), .CK(CLK), .SN(n511), .Q(
        \sequence[3][1] ) );
  DFFRX1 \cnt_cost_reg[0]  ( .D(N329), .CK(CLK), .RN(n510), .Q(N95), .QN(n320)
         );
  DFFRX1 \min_index_reg[2]  ( .D(n369), .CK(CLK), .RN(n681), .Q(N91), .QN(n330) );
  DFFRX1 \idx_temp_reg[1]  ( .D(n367), .CK(CLK), .RN(n510), .Q(N105), .QN(n326) );
  DFFRX1 \sum_cost_reg[0]  ( .D(n342), .CK(CLK), .RN(n509), .Q(sum_cost[0]), 
        .QN(n438) );
  DFFRX1 \c_state_reg[1]  ( .D(n_state[1]), .CK(CLK), .RN(n509), .Q(n434), 
        .QN(n316) );
  DFFRX1 \sum_cost_reg[5]  ( .D(n337), .CK(CLK), .RN(n511), .Q(sum_cost[5]), 
        .QN(n440) );
  DFFRX1 \sum_cost_reg[2]  ( .D(n340), .CK(CLK), .RN(n509), .Q(sum_cost[2]), 
        .QN(n439) );
  DFFRX1 \sum_cost_reg[4]  ( .D(n338), .CK(CLK), .RN(n681), .Q(sum_cost[4]), 
        .QN(n437) );
  DFFRX1 \sum_cost_reg[1]  ( .D(n341), .CK(CLK), .RN(n509), .Q(sum_cost[1]), 
        .QN(n436) );
  DFFRX1 \sum_cost_reg[3]  ( .D(n339), .CK(CLK), .RN(n681), .Q(sum_cost[3]), 
        .QN(n435) );
  DFFSX1 \MinCost_reg[3]  ( .D(n300), .CK(CLK), .SN(n512), .Q(n751), .QN(n286)
         );
  DFFSX1 \MinCost_reg[2]  ( .D(n299), .CK(CLK), .SN(n512), .Q(n752), .QN(n285)
         );
  DFFSX1 \MinCost_reg[8]  ( .D(n305), .CK(CLK), .SN(n512), .Q(n746), .QN(n291)
         );
  DFFSX1 \MinCost_reg[4]  ( .D(n301), .CK(CLK), .SN(n512), .Q(n750), .QN(n287)
         );
  DFFSX1 \MinCost_reg[1]  ( .D(n298), .CK(CLK), .SN(n512), .Q(n753), .QN(n284)
         );
  DFFSX1 \MinCost_reg[9]  ( .D(n306), .CK(CLK), .SN(n512), .Q(n745), .QN(n292)
         );
  DFFSX1 \MinCost_reg[6]  ( .D(n303), .CK(CLK), .SN(n512), .Q(n748), .QN(n289)
         );
  DFFSX1 \MinCost_reg[0]  ( .D(n311), .CK(CLK), .SN(n512), .Q(n754), .QN(n297)
         );
  DFFRX1 \W_reg[0]  ( .D(N311), .CK(CLK), .RN(n509), .Q(n742), .QN(n459) );
  DFFRX1 \MatchCount_reg[1]  ( .D(n309), .CK(CLK), .RN(n510), .QN(n295) );
  DFFRX1 \MatchCount_reg[2]  ( .D(n308), .CK(CLK), .RN(n510), .QN(n294) );
  DFFRX1 \MatchCount_reg[0]  ( .D(n310), .CK(CLK), .RN(n510), .Q(n744), .QN(
        n296) );
  DFFRX1 \MatchCount_reg[3]  ( .D(n307), .CK(CLK), .RN(n510), .Q(n743), .QN(
        n293) );
  DFFRX1 \J_reg[0]  ( .D(N314), .CK(CLK), .RN(n509), .QN(n455) );
  DFFRX1 \J_reg[1]  ( .D(N315), .CK(CLK), .RN(n509), .QN(n453) );
  DFFRX1 \J_reg[2]  ( .D(N316), .CK(CLK), .RN(n509), .QN(n451) );
  DFFSX1 \MinCost_reg[7]  ( .D(n304), .CK(CLK), .SN(n512), .Q(n747), .QN(n290)
         );
  DFFRX1 \W_reg[2]  ( .D(N313), .CK(CLK), .RN(n510), .Q(n740), .QN(n448) );
  DFFRX1 \W_reg[1]  ( .D(N312), .CK(CLK), .RN(n510), .Q(n741), .QN(n446) );
  DFFSX1 \sequence_reg[1][0]  ( .D(n347), .CK(CLK), .SN(n681), .Q(
        \sequence[1][0] ), .QN(n738) );
  DFFSX1 \right_idx_reg[2]  ( .D(N431), .CK(CLK), .SN(n681), .Q(N100), .QN(
        n583) );
  DFFSXL \min_value_reg[2]  ( .D(n376), .CK(CLK), .SN(n681), .Q(n739), .QN(
        n328) );
  DFFRX1 \c_state_reg[2]  ( .D(n313), .CK(CLK), .RN(n681), .Q(n721), .QN(n315)
         );
  DFFRX1 \idx_temp_reg[0]  ( .D(n368), .CK(CLK), .RN(n681), .Q(N104), .QN(n618) );
  DFFRX1 \sequence_reg[0][2]  ( .D(n344), .CK(CLK), .RN(n681), .Q(
        \sequence[0][2] ), .QN(n699) );
  DFFRX1 \sequence_reg[0][0]  ( .D(n343), .CK(CLK), .RN(n681), .Q(
        \sequence[0][0] ), .QN(n692) );
  DFFRX1 \sequence_reg[0][1]  ( .D(n377), .CK(CLK), .RN(n681), .Q(
        \sequence[0][1] ), .QN(n702) );
  DFFRX1 \sequence_reg[1][2]  ( .D(n345), .CK(CLK), .RN(n681), .Q(
        \sequence[1][2] ), .QN(n736) );
  DFFRX1 \sequence_reg[1][1]  ( .D(n346), .CK(CLK), .RN(n681), .Q(
        \sequence[1][1] ), .QN(n737) );
  DFFRX1 \sum_cost_reg[6]  ( .D(n336), .CK(CLK), .RN(n681), .Q(sum_cost[6]), 
        .QN(n718) );
  DFFRX1 \sum_cost_reg[7]  ( .D(n335), .CK(CLK), .RN(n681), .Q(sum_cost[7]), 
        .QN(n719) );
  DFFRX1 \sum_cost_reg[8]  ( .D(n334), .CK(CLK), .RN(n681), .Q(sum_cost[8]), 
        .QN(n679) );
  DFFRX1 \sum_cost_reg[9]  ( .D(n333), .CK(CLK), .RN(n681), .Q(sum_cost[9]), 
        .QN(n720) );
  DFFRX4 \find_idx_reg[0]  ( .D(n372), .CK(CLK), .RN(n681), .Q(N92), .QN(n492)
         );
  DFFRX4 \find_idx_reg[1]  ( .D(n373), .CK(CLK), .RN(n681), .Q(N93), .QN(n549)
         );
  DFFRX2 \find_idx_reg[2]  ( .D(n371), .CK(CLK), .RN(n681), .Q(N94), .QN(n548)
         );
  DFFRX2 \min_index_reg[1]  ( .D(n366), .CK(CLK), .RN(n681), .Q(N90), .QN(n530) );
  DFFSX2 \sequence_reg[4][2]  ( .D(n354), .CK(CLK), .SN(n681), .Q(
        \sequence[4][2] ), .QN(n730) );
  DFFRX2 \sequence_reg[4][1]  ( .D(n355), .CK(CLK), .RN(n681), .Q(
        \sequence[4][1] ), .QN(n732) );
  DFFSX2 \right_idx_reg[0]  ( .D(N429), .CK(CLK), .SN(n681), .Q(N98), .QN(n584) );
  DFFSX2 \sequence_reg[2][1]  ( .D(n349), .CK(CLK), .SN(n681), .Q(
        \sequence[2][1] ), .QN(n731) );
  DFFRX2 \sequence_reg[2][2]  ( .D(n348), .CK(CLK), .RN(n681), .Q(
        \sequence[2][2] ), .QN(n728) );
  DFFRX2 \sequence_reg[2][0]  ( .D(n350), .CK(CLK), .RN(n681), .Q(
        \sequence[2][0] ), .QN(n733) );
  DFFSX2 \sequence_reg[3][0]  ( .D(n353), .CK(CLK), .SN(n681), .Q(
        \sequence[3][0] ), .QN(n734) );
  DFFRX2 \sequence_reg[3][2]  ( .D(n351), .CK(CLK), .RN(n681), .Q(
        \sequence[3][2] ), .QN(n729) );
  DFFRX2 \min_index_reg[0]  ( .D(n378), .CK(CLK), .RN(n681), .Q(N89), .QN(n531) );
  DFFRX2 \sequence_reg[4][0]  ( .D(n356), .CK(CLK), .RN(n681), .Q(
        \sequence[4][0] ), .QN(n735) );
  DFFRX2 \c_state_reg[0]  ( .D(n_state[0]), .CK(CLK), .RN(n681), .Q(n707), 
        .QN(n317) );
  DFFSX1 \MinCost_reg[5]  ( .D(n302), .CK(CLK), .SN(n512), .Q(n749), .QN(n288)
         );
  NOR2X1 U382 ( .A(n223), .B(N98), .Y(n597) );
  OAI222XL U383 ( .A0(MinCost[5]), .A1(n440), .B0(MinCost[5]), .B1(n670), .C0(
        n440), .C1(n670), .Y(n671) );
  AOI32X1 U384 ( .A0(n649), .A1(n656), .A2(n648), .B0(sum_cost[8]), .B1(n654), 
        .Y(n651) );
  OAI222XL U385 ( .A0(n746), .A1(n679), .B0(n746), .B1(n659), .C0(n679), .C1(
        n659), .Y(n660) );
  CLKINVX1 U386 ( .A(n746), .Y(n654) );
  OA21X2 U387 ( .A0(n652), .A1(n651), .B0(n650), .Y(n471) );
  OAI211X1 U388 ( .A0(n495), .A1(n122), .B0(n110), .C0(n123), .Y(n103) );
  OA22X1 U389 ( .A0(n601), .A1(n592), .B0(N103), .B1(n591), .Y(n432) );
  NOR2X2 U390 ( .A(N94), .B(N93), .Y(n489) );
  NOR2X2 U391 ( .A(n530), .B(n531), .Y(n525) );
  NOR2X2 U392 ( .A(n281), .B(N98), .Y(n580) );
  NOR2X2 U393 ( .A(n530), .B(N89), .Y(n526) );
  NAND3XL U394 ( .A(N89), .B(n727), .C(n530), .Y(n173) );
  NAND3XL U395 ( .A(n492), .B(N93), .C(n548), .Y(n122) );
  NAND3XL U396 ( .A(n549), .B(n492), .C(n548), .Y(n205) );
  AOI31XL U397 ( .A0(N93), .A1(N94), .A2(n492), .B0(n186), .Y(n189) );
  INVX6 U398 ( .A(RST), .Y(n681) );
  OAI22X1 U399 ( .A0(n547), .A1(n548), .B0(N94), .B1(n546), .Y(N451) );
  INVX12 U400 ( .A(n446), .Y(W[1]) );
  OAI22X1 U401 ( .A0(n325), .A1(n609), .B0(N106), .B1(n608), .Y(N447) );
  OAI22X1 U402 ( .A0(n548), .A1(n535), .B0(N94), .B1(n534), .Y(N453) );
  INVX12 U403 ( .A(n448), .Y(W[2]) );
  INVX12 U404 ( .A(n290), .Y(MinCost[7]) );
  OAI22X1 U405 ( .A0(n617), .A1(n325), .B0(N106), .B1(n616), .Y(N446) );
  INVX12 U406 ( .A(n451), .Y(J[2]) );
  INVX12 U407 ( .A(n453), .Y(J[1]) );
  INVX12 U408 ( .A(n455), .Y(J[0]) );
  BUFX12 U409 ( .A(n743), .Y(MatchCount[3]) );
  BUFX12 U410 ( .A(n744), .Y(MatchCount[0]) );
  INVX16 U411 ( .A(n294), .Y(MatchCount[2]) );
  INVX16 U412 ( .A(n295), .Y(MatchCount[1]) );
  INVX12 U413 ( .A(n459), .Y(W[0]) );
  BUFX12 U414 ( .A(n754), .Y(MinCost[0]) );
  OAI22X1 U415 ( .A0(n548), .A1(n539), .B0(N94), .B1(n538), .Y(N452) );
  INVX12 U416 ( .A(n289), .Y(MinCost[6]) );
  BUFX12 U417 ( .A(n755), .Y(Valid) );
  NOR2BX1 U418 ( .AN(n257), .B(n317), .Y(n755) );
  INVX12 U419 ( .A(n292), .Y(MinCost[9]) );
  INVX12 U420 ( .A(n284), .Y(MinCost[1]) );
  INVX12 U421 ( .A(n287), .Y(MinCost[4]) );
  NOR2BXL U422 ( .AN(sum_cost[4]), .B(n750), .Y(n641) );
  INVX12 U423 ( .A(n654), .Y(MinCost[8]) );
  INVX16 U424 ( .A(n288), .Y(MinCost[5]) );
  OAI21XL U425 ( .A0(n707), .A1(n721), .B0(n260), .Y(n264) );
  OAI211X1 U426 ( .A0(n321), .A1(n213), .B0(n262), .C0(n263), .Y(n_state[1])
         );
  OAI211XL U427 ( .A0(n315), .A1(n260), .B0(n261), .C0(n262), .Y(n313) );
  INVX16 U428 ( .A(n285), .Y(MinCost[2]) );
  NAND2XL U429 ( .A(n471), .B(n266), .Y(n270) );
  NAND2BX1 U430 ( .AN(n627), .B(n643), .Y(n646) );
  OA21XL U431 ( .A0(n714), .A1(n693), .B0(n255), .Y(n253) );
  INVXL U432 ( .A(N447), .Y(n701) );
  NOR2BXL U433 ( .AN(sum_cost[5]), .B(n749), .Y(n640) );
  NAND2BXL U434 ( .AN(sum_cost[5]), .B(n749), .Y(n639) );
  NAND2X1 U435 ( .A(sum_cost[6]), .B(n653), .Y(n643) );
  NAND2BXL U436 ( .AN(n745), .B(sum_cost[9]), .Y(n650) );
  INVX12 U437 ( .A(n286), .Y(MinCost[3]) );
  CLKINVX2 U438 ( .A(n71), .Y(n704) );
  INVXL U439 ( .A(n256), .Y(n693) );
  INVX1 U440 ( .A(n635), .Y(n657) );
  NOR2BXL U441 ( .AN(n631), .B(n630), .Y(n638) );
  OAI221XL U442 ( .A0(n716), .A1(n707), .B0(n265), .B1(n213), .C0(n269), .Y(
        n_state[0]) );
  AOI31XL U443 ( .A0(n624), .A1(n631), .A2(n635), .B0(n623), .Y(n625) );
  NAND3BXL U444 ( .AN(n636), .B(n622), .C(n621), .Y(n624) );
  OAI211XL U445 ( .A0(n620), .A1(n436), .B0(n619), .C0(n633), .Y(n622) );
  INVXL U446 ( .A(n250), .Y(n694) );
  NAND4X1 U447 ( .A(n238), .B(n434), .C(n239), .D(n240), .Y(n66) );
  CLKINVX1 U448 ( .A(N153), .Y(n687) );
  CLKINVX1 U449 ( .A(N154), .Y(n686) );
  CLKINVX1 U450 ( .A(N152), .Y(n688) );
  NOR2X1 U451 ( .A(n122), .B(n496), .Y(n138) );
  NAND2X1 U452 ( .A(n97), .B(n98), .Y(n86) );
  AOI2BB1X1 U453 ( .A0N(n235), .A1N(n724), .B0(n495), .Y(n76) );
  NAND4BXL U454 ( .AN(n320), .B(n318), .C(n250), .D(N96), .Y(n249) );
  NAND2XL U455 ( .A(n752), .B(n439), .Y(n621) );
  NOR2XL U456 ( .A(n297), .B(sum_cost[0]), .Y(n620) );
  NOR2BXL U457 ( .AN(n750), .B(sum_cost[4]), .Y(n623) );
  OAI32XL U458 ( .A0(N96), .A1(n320), .A2(n694), .B0(n319), .B1(n253), .Y(N330) );
  AO21XL U459 ( .A0(n436), .A1(n620), .B0(n753), .Y(n619) );
  AOI2BB1XL U460 ( .A0N(n284), .A1N(sum_cost[1]), .B0(MinCost[0]), .Y(n662) );
  NAND2BXL U461 ( .AN(n747), .B(sum_cost[7]), .Y(n659) );
  NOR2BXL U462 ( .AN(MinCost[2]), .B(sum_cost[2]), .Y(n663) );
  NAND3X1 U463 ( .A(n707), .B(n721), .C(n316), .Y(n68) );
  NAND2BXL U464 ( .AN(MinCost[2]), .B(sum_cost[2]), .Y(n664) );
  NOR2BXL U465 ( .AN(n747), .B(sum_cost[7]), .Y(n661) );
  XOR2X1 U466 ( .A(n280), .B(n583), .Y(N103) );
  CLKBUFX3 U467 ( .A(n121), .Y(n495) );
  NOR3X1 U468 ( .A(n120), .B(n530), .C(n495), .Y(n107) );
  NAND2X1 U469 ( .A(n317), .B(n257), .Y(n58) );
  OA22X1 U470 ( .A0(n188), .A1(n496), .B0(n202), .B1(n495), .Y(n196) );
  OA22X1 U471 ( .A0(n188), .A1(n496), .B0(n189), .B1(n495), .Y(n183) );
  CLKINVX1 U472 ( .A(n330), .Y(n727) );
  NOR3X2 U473 ( .A(n727), .B(n531), .C(N90), .Y(n87) );
  INVX3 U474 ( .A(n97), .Y(n708) );
  CLKINVX1 U475 ( .A(n110), .Y(n709) );
  NAND2X1 U476 ( .A(n471), .B(n693), .Y(n258) );
  NAND2X1 U477 ( .A(n705), .B(n471), .Y(n71) );
  INVX3 U478 ( .A(n498), .Y(n713) );
  CLKINVX1 U479 ( .A(n66), .Y(n690) );
  NAND3X1 U480 ( .A(n430), .B(n431), .C(n433), .Y(n275) );
  NAND2X2 U481 ( .A(n723), .B(n710), .Y(n110) );
  CLKINVX1 U482 ( .A(n103), .Y(n685) );
  NAND2X1 U483 ( .A(n724), .B(n710), .Y(n97) );
  CLKINVX1 U484 ( .A(n125), .Y(n682) );
  NOR2BX1 U485 ( .AN(n160), .B(n708), .Y(n143) );
  NAND2X1 U486 ( .A(n703), .B(n86), .Y(n84) );
  NAND2X1 U487 ( .A(n710), .B(n86), .Y(n81) );
  NAND2BX1 U488 ( .AN(n235), .B(n76), .Y(n74) );
  NAND2X1 U489 ( .A(n683), .B(n200), .Y(n193) );
  NAND2X1 U490 ( .A(n200), .B(n201), .Y(n192) );
  NAND2X1 U491 ( .A(n235), .B(n76), .Y(n72) );
  CLKINVX1 U492 ( .A(n138), .Y(n711) );
  CLKINVX1 U493 ( .A(n203), .Y(n722) );
  CLKINVX1 U494 ( .A(n201), .Y(n683) );
  NAND2X1 U495 ( .A(n247), .B(n601), .Y(N431) );
  CLKBUFX3 U496 ( .A(n509), .Y(n512) );
  CLKBUFX3 U497 ( .A(n681), .Y(n511) );
  CLKBUFX3 U498 ( .A(n681), .Y(n510) );
  CLKBUFX3 U499 ( .A(n681), .Y(n509) );
  AOI31X1 U500 ( .A0(n_state[0]), .A1(n695), .A2(n313), .B0(n705), .Y(n256) );
  CLKINVX1 U501 ( .A(n_state[1]), .Y(n695) );
  NAND2X1 U502 ( .A(n267), .B(n471), .Y(n266) );
  OA22X1 U503 ( .A0(n707), .A1(n265), .B0(n68), .B1(n266), .Y(n260) );
  AOI211X1 U504 ( .A0(n705), .A1(n270), .B0(n225), .C0(n257), .Y(n269) );
  OR2X1 U505 ( .A(N371), .B(\r441/GT ), .Y(n472) );
  OA21XL U506 ( .A0(N371), .A1(MatchCount[1]), .B0(n56), .Y(n54) );
  OA22X1 U507 ( .A0(n267), .A1(n71), .B0(n265), .B1(n213), .Y(n262) );
  CLKINVX1 U508 ( .A(n51), .Y(n715) );
  OAI2BB2XL U509 ( .B0(n718), .B1(n497), .A0N(N345), .A1N(n704), .Y(n336) );
  OAI2BB2XL U510 ( .B0(n435), .B1(n497), .A0N(N342), .A1N(n704), .Y(n339) );
  OAI2BB2XL U511 ( .B0(n436), .B1(n497), .A0N(N340), .A1N(n704), .Y(n341) );
  OAI2BB2XL U512 ( .B0(n437), .B1(n497), .A0N(N343), .A1N(n704), .Y(n338) );
  OAI2BB2XL U513 ( .B0(n439), .B1(n497), .A0N(N341), .A1N(n704), .Y(n340) );
  OAI2BB2XL U514 ( .B0(n440), .B1(n497), .A0N(N344), .A1N(n704), .Y(n337) );
  CLKBUFX3 U515 ( .A(n39), .Y(n498) );
  NAND2X1 U516 ( .A(N371), .B(n714), .Y(n39) );
  INVX1 U517 ( .A(N452), .Y(n700) );
  CLKINVX2 U518 ( .A(N451), .Y(n696) );
  NOR3X1 U519 ( .A(n241), .B(n707), .C(n721), .Y(n240) );
  AOI32XL U520 ( .A0(n243), .A1(n701), .A2(N452), .B0(n244), .B1(n245), .Y(
        n239) );
  OAI221XL U521 ( .A0(N452), .A1(n701), .B0(N453), .B1(n691), .C0(n243), .Y(
        n238) );
  NAND2XL U522 ( .A(N446), .B(n696), .Y(n243) );
  OAI22XL U523 ( .A0(n698), .A1(n739), .B0(N446), .B1(n696), .Y(n241) );
  OAI221XL U524 ( .A0(n687), .A1(n166), .B0(n700), .B1(n167), .C0(n171), .Y(
        n358) );
  AOI22X1 U525 ( .A0(N260), .A1(n169), .B0(n170), .B1(n508), .Y(n171) );
  OAI2BB2XL U526 ( .B0(n682), .B1(n132), .A0N(n682), .A1N(n500), .Y(n352) );
  AOI221XL U527 ( .A0(n503), .A1(n709), .B0(n708), .B1(n508), .C0(n133), .Y(
        n132) );
  OAI222XL U528 ( .A0(n687), .A1(n129), .B0(n443), .B1(n711), .C0(n700), .C1(
        n131), .Y(n133) );
  OAI22XL U529 ( .A0(n700), .A1(n149), .B0(n684), .B1(n687), .Y(n154) );
  INVX1 U530 ( .A(N453), .Y(n689) );
  OAI22XL U531 ( .A0(n733), .A1(n103), .B0(n685), .B1(n116), .Y(n350) );
  AOI221XL U532 ( .A0(n106), .A1(N154), .B0(n107), .B1(N453), .C0(n117), .Y(
        n116) );
  AO22X1 U533 ( .A0(n499), .A1(n709), .B0(n507), .B1(n708), .Y(n117) );
  INVXL U534 ( .A(N446), .Y(n698) );
  OAI22XL U535 ( .A0(n729), .A1(n125), .B0(n682), .B1(n127), .Y(n351) );
  AOI221XL U536 ( .A0(n504), .A1(n709), .B0(n506), .B1(n708), .C0(n128), .Y(
        n127) );
  OAI222XL U537 ( .A0(n688), .A1(n129), .B0(n442), .B1(n711), .C0(n696), .C1(
        n131), .Y(n128) );
  OAI222XL U538 ( .A0(n81), .A1(n443), .B0(n89), .B1(n84), .C0(n737), .C1(n86), 
        .Y(n346) );
  AOI2BB2XL U539 ( .B0(N452), .B1(n87), .A0N(n687), .A1N(n87), .Y(n89) );
  OAI222XL U540 ( .A0(n81), .A1(n441), .B0(n93), .B1(n84), .C0(n86), .C1(n738), 
        .Y(n347) );
  AOI2BB2XL U541 ( .B0(N453), .B1(n87), .A0N(n686), .A1N(n87), .Y(n93) );
  OAI221XL U542 ( .A0(n686), .A1(n166), .B0(n689), .B1(n167), .C0(n172), .Y(
        n359) );
  AOI22X1 U543 ( .A0(N259), .A1(n169), .B0(n170), .B1(n505), .Y(n172) );
  OAI221XL U544 ( .A0(n688), .A1(n166), .B0(n696), .B1(n167), .C0(n168), .Y(
        n357) );
  AOI22X1 U545 ( .A0(N261), .A1(n169), .B0(n170), .B1(n506), .Y(n168) );
  OAI22XL U546 ( .A0(n125), .A1(n734), .B0(n682), .B1(n136), .Y(n353) );
  AOI221XL U547 ( .A0(n709), .A1(n507), .B0(n505), .B1(n708), .C0(n137), .Y(
        n136) );
  OAI222XL U548 ( .A0(n686), .A1(n129), .B0(n441), .B1(n711), .C0(n689), .C1(
        n131), .Y(n137) );
  OAI221XL U549 ( .A0(n110), .A1(n444), .B0(n143), .B1(n735), .C0(n157), .Y(
        n356) );
  AOI222XL U550 ( .A0(n138), .A1(n507), .B0(n146), .B1(n158), .C0(n148), .C1(
        n499), .Y(n157) );
  OAI22XL U551 ( .A0(n689), .A1(n149), .B0(n684), .B1(n686), .Y(n158) );
  OAI22XL U552 ( .A0(n103), .A1(n731), .B0(n685), .B1(n112), .Y(n349) );
  AOI221XL U553 ( .A0(n106), .A1(N153), .B0(n107), .B1(N452), .C0(n113), .Y(
        n112) );
  OAI22XL U554 ( .A0(n97), .A1(n430), .B0(n443), .B1(n110), .Y(n113) );
  NAND2X1 U555 ( .A(n698), .B(n739), .Y(n245) );
  CLKINVX1 U556 ( .A(n664), .Y(n680) );
  OAI22XL U557 ( .A0(n728), .A1(n103), .B0(n685), .B1(n105), .Y(n348) );
  AOI221XL U558 ( .A0(n106), .A1(N152), .B0(n107), .B1(N451), .C0(n108), .Y(
        n105) );
  OAI22XL U559 ( .A0(n97), .A1(n431), .B0(n442), .B1(n110), .Y(n108) );
  INVX1 U560 ( .A(n489), .Y(n493) );
  OAI222XL U561 ( .A0(n81), .A1(n442), .B0(n83), .B1(n84), .C0(n736), .C1(n86), 
        .Y(n345) );
  AOI2BB2XL U562 ( .B0(N451), .B1(n87), .A0N(n688), .A1N(n87), .Y(n83) );
  NAND2X1 U563 ( .A(n225), .B(n226), .Y(n222) );
  OAI22XL U564 ( .A0(N410), .A1(n697), .B0(n228), .B1(n229), .Y(n226) );
  INVXL U565 ( .A(N407), .Y(n697) );
  NOR2BX1 U566 ( .AN(N410), .B(N407), .Y(n228) );
  CLKINVX1 U567 ( .A(N448), .Y(n691) );
  NAND2X1 U568 ( .A(n222), .B(n68), .Y(n220) );
  CLKINVX1 U569 ( .A(n223), .Y(N102) );
  CLKINVX1 U570 ( .A(n484), .Y(n494) );
  CLKINVX1 U571 ( .A(n68), .Y(n705) );
  CLKINVX1 U572 ( .A(N103), .Y(n601) );
  NAND3X1 U573 ( .A(n731), .B(n734), .C(n738), .Y(n276) );
  NOR2X1 U574 ( .A(n708), .B(n107), .Y(n123) );
  OAI211X1 U575 ( .A0(n495), .A1(n139), .B0(n131), .C0(n140), .Y(n125) );
  NOR3X1 U576 ( .A(n709), .B(n708), .C(n138), .Y(n140) );
  OAI21XL U577 ( .A0(n87), .A1(n723), .B0(n703), .Y(n98) );
  OAI22XL U578 ( .A0(n162), .A1(n496), .B0(n163), .B1(n495), .Y(n160) );
  NOR2X1 U579 ( .A(n164), .B(n684), .Y(n163) );
  NOR2BX1 U580 ( .AN(n160), .B(n495), .Y(n146) );
  NOR2X1 U581 ( .A(n496), .B(n170), .Y(n169) );
  NOR2X1 U582 ( .A(n496), .B(n196), .Y(n195) );
  NOR2X1 U583 ( .A(n496), .B(n183), .Y(n182) );
  CLKINVX1 U584 ( .A(n495), .Y(n703) );
  NOR2X1 U585 ( .A(N90), .B(n120), .Y(n235) );
  NOR2X1 U586 ( .A(n139), .B(n496), .Y(n148) );
  CLKINVX1 U587 ( .A(n149), .Y(n684) );
  NAND2X1 U588 ( .A(N93), .B(N92), .Y(n203) );
  NAND2BX1 U589 ( .AN(n173), .B(n174), .Y(n167) );
  NOR2X1 U590 ( .A(n177), .B(N92), .Y(n164) );
  NAND2BX1 U591 ( .AN(n186), .B(n187), .Y(n179) );
  NAND2X1 U592 ( .A(n174), .B(n173), .Y(n166) );
  CLKINVX1 U593 ( .A(n213), .Y(n706) );
  NAND2X1 U594 ( .A(n186), .B(n187), .Y(n180) );
  NOR2X1 U595 ( .A(n495), .B(n170), .Y(n174) );
  AND4X1 U596 ( .A(n165), .B(n122), .C(n139), .D(n205), .Y(n162) );
  CLKINVX1 U597 ( .A(n58), .Y(n714) );
  CLKINVX1 U598 ( .A(n212), .Y(n712) );
  NOR2X1 U599 ( .A(n495), .B(n183), .Y(n187) );
  NOR2X1 U600 ( .A(n495), .B(n196), .Y(n200) );
  NAND3X1 U601 ( .A(N90), .B(n727), .C(N89), .Y(n201) );
  CLKINVX1 U602 ( .A(n496), .Y(n710) );
  CLKINVX1 U603 ( .A(n165), .Y(n723) );
  CLKINVX1 U604 ( .A(n205), .Y(n724) );
  AND2X2 U605 ( .A(n162), .B(n177), .Y(n188) );
  OAI221XL U606 ( .A0(n212), .A1(N104), .B0(n213), .B1(N92), .C0(n214), .Y(
        n368) );
  NAND3X1 U607 ( .A(n213), .B(N104), .C(n212), .Y(n214) );
  NOR2X1 U608 ( .A(n205), .B(n213), .Y(n247) );
  NAND2X1 U609 ( .A(n247), .B(n223), .Y(N430) );
  CLKBUFX3 U610 ( .A(n69), .Y(n497) );
  NAND2X1 U611 ( .A(n58), .B(n68), .Y(n69) );
  CLKINVX1 U612 ( .A(n647), .Y(n656) );
  AOI21XL U613 ( .A0(n264), .A1(n434), .B0(Valid), .Y(n263) );
  CLKINVX1 U614 ( .A(n632), .Y(n658) );
  NOR2X1 U615 ( .A(N321), .B(n256), .Y(n250) );
  OAI21XL U616 ( .A0(n248), .A1(n318), .B0(n249), .Y(N331) );
  OA21XL U617 ( .A0(n694), .A1(N96), .B0(n253), .Y(n248) );
  NAND2X1 U618 ( .A(n320), .B(n250), .Y(n255) );
  CLKINVX1 U619 ( .A(n648), .Y(n655) );
  XOR2X1 U620 ( .A(n316), .B(n317), .Y(n261) );
  OAI32X1 U621 ( .A0(MatchCount[2]), .A1(n295), .A2(n715), .B0(n294), .B1(n54), 
        .Y(n308) );
  OAI31XL U622 ( .A0(n693), .A1(n320), .A2(n714), .B0(n255), .Y(N329) );
  NOR2BX1 U623 ( .AN(n59), .B(n58), .Y(n56) );
  OAI21XL U624 ( .A0(n296), .A1(n472), .B0(n717), .Y(n59) );
  INVXL U625 ( .A(N371), .Y(n717) );
  NOR2X1 U626 ( .A(n316), .B(n315), .Y(n257) );
  NOR2BX1 U627 ( .AN(N310), .B(n258), .Y(N314) );
  NOR2BX1 U628 ( .AN(N309), .B(n258), .Y(N315) );
  NOR2BX1 U629 ( .AN(N308), .B(n258), .Y(N316) );
  OAI21XL U630 ( .A0(n293), .A1(n49), .B0(n50), .Y(n307) );
  NAND4X1 U631 ( .A(n293), .B(n51), .C(MatchCount[1]), .D(MatchCount[2]), .Y(
        n50) );
  OA21XL U632 ( .A0(N371), .A1(MatchCount[2]), .B0(n54), .Y(n49) );
  NOR2X1 U633 ( .A(n318), .B(n258), .Y(N313) );
  NOR2X1 U634 ( .A(n319), .B(n258), .Y(N312) );
  NOR2X1 U635 ( .A(n320), .B(n258), .Y(N311) );
  INVXL U636 ( .A(n748), .Y(n653) );
  NOR4X1 U637 ( .A(n472), .B(n58), .C(N371), .D(n296), .Y(n51) );
  OAI22XL U638 ( .A0(n291), .A1(n713), .B0(n498), .B1(n679), .Y(n305) );
  OAI22XL U639 ( .A0(n290), .A1(n713), .B0(n498), .B1(n719), .Y(n304) );
  OAI22XL U640 ( .A0(n289), .A1(n713), .B0(n498), .B1(n718), .Y(n303) );
  OAI22XL U641 ( .A0(n286), .A1(n713), .B0(n498), .B1(n435), .Y(n300) );
  OAI22XL U642 ( .A0(n292), .A1(n713), .B0(n498), .B1(n720), .Y(n306) );
  OAI22XL U643 ( .A0(n284), .A1(n713), .B0(n498), .B1(n436), .Y(n298) );
  OAI22XL U644 ( .A0(n297), .A1(n713), .B0(n498), .B1(n438), .Y(n311) );
  OAI22XL U645 ( .A0(n287), .A1(n713), .B0(n498), .B1(n437), .Y(n301) );
  OAI22XL U646 ( .A0(n285), .A1(n713), .B0(n498), .B1(n439), .Y(n299) );
  OAI22XL U647 ( .A0(n288), .A1(n713), .B0(n498), .B1(n440), .Y(n302) );
  OAI22XL U648 ( .A0(n295), .A1(n56), .B0(n715), .B1(MatchCount[1]), .Y(n309)
         );
  OAI2BB2XL U649 ( .B0(n679), .B1(n497), .A0N(N347), .A1N(n704), .Y(n334) );
  OAI2BB2XL U650 ( .B0(n719), .B1(n497), .A0N(N346), .A1N(n704), .Y(n335) );
  OAI2BB2XL U651 ( .B0(n720), .B1(n497), .A0N(N348), .A1N(n704), .Y(n333) );
  OAI2BB2XL U652 ( .B0(n438), .B1(n497), .A0N(N339), .A1N(n704), .Y(n342) );
  NAND2X1 U653 ( .A(n61), .B(n498), .Y(n310) );
  XOR2X1 U654 ( .A(n296), .B(n62), .Y(n61) );
  NOR2X1 U655 ( .A(n58), .B(n472), .Y(n62) );
  OAI222XL U656 ( .A0(n700), .A1(n72), .B0(n74), .B1(n687), .C0(n76), .C1(n702), .Y(n377) );
  OAI221XL U657 ( .A0(n687), .A1(n192), .B0(n700), .B1(n193), .C0(n197), .Y(
        n364) );
  AOI22X1 U658 ( .A0(N254), .A1(n195), .B0(n196), .B1(n501), .Y(n197) );
  OAI221XL U659 ( .A0(n687), .A1(n179), .B0(n700), .B1(n180), .C0(n184), .Y(
        n361) );
  AOI22X1 U660 ( .A0(N257), .A1(n182), .B0(n183), .B1(n503), .Y(n184) );
  OAI221XL U661 ( .A0(n445), .A1(n110), .B0(n143), .B1(n732), .C0(n153), .Y(
        n355) );
  AOI222XL U662 ( .A0(n138), .A1(n503), .B0(n146), .B1(n154), .C0(n148), .C1(
        n501), .Y(n153) );
  OAI221XL U663 ( .A0(n698), .A1(n66), .B0(n328), .B1(n690), .C0(n68), .Y(n376) );
  OAI221XL U664 ( .A0(n701), .A1(n66), .B0(n329), .B1(n690), .C0(n68), .Y(n375) );
  OAI221XL U665 ( .A0(n691), .A1(n66), .B0(n283), .B1(n690), .C0(n68), .Y(n314) );
  OAI22XL U666 ( .A0(n330), .A1(n690), .B0(n325), .B1(n66), .Y(n369) );
  OAI22XL U667 ( .A0(n530), .A1(n690), .B0(n326), .B1(n66), .Y(n366) );
  OAI22XL U668 ( .A0(n531), .A1(n690), .B0(n618), .B1(n66), .Y(n378) );
  OAI222XL U669 ( .A0(n696), .A1(n72), .B0(n74), .B1(n688), .C0(n76), .C1(n699), .Y(n344) );
  OAI222XL U670 ( .A0(n72), .A1(n689), .B0(n74), .B1(n686), .C0(n76), .C1(n692), .Y(n343) );
  OAI221XL U671 ( .A0(n686), .A1(n192), .B0(n689), .B1(n193), .C0(n198), .Y(
        n365) );
  AOI22X1 U672 ( .A0(N253), .A1(n195), .B0(n196), .B1(n499), .Y(n198) );
  OAI221XL U673 ( .A0(n686), .A1(n179), .B0(n689), .B1(n180), .C0(n185), .Y(
        n362) );
  AOI22X1 U674 ( .A0(N256), .A1(n182), .B0(n183), .B1(n507), .Y(n185) );
  OAI221XL U675 ( .A0(n688), .A1(n192), .B0(n696), .B1(n193), .C0(n194), .Y(
        n363) );
  AOI22X1 U676 ( .A0(N255), .A1(n195), .B0(n196), .B1(n502), .Y(n194) );
  OAI221XL U677 ( .A0(n688), .A1(n179), .B0(n696), .B1(n180), .C0(n181), .Y(
        n360) );
  AOI22X1 U678 ( .A0(N258), .A1(n182), .B0(n183), .B1(n504), .Y(n181) );
  OAI221XL U679 ( .A0(n110), .A1(n433), .B0(n143), .B1(n730), .C0(n145), .Y(
        n354) );
  AOI222XL U680 ( .A0(n138), .A1(n504), .B0(n146), .B1(n147), .C0(n148), .C1(
        n502), .Y(n145) );
  OAI22XL U681 ( .A0(n696), .A1(n149), .B0(n684), .B1(n688), .Y(n147) );
  OAI2BB1XL U682 ( .A0N(N447), .A1N(n329), .B0(n246), .Y(n244) );
  OAI211XL U683 ( .A0(N447), .A1(n329), .B0(N448), .C0(n283), .Y(n246) );
  CLKBUFX3 U684 ( .A(\sequence[7][1] ), .Y(n501) );
  CLKBUFX3 U685 ( .A(\sequence[5][1] ), .Y(n508) );
  CLKBUFX3 U686 ( .A(\sequence[5][2] ), .Y(n506) );
  CLKBUFX3 U687 ( .A(\sequence[3][1] ), .Y(n500) );
  NAND3XL U688 ( .A(n742), .B(n740), .C(n741), .Y(n267) );
  XNOR2X1 U689 ( .A(n281), .B(N98), .Y(n223) );
  AOI22XL U690 ( .A0(n230), .A1(N409), .B0(N408), .B1(n432), .Y(n229) );
  AOI2BB1X1 U691 ( .A0N(n432), .A1N(N408), .B0(N412), .Y(n230) );
  OAI22XL U692 ( .A0(n548), .A1(n220), .B0(n601), .B1(n222), .Y(n371) );
  OAI22XL U693 ( .A0(n492), .A1(n220), .B0(N98), .B1(n222), .Y(n372) );
  OAI22XL U694 ( .A0(n549), .A1(n220), .B0(n223), .B1(n222), .Y(n373) );
  OAI21XL U695 ( .A0(n321), .A1(n705), .B0(n222), .Y(n374) );
  CLKBUFX3 U696 ( .A(\sequence[7][0] ), .Y(n499) );
  CLKBUFX3 U697 ( .A(\sequence[7][2] ), .Y(n502) );
  CLKBUFX3 U698 ( .A(\sequence[6][0] ), .Y(n507) );
  CLKBUFX3 U699 ( .A(\sequence[5][0] ), .Y(n505) );
  CLKBUFX3 U700 ( .A(\sequence[6][2] ), .Y(n504) );
  CLKBUFX3 U701 ( .A(\sequence[6][1] ), .Y(n503) );
  NAND2BX1 U702 ( .AN(N98), .B(n281), .Y(n280) );
  NAND3X2 U703 ( .A(n316), .B(n707), .C(n315), .Y(n213) );
  NOR4X1 U704 ( .A(n278), .B(n735), .C(n728), .D(n729), .Y(n271) );
  NAND3X1 U705 ( .A(n508), .B(\sequence[4][1] ), .C(n507), .Y(n278) );
  NOR2BX1 U706 ( .AN(n321), .B(n213), .Y(n225) );
  NAND4X1 U707 ( .A(n271), .B(n272), .C(n273), .D(n274), .Y(n265) );
  NOR4X1 U708 ( .A(n277), .B(n733), .C(n737), .D(n736), .Y(n272) );
  NOR4X1 U709 ( .A(n275), .B(n499), .C(n502), .D(n501), .Y(n274) );
  NOR4X1 U710 ( .A(n276), .B(n500), .C(n505), .D(\sequence[4][2] ), .Y(n273)
         );
  NAND3X1 U711 ( .A(\sequence[0][1] ), .B(\sequence[0][0] ), .C(
        \sequence[0][2] ), .Y(n277) );
  CLKINVX1 U712 ( .A(N91), .Y(n529) );
  OAI31X1 U713 ( .A0(n727), .A1(n530), .A2(n531), .B0(n703), .Y(n129) );
  AOI2BB1X1 U714 ( .A0N(n203), .A1N(n548), .B0(n683), .Y(n202) );
  NAND4X1 U715 ( .A(n703), .B(n330), .C(N89), .D(N90), .Y(n131) );
  NAND2X1 U716 ( .A(n722), .B(n548), .Y(n139) );
  NAND3X1 U717 ( .A(n531), .B(n727), .C(n530), .Y(n149) );
  OAI211X1 U718 ( .A0(n326), .A1(n206), .B0(n207), .C0(n208), .Y(n367) );
  NAND3X1 U719 ( .A(n712), .B(N104), .C(n326), .Y(n207) );
  OAI211X1 U720 ( .A0(N92), .A1(N93), .B0(n203), .C0(n706), .Y(n208) );
  AOI2BB2X1 U721 ( .B0(n618), .B1(n712), .A0N(n712), .A1N(n706), .Y(n206) );
  NOR3X1 U722 ( .A(n530), .B(n330), .C(N89), .Y(n186) );
  NAND2X1 U723 ( .A(n330), .B(n531), .Y(n120) );
  NAND2X1 U724 ( .A(n549), .B(N94), .Y(n177) );
  NAND3X1 U725 ( .A(n315), .B(n317), .C(n716), .Y(n212) );
  NAND3X1 U726 ( .A(n549), .B(N92), .C(n548), .Y(n165) );
  CLKINVX1 U727 ( .A(n279), .Y(n716) );
  OAI31XL U728 ( .A0(n618), .A1(n325), .A2(n326), .B0(n434), .Y(n279) );
  OAI21XL U729 ( .A0(n325), .A1(n706), .B0(n215), .Y(n370) );
  AOI32X1 U730 ( .A0(N104), .A1(N105), .A2(n712), .B0(n706), .B1(n217), .Y(
        n215) );
  OAI21XL U731 ( .A0(n548), .A1(n722), .B0(n139), .Y(n217) );
  NAND3X1 U732 ( .A(n707), .B(n434), .C(n315), .Y(n121) );
  AOI2BB2X2 U733 ( .B0(n703), .B1(n175), .A0N(n176), .A1N(n496), .Y(n170) );
  OAI21XL U734 ( .A0(n492), .A1(n177), .B0(n173), .Y(n175) );
  NOR2BX1 U735 ( .AN(n162), .B(n164), .Y(n176) );
  CLKBUFX3 U736 ( .A(n159), .Y(n496) );
  NAND3X1 U737 ( .A(n317), .B(n721), .C(n316), .Y(n159) );
  CLKINVX1 U738 ( .A(N95), .Y(n566) );
  AOI2BB1X1 U739 ( .A0N(n530), .A1N(n120), .B0(n495), .Y(n106) );
  NAND2X1 U740 ( .A(n247), .B(N98), .Y(N429) );
  OAI22XL U741 ( .A0(\sequence[4][0] ), .A1(n492), .B0(\sequence[3][0] ), .B1(
        N92), .Y(n474) );
  NAND2X1 U742 ( .A(N94), .B(n549), .Y(n484) );
  OAI22XL U743 ( .A0(n507), .A1(n492), .B0(n505), .B1(N92), .Y(n475) );
  OAI222XL U744 ( .A0(n474), .A1(n493), .B0(n484), .B1(n441), .C0(n475), .C1(
        n549), .Y(N259) );
  OAI22XL U745 ( .A0(\sequence[4][1] ), .A1(n492), .B0(n500), .B1(N92), .Y(
        n477) );
  OAI22XL U746 ( .A0(n503), .A1(n492), .B0(n508), .B1(N92), .Y(n478) );
  OAI222XL U747 ( .A0(n477), .A1(n493), .B0(n484), .B1(n443), .C0(n478), .C1(
        n549), .Y(N260) );
  OAI22XL U748 ( .A0(\sequence[4][2] ), .A1(n492), .B0(\sequence[3][2] ), .B1(
        N92), .Y(n482) );
  OAI22XL U749 ( .A0(n504), .A1(n492), .B0(n506), .B1(N92), .Y(n483) );
  OAI222XL U750 ( .A0(n482), .A1(n493), .B0(n484), .B1(n442), .C0(n483), .C1(
        n549), .Y(N261) );
  NOR2X1 U751 ( .A(n493), .B(N92), .Y(n480) );
  NOR2X1 U752 ( .A(n492), .B(n493), .Y(n479) );
  AOI22X1 U753 ( .A0(\sequence[1][0] ), .A1(n480), .B0(n479), .B1(
        \sequence[2][0] ), .Y(n473) );
  OAI221XL U754 ( .A0(n475), .A1(n484), .B0(n474), .B1(n549), .C0(n473), .Y(
        N253) );
  AOI22X1 U755 ( .A0(\sequence[1][1] ), .A1(n480), .B0(n479), .B1(
        \sequence[2][1] ), .Y(n476) );
  OAI221XL U756 ( .A0(n478), .A1(n484), .B0(n477), .B1(n549), .C0(n476), .Y(
        N254) );
  AOI22X1 U757 ( .A0(\sequence[1][2] ), .A1(n480), .B0(n479), .B1(
        \sequence[2][2] ), .Y(n481) );
  OAI221XL U758 ( .A0(n483), .A1(n484), .B0(n482), .B1(n549), .C0(n481), .Y(
        N255) );
  AOI222XL U759 ( .A0(n505), .A1(N93), .B0(n499), .B1(n494), .C0(
        \sequence[3][0] ), .C1(n489), .Y(n486) );
  AOI222XL U760 ( .A0(\sequence[4][0] ), .A1(N93), .B0(n507), .B1(n494), .C0(
        \sequence[2][0] ), .C1(n489), .Y(n485) );
  OAI22XL U761 ( .A0(n492), .A1(n486), .B0(N92), .B1(n485), .Y(N256) );
  AOI222XL U762 ( .A0(n508), .A1(N93), .B0(n501), .B1(n494), .C0(n500), .C1(
        n489), .Y(n488) );
  AOI222XL U763 ( .A0(\sequence[4][1] ), .A1(N93), .B0(n503), .B1(n494), .C0(
        \sequence[2][1] ), .C1(n489), .Y(n487) );
  OAI22XL U764 ( .A0(n492), .A1(n488), .B0(N92), .B1(n487), .Y(N257) );
  AOI222XL U765 ( .A0(n506), .A1(N93), .B0(n502), .B1(n494), .C0(
        \sequence[3][2] ), .C1(n489), .Y(n491) );
  AOI222XL U766 ( .A0(\sequence[4][2] ), .A1(N93), .B0(n504), .B1(n494), .C0(
        \sequence[2][2] ), .C1(n489), .Y(n490) );
  OAI22XL U767 ( .A0(n491), .A1(n492), .B0(N92), .B1(n490), .Y(N258) );
  NOR2X1 U768 ( .A(n531), .B(N90), .Y(n523) );
  NOR2X1 U769 ( .A(N89), .B(N90), .Y(n522) );
  AO22X1 U770 ( .A0(n505), .A1(n523), .B0(\sequence[4][0] ), .B1(n522), .Y(
        n513) );
  AOI221XL U771 ( .A0(n507), .A1(n526), .B0(n499), .B1(n525), .C0(n513), .Y(
        n516) );
  AO22X1 U772 ( .A0(\sequence[1][0] ), .A1(n523), .B0(\sequence[0][0] ), .B1(
        n522), .Y(n514) );
  AOI221XL U773 ( .A0(\sequence[2][0] ), .A1(n526), .B0(\sequence[3][0] ), 
        .B1(n525), .C0(n514), .Y(n515) );
  OAI22XL U774 ( .A0(n529), .A1(n516), .B0(N91), .B1(n515), .Y(N154) );
  AO22X1 U775 ( .A0(n508), .A1(n523), .B0(\sequence[4][1] ), .B1(n522), .Y(
        n517) );
  AOI221XL U776 ( .A0(n503), .A1(n526), .B0(n501), .B1(n525), .C0(n517), .Y(
        n520) );
  AO22X1 U777 ( .A0(\sequence[1][1] ), .A1(n523), .B0(\sequence[0][1] ), .B1(
        n522), .Y(n518) );
  AOI221XL U778 ( .A0(\sequence[2][1] ), .A1(n526), .B0(n500), .B1(n525), .C0(
        n518), .Y(n519) );
  OAI22XL U779 ( .A0(n529), .A1(n520), .B0(N91), .B1(n519), .Y(N153) );
  AO22X1 U780 ( .A0(n506), .A1(n523), .B0(\sequence[4][2] ), .B1(n522), .Y(
        n521) );
  AOI221XL U781 ( .A0(n504), .A1(n526), .B0(n502), .B1(n525), .C0(n521), .Y(
        n528) );
  AO22X1 U782 ( .A0(\sequence[1][2] ), .A1(n523), .B0(\sequence[0][2] ), .B1(
        n522), .Y(n524) );
  AOI221XL U783 ( .A0(\sequence[2][2] ), .A1(n526), .B0(\sequence[3][2] ), 
        .B1(n525), .C0(n524), .Y(n527) );
  OAI22XL U784 ( .A0(n528), .A1(n529), .B0(N91), .B1(n527), .Y(N152) );
  NOR2X1 U785 ( .A(n549), .B(N92), .Y(n545) );
  NOR2X1 U786 ( .A(n549), .B(n492), .Y(n544) );
  NOR2X1 U787 ( .A(n492), .B(N93), .Y(n542) );
  NOR2X1 U788 ( .A(N92), .B(N93), .Y(n541) );
  AO22X1 U789 ( .A0(n505), .A1(n542), .B0(\sequence[4][0] ), .B1(n541), .Y(
        n532) );
  AOI221XL U790 ( .A0(n507), .A1(n545), .B0(n499), .B1(n544), .C0(n532), .Y(
        n535) );
  AO22X1 U791 ( .A0(\sequence[1][0] ), .A1(n542), .B0(\sequence[0][0] ), .B1(
        n541), .Y(n533) );
  AOI221XL U792 ( .A0(\sequence[2][0] ), .A1(n545), .B0(\sequence[3][0] ), 
        .B1(n544), .C0(n533), .Y(n534) );
  AO22X1 U793 ( .A0(n508), .A1(n542), .B0(\sequence[4][1] ), .B1(n541), .Y(
        n536) );
  AOI221XL U794 ( .A0(n503), .A1(n545), .B0(n501), .B1(n544), .C0(n536), .Y(
        n539) );
  AO22X1 U795 ( .A0(\sequence[1][1] ), .A1(n542), .B0(\sequence[0][1] ), .B1(
        n541), .Y(n537) );
  AOI221XL U796 ( .A0(\sequence[2][1] ), .A1(n545), .B0(n500), .B1(n544), .C0(
        n537), .Y(n538) );
  AO22X1 U797 ( .A0(n506), .A1(n542), .B0(\sequence[4][2] ), .B1(n541), .Y(
        n540) );
  AOI221XL U798 ( .A0(n504), .A1(n545), .B0(n502), .B1(n544), .C0(n540), .Y(
        n547) );
  AO22X1 U799 ( .A0(\sequence[1][2] ), .A1(n542), .B0(\sequence[0][2] ), .B1(
        n541), .Y(n543) );
  AOI221XL U800 ( .A0(\sequence[2][2] ), .A1(n545), .B0(\sequence[3][2] ), 
        .B1(n544), .C0(n543), .Y(n546) );
  NOR2X1 U801 ( .A(n319), .B(N95), .Y(n563) );
  NOR2X1 U802 ( .A(n319), .B(n566), .Y(n562) );
  NOR2X1 U803 ( .A(n566), .B(N96), .Y(n560) );
  NOR2X1 U804 ( .A(N95), .B(N96), .Y(n559) );
  AO22X1 U805 ( .A0(n505), .A1(n560), .B0(\sequence[4][0] ), .B1(n559), .Y(
        n550) );
  AOI221XL U806 ( .A0(n507), .A1(n563), .B0(n499), .B1(n562), .C0(n550), .Y(
        n553) );
  AO22X1 U807 ( .A0(\sequence[1][0] ), .A1(n560), .B0(\sequence[0][0] ), .B1(
        n559), .Y(n551) );
  AOI221XL U808 ( .A0(\sequence[2][0] ), .A1(n563), .B0(\sequence[3][0] ), 
        .B1(n562), .C0(n551), .Y(n552) );
  OAI22XL U809 ( .A0(n318), .A1(n553), .B0(N97), .B1(n552), .Y(N310) );
  AO22X1 U810 ( .A0(n508), .A1(n560), .B0(\sequence[4][1] ), .B1(n559), .Y(
        n554) );
  AOI221XL U811 ( .A0(n503), .A1(n563), .B0(n501), .B1(n562), .C0(n554), .Y(
        n557) );
  AO22X1 U812 ( .A0(\sequence[1][1] ), .A1(n560), .B0(\sequence[0][1] ), .B1(
        n559), .Y(n555) );
  AOI221XL U813 ( .A0(\sequence[2][1] ), .A1(n563), .B0(n500), .B1(n562), .C0(
        n555), .Y(n556) );
  OAI22XL U814 ( .A0(n318), .A1(n557), .B0(N97), .B1(n556), .Y(N309) );
  AO22X1 U815 ( .A0(n506), .A1(n560), .B0(\sequence[4][2] ), .B1(n559), .Y(
        n558) );
  AOI221XL U816 ( .A0(n504), .A1(n563), .B0(n502), .B1(n562), .C0(n558), .Y(
        n565) );
  AO22X1 U817 ( .A0(\sequence[1][2] ), .A1(n560), .B0(\sequence[0][2] ), .B1(
        n559), .Y(n561) );
  AOI221XL U818 ( .A0(\sequence[2][2] ), .A1(n563), .B0(\sequence[3][2] ), 
        .B1(n562), .C0(n561), .Y(n564) );
  OAI22XL U819 ( .A0(n565), .A1(n318), .B0(N97), .B1(n564), .Y(N308) );
  NOR2X1 U820 ( .A(n281), .B(n584), .Y(n579) );
  NOR2X1 U821 ( .A(n584), .B(N99), .Y(n577) );
  NOR2X1 U822 ( .A(N98), .B(N99), .Y(n576) );
  AO22X1 U823 ( .A0(n505), .A1(n577), .B0(\sequence[4][0] ), .B1(n576), .Y(
        n567) );
  AOI221XL U824 ( .A0(n507), .A1(n580), .B0(n499), .B1(n579), .C0(n567), .Y(
        n570) );
  AO22X1 U825 ( .A0(\sequence[1][0] ), .A1(n577), .B0(\sequence[0][0] ), .B1(
        n576), .Y(n568) );
  AOI221XL U826 ( .A0(\sequence[2][0] ), .A1(n580), .B0(\sequence[3][0] ), 
        .B1(n579), .C0(n568), .Y(n569) );
  OAI22XL U827 ( .A0(n583), .A1(n570), .B0(N100), .B1(n569), .Y(N409) );
  AO22X1 U828 ( .A0(n508), .A1(n577), .B0(\sequence[4][1] ), .B1(n576), .Y(
        n571) );
  AOI221XL U829 ( .A0(n503), .A1(n580), .B0(n501), .B1(n579), .C0(n571), .Y(
        n574) );
  AO22X1 U830 ( .A0(\sequence[1][1] ), .A1(n577), .B0(\sequence[0][1] ), .B1(
        n576), .Y(n572) );
  AOI221XL U831 ( .A0(\sequence[2][1] ), .A1(n580), .B0(n500), .B1(n579), .C0(
        n572), .Y(n573) );
  OAI22XL U832 ( .A0(n583), .A1(n574), .B0(N100), .B1(n573), .Y(N408) );
  AO22X1 U833 ( .A0(n506), .A1(n577), .B0(\sequence[4][2] ), .B1(n576), .Y(
        n575) );
  AOI221XL U834 ( .A0(n504), .A1(n580), .B0(n502), .B1(n579), .C0(n575), .Y(
        n582) );
  AO22X1 U835 ( .A0(\sequence[1][2] ), .A1(n577), .B0(\sequence[0][2] ), .B1(
        n576), .Y(n578) );
  AOI221XL U836 ( .A0(\sequence[2][2] ), .A1(n580), .B0(\sequence[3][2] ), 
        .B1(n579), .C0(n578), .Y(n581) );
  OAI22XL U837 ( .A0(n582), .A1(n583), .B0(N100), .B1(n581), .Y(N407) );
  NOR2X1 U838 ( .A(n223), .B(n584), .Y(n598) );
  NOR2X1 U839 ( .A(N98), .B(N102), .Y(n595) );
  NOR2X1 U840 ( .A(n584), .B(N102), .Y(n594) );
  AO22X1 U841 ( .A0(n505), .A1(n595), .B0(\sequence[4][0] ), .B1(n594), .Y(
        n585) );
  AOI221XL U842 ( .A0(n507), .A1(n598), .B0(n499), .B1(n597), .C0(n585), .Y(
        n588) );
  AO22X1 U843 ( .A0(\sequence[1][0] ), .A1(n595), .B0(\sequence[0][0] ), .B1(
        n594), .Y(n586) );
  AOI221XL U844 ( .A0(\sequence[2][0] ), .A1(n598), .B0(\sequence[3][0] ), 
        .B1(n597), .C0(n586), .Y(n587) );
  OAI22XL U845 ( .A0(n601), .A1(n588), .B0(N103), .B1(n587), .Y(N412) );
  AO22X1 U846 ( .A0(n508), .A1(n595), .B0(\sequence[4][1] ), .B1(n594), .Y(
        n589) );
  AOI221XL U847 ( .A0(n503), .A1(n598), .B0(n501), .B1(n597), .C0(n589), .Y(
        n592) );
  AO22X1 U848 ( .A0(\sequence[1][1] ), .A1(n595), .B0(\sequence[0][1] ), .B1(
        n594), .Y(n590) );
  AOI221XL U849 ( .A0(\sequence[2][1] ), .A1(n598), .B0(n500), .B1(n597), .C0(
        n590), .Y(n591) );
  AO22X1 U850 ( .A0(n506), .A1(n595), .B0(\sequence[4][2] ), .B1(n594), .Y(
        n593) );
  AOI221XL U851 ( .A0(n504), .A1(n598), .B0(n502), .B1(n597), .C0(n593), .Y(
        n600) );
  AO22X1 U852 ( .A0(\sequence[1][2] ), .A1(n595), .B0(\sequence[0][2] ), .B1(
        n594), .Y(n596) );
  AOI221XL U853 ( .A0(\sequence[2][2] ), .A1(n598), .B0(\sequence[3][2] ), 
        .B1(n597), .C0(n596), .Y(n599) );
  OAI22XL U854 ( .A0(n600), .A1(n601), .B0(N103), .B1(n599), .Y(N410) );
  NOR2X1 U855 ( .A(n326), .B(N104), .Y(n615) );
  NOR2X1 U856 ( .A(n326), .B(n618), .Y(n614) );
  NOR2X1 U857 ( .A(n618), .B(N105), .Y(n612) );
  NOR2X1 U858 ( .A(N104), .B(N105), .Y(n611) );
  AO22X1 U859 ( .A0(n505), .A1(n612), .B0(\sequence[4][0] ), .B1(n611), .Y(
        n602) );
  AOI221XL U860 ( .A0(n507), .A1(n615), .B0(n499), .B1(n614), .C0(n602), .Y(
        n605) );
  AO22X1 U861 ( .A0(\sequence[1][0] ), .A1(n612), .B0(\sequence[0][0] ), .B1(
        n611), .Y(n603) );
  AOI221XL U862 ( .A0(\sequence[2][0] ), .A1(n615), .B0(\sequence[3][0] ), 
        .B1(n614), .C0(n603), .Y(n604) );
  OAI22XL U863 ( .A0(n325), .A1(n605), .B0(N106), .B1(n604), .Y(N448) );
  AO22X1 U864 ( .A0(n508), .A1(n612), .B0(\sequence[4][1] ), .B1(n611), .Y(
        n606) );
  AOI221XL U865 ( .A0(n503), .A1(n615), .B0(n501), .B1(n614), .C0(n606), .Y(
        n609) );
  AO22X1 U866 ( .A0(\sequence[1][1] ), .A1(n612), .B0(\sequence[0][1] ), .B1(
        n611), .Y(n607) );
  AOI221XL U867 ( .A0(\sequence[2][1] ), .A1(n615), .B0(n500), .B1(n614), .C0(
        n607), .Y(n608) );
  AO22X1 U868 ( .A0(n506), .A1(n612), .B0(\sequence[4][2] ), .B1(n611), .Y(
        n610) );
  AOI221XL U869 ( .A0(n504), .A1(n615), .B0(n502), .B1(n614), .C0(n610), .Y(
        n617) );
  AO22X1 U870 ( .A0(\sequence[1][2] ), .A1(n612), .B0(\sequence[0][2] ), .B1(
        n611), .Y(n613) );
  AOI221XL U871 ( .A0(\sequence[2][2] ), .A1(n615), .B0(\sequence[3][2] ), 
        .B1(n614), .C0(n613), .Y(n616) );
  XOR2X1 U872 ( .A(sum_cost[8]), .B(n654), .Y(n648) );
  NOR2X1 U873 ( .A(n290), .B(sum_cost[7]), .Y(n647) );
  NOR2X1 U874 ( .A(n653), .B(sum_cost[6]), .Y(n627) );
  NOR2X1 U875 ( .A(n286), .B(sum_cost[3]), .Y(n636) );
  NOR2X1 U876 ( .A(n439), .B(n752), .Y(n630) );
  NOR2BX1 U877 ( .AN(n621), .B(n630), .Y(n633) );
  NAND2X1 U878 ( .A(sum_cost[3]), .B(n286), .Y(n631) );
  NOR2X1 U879 ( .A(n641), .B(n623), .Y(n635) );
  AOI211X1 U880 ( .A0(n625), .A1(n639), .B0(n646), .C0(n640), .Y(n626) );
  NAND2X1 U881 ( .A(sum_cost[7]), .B(n290), .Y(n644) );
  OAI31XL U882 ( .A0(n647), .A1(n627), .A2(n626), .B0(n644), .Y(n628) );
  OAI22XL U883 ( .A0(n655), .A1(n628), .B0(sum_cost[8]), .B1(n654), .Y(n629)
         );
  NOR2BX1 U884 ( .AN(n745), .B(sum_cost[9]), .Y(n652) );
  AO21X1 U885 ( .A0(n629), .A1(n650), .B0(n652), .Y(N371) );
  NAND2X1 U886 ( .A(sum_cost[0]), .B(n297), .Y(n632) );
  OAI21XL U887 ( .A0(n436), .A1(n632), .B0(n753), .Y(n634) );
  OAI211X1 U888 ( .A0(sum_cost[1]), .A1(n658), .B0(n634), .C0(n633), .Y(n637)
         );
  AOI211X1 U889 ( .A0(n638), .A1(n637), .B0(n657), .C0(n636), .Y(n642) );
  OAI31XL U890 ( .A0(n642), .A1(n641), .A2(n640), .B0(n639), .Y(n645) );
  OAI211X1 U891 ( .A0(n646), .A1(n645), .B0(n644), .C0(n643), .Y(n649) );
  OAI21XL U892 ( .A0(n652), .A1(n651), .B0(n650), .Y(\r441/GT ) );
  OAI222XL U893 ( .A0(sum_cost[9]), .A1(n660), .B0(n292), .B1(n660), .C0(
        sum_cost[9]), .C1(n292), .Y(n678) );
  OAI22XL U894 ( .A0(n661), .A1(n679), .B0(n746), .B1(n661), .Y(n676) );
  AO22X1 U895 ( .A0(n662), .A1(sum_cost[0]), .B0(sum_cost[1]), .B1(n284), .Y(
        n667) );
  OAI22XL U896 ( .A0(n663), .A1(n435), .B0(n751), .B1(n663), .Y(n666) );
  OAI22XL U897 ( .A0(n751), .A1(n435), .B0(n751), .B1(n664), .Y(n665) );
  AOI221XL U898 ( .A0(sum_cost[3]), .A1(n680), .B0(n667), .B1(n666), .C0(n665), 
        .Y(n674) );
  NOR2X1 U899 ( .A(n287), .B(sum_cost[4]), .Y(n668) );
  OAI22XL U900 ( .A0(n668), .A1(n440), .B0(MinCost[5]), .B1(n668), .Y(n669) );
  OAI21XL U901 ( .A0(sum_cost[6]), .A1(n289), .B0(n669), .Y(n673) );
  NAND2X1 U902 ( .A(sum_cost[4]), .B(n287), .Y(n670) );
  OAI222XL U903 ( .A0(sum_cost[6]), .A1(n671), .B0(n289), .B1(n671), .C0(
        sum_cost[6]), .C1(n289), .Y(n672) );
  OAI21XL U904 ( .A0(n674), .A1(n673), .B0(n672), .Y(n675) );
  OAI211X1 U905 ( .A0(sum_cost[9]), .A1(n292), .B0(n676), .C0(n675), .Y(n677)
         );
  NAND2X1 U906 ( .A(n678), .B(n677), .Y(N321) );
endmodule

