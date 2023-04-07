/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Tue Mar 21 11:46:45 2023
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
  wire   N85, N86, N87, N88, N89, N90, n768, n769, n770, n771, n772, n773,
         n774, \cost_list[0][2] , \cost_list[0][1] , \cost_list[0][0] ,
         \cost_list[1][2] , \cost_list[1][1] , \cost_list[1][0] ,
         \cost_list[2][2] , \cost_list[2][1] , \cost_list[2][0] ,
         \cost_list[3][2] , \cost_list[3][1] , \cost_list[3][0] ,
         \cost_list[4][2] , \cost_list[4][1] , \cost_list[4][0] ,
         \cost_list[5][2] , \cost_list[5][1] , \cost_list[5][0] ,
         \cost_list[6][2] , \cost_list[6][1] , \cost_list[6][0] ,
         \cost_list[7][2] , \cost_list[7][1] , \cost_list[7][0] ,
         \sort_list[0][2] , \sort_list[0][1] , \sort_list[0][0] ,
         \sort_list[1][2] , \sort_list[1][1] , \sort_list[1][0] ,
         \sort_list[2][2] , \sort_list[2][1] , \sort_list[2][0] ,
         \sort_list[3][2] , \sort_list[3][1] , \sort_list[3][0] ,
         \sort_list[4][2] , \sort_list[4][1] , \sort_list[4][0] ,
         \sort_list[5][2] , \sort_list[5][1] , \sort_list[5][0] ,
         \sort_list[6][2] , \sort_list[6][1] , \sort_list[6][0] ,
         \sort_list[7][2] , \sort_list[7][1] , \sort_list[7][0] , N116, N117,
         N118, N246, N259, N260, N261, N276, N277, N278, N348, N349, N350,
         N351, N353, N354, N355, N356, N357, N358, N359, N360, N361, N362,
         N375, N376, n90, n117, n118, n120, n121, n122, n125, n126, n127, n128,
         n129, n132, n133, n135, n137, n139, n142, n143, n144, n145, n146,
         n147, n149, n150, n151, n152, n154, n157, n158, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n171, n173, n174, n175, n176,
         n178, n179, n180, n181, n182, n183, n184, n186, n188, n190, n191,
         n192, n194, n195, n196, n197, n198, n199, n201, n202, n204, n206,
         n207, n208, n209, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n238, n239, n241, n242, n244,
         n245, n246, n247, n248, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n263, n266, n267, n270, n271, n272,
         n274, n275, n276, n277, n278, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n293, n295, n296, n297, n300, n301, n302, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n364, n365,
         n366, n367, n368, n370, n371, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n398, n399, n400, n401, n402, n403, n404, n405,
         n406, n407, n408, n409, n410, n411, n412, n413, n414, n415, n416,
         n417, n418, n419, n420, n421, n422, n423, n424, n429, n430, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466,
         n467, n468, n469, n470, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n571, n572, n573, n574, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612,
         n613, n614, n615, n616, n617, n618, n619, n622, n623, n624, n625,
         n626, n627, n628, n629, n630, n631, n632, n633, n634, n635, n636,
         n637, n638, n639, n640, n641, n642, n643, n644, n645, n646, n647,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n677, n678, n679, n680,
         n681, n682, n683, n684, n685, n686, n687, n688, n689, n690, n691,
         n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, n702,
         n703, n704, n705, n706, n707, n708, n709, n710, n711, n712, n713,
         n714, n715, n716, n717, n718, n719, n720, n721, n722, n723, n724,
         n725, n726, n727, n728, n729, n730, n731, n732, n733, n734, n735,
         n736, n737, n738, n739, n740, n741, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763;
  wire   [9:0] cost_sum;

  OAI211X2 U308 ( .A0(n352), .A1(n746), .B0(n489), .C0(n354), .Y(n307) );
  OAI211X2 U343 ( .A0(n744), .A1(n380), .B0(n381), .C0(n382), .Y(n300) );
  JAM_DW01_add_0 add_208_S2 ( .A(cost_sum), .B({1'b0, 1'b0, 1'b0, Cost}), .CI(
        1'b0), .SUM({N362, N361, N360, N359, N358, N357, N356, N355, N354, 
        N353}) );
  TLATX1 \fp_index_reg[1]  ( .G(N246), .D(N260), .Q(N89), .QN(n422) );
  DFFRX1 \cost_sum_reg[9]  ( .D(n519), .CK(CLK), .RN(n597), .Q(cost_sum[9]), 
        .QN(n493) );
  DFFRX1 \cost_sum_reg[6]  ( .D(n522), .CK(CLK), .RN(n596), .Q(cost_sum[6]), 
        .QN(n496) );
  DFFRX1 \cost_sum_reg[8]  ( .D(n520), .CK(CLK), .RN(n597), .Q(cost_sum[8]), 
        .QN(n494) );
  DFFRX1 \cost_sum_reg[7]  ( .D(n521), .CK(CLK), .RN(n597), .Q(cost_sum[7]), 
        .QN(n495) );
  DFFSX1 \cost_list_reg[2][1]  ( .D(n468), .CK(CLK), .SN(n595), .Q(
        \cost_list[2][1] ), .QN(n443) );
  DFFSX1 \cost_list_reg[3][1]  ( .D(n466), .CK(CLK), .SN(n596), .Q(
        \cost_list[3][1] ), .QN(n441) );
  DFFRX1 \cost_list_reg[2][2]  ( .D(n474), .CK(CLK), .RN(n598), .Q(
        \cost_list[2][2] ), .QN(n449) );
  DFFRX1 \cost_list_reg[3][2]  ( .D(n472), .CK(CLK), .RN(n595), .Q(
        \cost_list[3][2] ), .QN(n447) );
  DFFRX1 \cost_sum_reg[4]  ( .D(n524), .CK(CLK), .RN(n596), .Q(cost_sum[4]), 
        .QN(n498) );
  DFFRX1 \cost_sum_reg[5]  ( .D(n523), .CK(CLK), .RN(n596), .Q(cost_sum[5]), 
        .QN(n497) );
  DFFRX1 \cost_sum_reg[3]  ( .D(n525), .CK(CLK), .RN(n596), .Q(cost_sum[3]), 
        .QN(n499) );
  DFFRX1 \cost_sum_reg[2]  ( .D(n526), .CK(CLK), .RN(n596), .Q(cost_sum[2]), 
        .QN(n500) );
  DFFRX1 \cost_sum_reg[1]  ( .D(n527), .CK(CLK), .RN(n596), .Q(cost_sum[1]), 
        .QN(n501) );
  DFFSX1 \cost_list_reg[1][0]  ( .D(n479), .CK(CLK), .SN(n598), .Q(
        \cost_list[1][0] ), .QN(n454) );
  DFFSX1 \cost_list_reg[5][0]  ( .D(n462), .CK(CLK), .SN(n598), .Q(
        \cost_list[5][0] ), .QN(n437) );
  DFFRX1 \cost_list_reg[0][0]  ( .D(n484), .CK(CLK), .RN(n595), .Q(
        \cost_list[0][0] ), .QN(n460) );
  DFFRX1 \cost_list_reg[0][1]  ( .D(n483), .CK(CLK), .RN(n595), .Q(
        \cost_list[0][1] ), .QN(n458) );
  DFFRX1 \cost_list_reg[0][2]  ( .D(n482), .CK(CLK), .RN(n595), .Q(
        \cost_list[0][2] ), .QN(n457) );
  DFFRX1 \cost_list_reg[4][0]  ( .D(n463), .CK(CLK), .RN(n596), .Q(
        \cost_list[4][0] ), .QN(n438) );
  DFFSX1 \cost_list_reg[7][0]  ( .D(n480), .CK(CLK), .SN(n598), .Q(
        \cost_list[7][0] ), .QN(n455) );
  DFFSX1 \cost_list_reg[3][0]  ( .D(n461), .CK(CLK), .SN(n598), .Q(
        \cost_list[3][0] ), .QN(n436) );
  DFFRX1 \cost_list_reg[1][1]  ( .D(n481), .CK(CLK), .RN(n595), .Q(
        \cost_list[1][1] ), .QN(n456) );
  DFFRX1 \cost_list_reg[1][2]  ( .D(n475), .CK(CLK), .RN(n598), .Q(
        \cost_list[1][2] ), .QN(n450) );
  DFFRX1 \cost_list_reg[6][0]  ( .D(n465), .CK(CLK), .RN(n596), .Q(
        \cost_list[6][0] ), .QN(n440) );
  DFFRX1 \cost_list_reg[2][0]  ( .D(n464), .CK(CLK), .RN(n596), .Q(
        \cost_list[2][0] ), .QN(n439) );
  DFFRX1 \c_state_reg[1]  ( .D(n556), .CK(CLK), .RN(n595), .QN(n486) );
  DFFRX1 \cost_sum_reg[0]  ( .D(n528), .CK(CLK), .RN(n596), .Q(cost_sum[0]), 
        .QN(n502) );
  DFFRX1 \c_state_reg[0]  ( .D(n555), .CK(CLK), .RN(n595), .QN(n459) );
  DFFSX1 \cost_list_reg[6][2]  ( .D(n478), .CK(CLK), .SN(n598), .Q(
        \cost_list[6][2] ), .QN(n453) );
  DFFSX1 \cost_list_reg[6][1]  ( .D(n471), .CK(CLK), .SN(n598), .Q(
        \cost_list[6][1] ), .QN(n446) );
  DFFSX1 \cost_list_reg[7][2]  ( .D(n476), .CK(CLK), .SN(n598), .Q(
        \cost_list[7][2] ), .QN(n451) );
  DFFSX1 \cost_list_reg[7][1]  ( .D(n469), .CK(CLK), .SN(n595), .Q(
        \cost_list[7][1] ), .QN(n444) );
  DFFSX1 \cost_list_reg[4][2]  ( .D(n477), .CK(CLK), .SN(n598), .Q(
        \cost_list[4][2] ), .QN(n452) );
  DFFSX1 \cost_list_reg[5][2]  ( .D(n473), .CK(CLK), .SN(n598), .Q(
        \cost_list[5][2] ), .QN(n448) );
  DFFRX1 \cost_list_reg[4][1]  ( .D(n470), .CK(CLK), .RN(n595), .Q(
        \cost_list[4][1] ), .QN(n445) );
  DFFRX1 \cost_list_reg[5][1]  ( .D(n467), .CK(CLK), .RN(n598), .Q(
        \cost_list[5][1] ), .QN(n442) );
  TLATX1 \fpr_index_reg[1]  ( .G(N351), .D(N349), .Q(N86), .QN(n491) );
  TLATX1 \fpr_index_reg[0]  ( .G(N351), .D(N348), .Q(N85), .QN(n492) );
  TLATX1 \fp_index_reg[0]  ( .G(N246), .D(N259), .Q(N88), .QN(n490) );
  TLATX1 \fpr_index_reg[2]  ( .G(N351), .D(N350), .Q(N87), .QN(n423) );
  DFFSX1 \MinCost_reg[2]  ( .D(n515), .CK(CLK), .SN(n597), .QN(n683) );
  DFFSX1 \MinCost_reg[4]  ( .D(n513), .CK(CLK), .SN(n597), .Q(n771), .QN(n429)
         );
  DFFSX1 \MinCost_reg[8]  ( .D(n509), .CK(CLK), .SN(n596), .Q(n769), .QN(n433)
         );
  DFFSX1 \MinCost_reg[3]  ( .D(n514), .CK(CLK), .SN(n597), .Q(n772), .QN(n684)
         );
  DFFSX1 \MinCost_reg[1]  ( .D(n516), .CK(CLK), .SN(n597), .Q(n773), .QN(n682)
         );
  DFFSX1 \MinCost_reg[0]  ( .D(n518), .CK(CLK), .SN(n598), .Q(n774), .QN(n424)
         );
  DFFSX1 \MinCost_reg[9]  ( .D(n517), .CK(CLK), .SN(n597), .QN(n681) );
  DFFSX1 \MinCost_reg[6]  ( .D(n511), .CK(CLK), .SN(n595), .QN(n685) );
  DFFSX1 \MinCost_reg[7]  ( .D(n510), .CK(CLK), .SN(n596), .QN(n686) );
  DFFRX2 \cnt_idx_reg[1]  ( .D(n552), .CK(CLK), .RN(n595), .Q(n558), .QN(n421)
         );
  DFFRX1 \MatchCount_reg[1]  ( .D(n507), .CK(CLK), .RN(n597), .QN(n504) );
  DFFRX2 \cnt_idx_reg[0]  ( .D(n553), .CK(CLK), .RN(n595), .Q(n559), .QN(n488)
         );
  DFFRX1 \MatchCount_reg[2]  ( .D(n506), .CK(CLK), .RN(n597), .QN(n503) );
  DFFRX1 \MatchCount_reg[0]  ( .D(n508), .CK(CLK), .RN(n597), .QN(n434) );
  DFFRX1 \MatchCount_reg[3]  ( .D(n505), .CK(CLK), .RN(n597), .QN(n435) );
  DFFSX1 \MinCost_reg[5]  ( .D(n512), .CK(CLK), .SN(n597), .Q(n770), .QN(n430)
         );
  DFFRX1 \cnt_idx_reg[2]  ( .D(n554), .CK(CLK), .RN(n689), .Q(n623), .QN(n487)
         );
  DFFSX1 \sort_list_reg[1][0]  ( .D(n532), .CK(CLK), .SN(n689), .Q(
        \sort_list[1][0] ), .QN(n742) );
  DFFSX1 \sort_list_reg[6][2]  ( .D(n545), .CK(CLK), .SN(n689), .Q(
        \sort_list[6][2] ) );
  DFFSX1 \sort_list_reg[6][1]  ( .D(n546), .CK(CLK), .SN(n689), .Q(
        \sort_list[6][1] ) );
  DFFSX1 \sort_list_reg[5][2]  ( .D(n542), .CK(CLK), .SN(n689), .Q(
        \sort_list[5][2] ) );
  DFFRX1 \sort_list_reg[4][0]  ( .D(n541), .CK(CLK), .RN(n689), .Q(
        \sort_list[4][0] ), .QN(n760) );
  DFFRX1 \sort_list_reg[2][0]  ( .D(n535), .CK(CLK), .RN(n689), .Q(
        \sort_list[2][0] ), .QN(n759) );
  DFFSX1 \sort_list_reg[3][0]  ( .D(n538), .CK(CLK), .SN(n689), .Q(
        \sort_list[3][0] ), .QN(n762) );
  DFFRXL \sort_list_reg[0][0]  ( .D(n529), .CK(CLK), .RN(n689), .Q(
        \sort_list[0][0] ), .QN(n718) );
  DFFRXL \sort_list_reg[0][2]  ( .D(n530), .CK(CLK), .RN(n689), .Q(
        \sort_list[0][2] ), .QN(n720) );
  DFFRXL \sort_list_reg[0][1]  ( .D(n557), .CK(CLK), .RN(n689), .Q(
        \sort_list[0][1] ), .QN(n722) );
  DFFRXL \sort_list_reg[6][0]  ( .D(n547), .CK(CLK), .RN(n689), .Q(
        \sort_list[6][0] ) );
  DFFRXL \sort_list_reg[4][1]  ( .D(n540), .CK(CLK), .RN(n689), .Q(
        \sort_list[4][1] ) );
  DFFRXL \sort_list_reg[2][2]  ( .D(n533), .CK(CLK), .RN(n689), .Q(
        \sort_list[2][2] ) );
  DFFRXL \sort_list_reg[3][2]  ( .D(n536), .CK(CLK), .RN(n689), .Q(
        \sort_list[3][2] ) );
  DFFRX2 \sort_list_reg[5][1]  ( .D(n543), .CK(CLK), .RN(n689), .Q(
        \sort_list[5][1] ), .QN(n756) );
  DFFRX2 \sort_list_reg[1][2]  ( .D(n531), .CK(CLK), .RN(n689), .Q(
        \sort_list[1][2] ), .QN(n748) );
  DFFSX2 \sort_list_reg[2][1]  ( .D(n534), .CK(CLK), .SN(n689), .Q(
        \sort_list[2][1] ), .QN(n755) );
  DFFSX2 \sort_list_reg[7][1]  ( .D(n549), .CK(CLK), .SN(n689), .Q(
        \sort_list[7][1] ), .QN(n754) );
  DFFRX1 \sort_list_reg[1][1]  ( .D(n551), .CK(CLK), .RN(n689), .Q(
        \sort_list[1][1] ), .QN(n737) );
  DFFSX2 \sort_list_reg[4][2]  ( .D(n539), .CK(CLK), .SN(n689), .Q(
        \sort_list[4][2] ), .QN(n746) );
  DFFSX2 \sort_list_reg[3][1]  ( .D(n537), .CK(CLK), .SN(n689), .Q(
        \sort_list[3][1] ), .QN(n757) );
  DFFSX2 \sort_list_reg[7][0]  ( .D(n550), .CK(CLK), .SN(n689), .Q(
        \sort_list[7][0] ), .QN(n741) );
  DFFSX2 \sort_list_reg[7][2]  ( .D(n548), .CK(CLK), .SN(n689), .Q(
        \sort_list[7][2] ), .QN(n747) );
  DFFSX2 \sort_list_reg[5][0]  ( .D(n544), .CK(CLK), .SN(n689), .Q(
        \sort_list[5][0] ), .QN(n761) );
  TLATX2 \fp_index_reg[2]  ( .G(N246), .D(N261), .Q(N90), .QN(n489) );
  OAI211X1 U423 ( .A0(n732), .A1(n144), .B0(n263), .C0(n209), .Y(n242) );
  OAI22X2 U424 ( .A0(cost_sum[9]), .A1(n681), .B0(n687), .B1(n674), .Y(N375)
         );
  OR2X1 U425 ( .A(n486), .B(n459), .Y(n560) );
  OAI222XL U426 ( .A0(n747), .A1(n228), .B0(n746), .B1(n730), .C0(n749), .C1(
        n220), .Y(n223) );
  OAI211XL U427 ( .A0(n591), .A1(n757), .B0(n762), .C0(\sort_list[4][0] ), .Y(
        n413) );
  NAND3XL U428 ( .A(n754), .B(n747), .C(n741), .Y(n289) );
  OAI222XL U429 ( .A0(n754), .A1(n228), .B0(n753), .B1(n730), .C0(n755), .C1(
        n220), .Y(n230) );
  AOI211XL U430 ( .A0(\sort_list[1][1] ), .A1(n755), .B0(n759), .C0(
        \sort_list[1][0] ), .Y(n418) );
  NOR4XL U431 ( .A(n285), .B(n737), .C(n749), .D(n748), .Y(n284) );
  INVX6 U432 ( .A(RST), .Y(n689) );
  BUFX12 U433 ( .A(n770), .Y(MinCost[5]) );
  INVX12 U434 ( .A(n435), .Y(MatchCount[3]) );
  INVX16 U435 ( .A(n434), .Y(MatchCount[0]) );
  INVX16 U436 ( .A(n503), .Y(MatchCount[2]) );
  INVX16 U437 ( .A(n488), .Y(W[0]) );
  INVX16 U438 ( .A(n504), .Y(MatchCount[1]) );
  INVX12 U439 ( .A(n421), .Y(W[1]) );
  INVX12 U440 ( .A(n560), .Y(Valid) );
  INVX12 U441 ( .A(n686), .Y(MinCost[7]) );
  INVX12 U442 ( .A(n685), .Y(MinCost[6]) );
  INVX12 U443 ( .A(n681), .Y(MinCost[9]) );
  BUFX12 U444 ( .A(n774), .Y(MinCost[0]) );
  NOR2BXL U445 ( .AN(n774), .B(cost_sum[0]), .Y(n664) );
  INVX12 U446 ( .A(n682), .Y(MinCost[1]) );
  AO21XL U447 ( .A0(n501), .A1(n664), .B0(n773), .Y(n663) );
  INVX12 U448 ( .A(n684), .Y(MinCost[3]) );
  NOR2BXL U449 ( .AN(cost_sum[3]), .B(n772), .Y(n678) );
  BUFX12 U450 ( .A(n769), .Y(MinCost[8]) );
  AOI32XL U451 ( .A0(n673), .A1(n688), .A2(n672), .B0(n769), .B1(n494), .Y(
        n674) );
  BUFX12 U452 ( .A(n771), .Y(MinCost[4]) );
  NOR2XL U453 ( .A(n498), .B(n771), .Y(n677) );
  CLKINVX1 U454 ( .A(N278), .Y(n711) );
  OAI22X2 U455 ( .A0(n489), .A1(n645), .B0(N90), .B1(n644), .Y(N278) );
  INVX3 U456 ( .A(n126), .Y(n723) );
  CLKINVX1 U457 ( .A(n120), .Y(n763) );
  NAND2X1 U458 ( .A(n129), .B(MatchCount[0]), .Y(n122) );
  OA21XL U459 ( .A0(n120), .A1(MatchCount[1]), .B0(n125), .Y(n121) );
  NOR2XL U460 ( .A(n497), .B(n770), .Y(n669) );
  NOR2XL U461 ( .A(n494), .B(n769), .Y(n662) );
  NAND2X1 U462 ( .A(cost_sum[2]), .B(n683), .Y(n675) );
  OAI211XL U463 ( .A0(n591), .A1(n721), .B0(n711), .C0(\sort_list[4][0] ), .Y(
        n367) );
  OAI211XL U464 ( .A0(\sort_list[2][1] ), .A1(n721), .B0(n711), .C0(
        \sort_list[2][0] ), .Y(n340) );
  OAI211XL U465 ( .A0(\sort_list[3][1] ), .A1(n721), .B0(n711), .C0(
        \sort_list[3][0] ), .Y(n353) );
  NAND2XL U466 ( .A(n126), .B(n122), .Y(n125) );
  NAND3BXL U467 ( .AN(n122), .B(n763), .C(MatchCount[1]), .Y(n117) );
  CLKBUFX3 U468 ( .A(n178), .Y(n584) );
  NAND2X1 U469 ( .A(N118), .B(n725), .Y(n151) );
  NAND2X1 U470 ( .A(N117), .B(n725), .Y(n163) );
  NAND2X1 U471 ( .A(N116), .B(n725), .Y(n147) );
  NOR2X1 U472 ( .A(n186), .B(n144), .Y(n191) );
  NAND2X1 U473 ( .A(n581), .B(n725), .Y(n162) );
  NAND2X1 U474 ( .A(n582), .B(n725), .Y(n146) );
  AOI2BB1X1 U475 ( .A0N(n293), .A1N(n734), .B0(n184), .Y(n139) );
  NAND2X1 U476 ( .A(n219), .B(n728), .Y(n228) );
  NAND2X1 U477 ( .A(n220), .B(n271), .Y(n142) );
  AO22X1 U478 ( .A0(n728), .A1(n238), .B0(n725), .B1(n239), .Y(n221) );
  OAI22XL U479 ( .A0(n752), .A1(n228), .B0(n757), .B1(n730), .Y(n254) );
  CLKINVX1 U480 ( .A(n583), .Y(n724) );
  OAI22XL U481 ( .A0(n713), .A1(n364), .B0(n756), .B1(n302), .Y(n357) );
  OAI32XL U482 ( .A0(MatchCount[1]), .A1(n120), .A2(n122), .B0(n504), .B1(n125), .Y(n507) );
  NOR2BXL U483 ( .AN(cost_sum[0]), .B(n774), .Y(n659) );
  OR4X2 U484 ( .A(n370), .B(n371), .C(n571), .D(n572), .Y(n302) );
  OA21XL U485 ( .A0(n582), .A1(n750), .B0(n375), .Y(n571) );
  AND3X2 U486 ( .A(n374), .B(n364), .C(\sort_list[5][1] ), .Y(n572) );
  OAI22XL U487 ( .A0(n592), .A1(n746), .B0(n412), .B1(n281), .Y(n404) );
  OAI21XL U488 ( .A0(n589), .A1(n747), .B0(n406), .Y(n401) );
  OAI21XL U489 ( .A0(n588), .A1(n744), .B0(n419), .Y(n398) );
  OAI21XL U490 ( .A0(\sort_list[4][2] ), .A1(n750), .B0(n409), .Y(n400) );
  NOR3X1 U491 ( .A(n490), .B(n489), .C(n733), .Y(n219) );
  NOR3X1 U492 ( .A(n733), .B(n490), .C(N90), .Y(n261) );
  NAND3X1 U493 ( .A(n492), .B(n739), .C(n491), .Y(n194) );
  NAND3X1 U494 ( .A(n492), .B(n736), .C(n423), .Y(n158) );
  NAND3X1 U495 ( .A(n697), .B(n736), .C(n423), .Y(n176) );
  NAND3X1 U496 ( .A(n736), .B(n739), .C(n492), .Y(n227) );
  CLKINVX1 U497 ( .A(n491), .Y(n736) );
  CLKINVX1 U498 ( .A(n423), .Y(n739) );
  CLKINVX1 U499 ( .A(n492), .Y(n697) );
  AOI2BB1XL U500 ( .A0N(n763), .A1N(N375), .B0(n600), .Y(n573) );
  AOI2BB1XL U501 ( .A0N(n763), .A1N(N375), .B0(n600), .Y(n574) );
  INVX12 U502 ( .A(n683), .Y(MinCost[2]) );
  NOR2X1 U503 ( .A(n727), .B(n726), .Y(n166) );
  INVX3 U504 ( .A(n220), .Y(n727) );
  INVX3 U505 ( .A(n601), .Y(n600) );
  NAND2X1 U506 ( .A(n574), .B(n120), .Y(n126) );
  NAND2X2 U507 ( .A(n734), .B(n728), .Y(n220) );
  OAI22XL U508 ( .A0(n695), .A1(n151), .B0(n758), .B1(n228), .Y(n259) );
  OAI22XL U509 ( .A0(n695), .A1(n163), .B0(n162), .B1(n250), .Y(n252) );
  OAI22XL U510 ( .A0(n695), .A1(n147), .B0(n146), .B1(n250), .Y(n245) );
  CLKINVX1 U511 ( .A(n171), .Y(n691) );
  INVX3 U512 ( .A(n174), .Y(n730) );
  CLKINVX1 U513 ( .A(n242), .Y(n694) );
  OAI22XL U514 ( .A0(n744), .A1(n228), .B0(n751), .B1(n730), .Y(n247) );
  NAND2BX1 U515 ( .AN(n293), .B(n139), .Y(n137) );
  NAND2X1 U516 ( .A(n293), .B(n139), .Y(n135) );
  INVX3 U517 ( .A(n191), .Y(n729) );
  CLKINVX1 U518 ( .A(n204), .Y(n692) );
  CLKINVX1 U519 ( .A(n584), .Y(n726) );
  CLKINVX1 U520 ( .A(n152), .Y(n699) );
  CLKBUFX3 U521 ( .A(n603), .Y(n601) );
  NAND2X1 U522 ( .A(n275), .B(n724), .Y(n274) );
  CLKBUFX3 U523 ( .A(n603), .Y(n602) );
  CLKBUFX3 U524 ( .A(n132), .Y(n585) );
  NAND2X1 U525 ( .A(n724), .B(n600), .Y(n132) );
  OR2X1 U526 ( .A(n275), .B(n724), .Y(n555) );
  OAI2BB2X1 U527 ( .B0(n744), .B1(n300), .A0N(n380), .A1N(n300), .Y(n368) );
  CLKINVX1 U528 ( .A(n300), .Y(n715) );
  CLKINVX1 U529 ( .A(n309), .Y(n707) );
  CLKINVX1 U530 ( .A(n336), .Y(n708) );
  CLKINVX1 U531 ( .A(n250), .Y(n695) );
  NAND2X1 U532 ( .A(n750), .B(n368), .Y(n374) );
  NAND2X1 U533 ( .A(n744), .B(n380), .Y(n384) );
  CLKINVX1 U534 ( .A(n315), .Y(n709) );
  CLKINVX1 U535 ( .A(n357), .Y(n712) );
  CLKINVX1 U536 ( .A(n379), .Y(n716) );
  CLKBUFX3 U537 ( .A(n689), .Y(n598) );
  CLKBUFX3 U538 ( .A(n689), .Y(n597) );
  CLKBUFX3 U539 ( .A(n689), .Y(n596) );
  CLKBUFX3 U540 ( .A(n689), .Y(n595) );
  NAND3X1 U541 ( .A(n745), .B(n740), .C(n743), .Y(N261) );
  AOI2BB1X1 U542 ( .A0N(n763), .A1N(N375), .B0(n600), .Y(n129) );
  NAND2BX1 U543 ( .AN(N375), .B(N376), .Y(n120) );
  CLKBUFX3 U544 ( .A(n127), .Y(n586) );
  NAND2XL U545 ( .A(N375), .B(n574), .Y(n127) );
  NAND2X1 U546 ( .A(n586), .B(n128), .Y(n508) );
  OAI21XL U547 ( .A0(n573), .A1(MatchCount[0]), .B0(n122), .Y(n128) );
  NAND2X1 U548 ( .A(N278), .B(n725), .Y(n150) );
  OAI222XL U549 ( .A0(n135), .A1(n711), .B0(n137), .B1(n703), .C0(n139), .C1(
        n718), .Y(n529) );
  CLKINVX1 U550 ( .A(N118), .Y(n703) );
  OAI22XL U551 ( .A0(n150), .A1(n250), .B0(n762), .B1(n730), .Y(n258) );
  OAI22XL U552 ( .A0(n702), .A1(n151), .B0(n150), .B1(n227), .Y(n235) );
  OAI22XL U553 ( .A0(n741), .A1(n242), .B0(n694), .B1(n256), .Y(n550) );
  NOR4X1 U554 ( .A(n257), .B(n258), .C(n259), .D(n260), .Y(n256) );
  OAI22XL U555 ( .A0(n760), .A1(n729), .B0(n759), .B1(n584), .Y(n257) );
  OAI22XL U556 ( .A0(n742), .A1(n220), .B0(n761), .B1(n209), .Y(n260) );
  OAI21XL U557 ( .A0(n758), .A1(n221), .B0(n233), .Y(n547) );
  OAI31XL U558 ( .A0(n234), .A1(n235), .A2(n236), .B0(n221), .Y(n233) );
  OAI22XL U559 ( .A0(n761), .A1(n729), .B0(n762), .B1(n584), .Y(n236) );
  OAI222XL U560 ( .A0(n741), .A1(n228), .B0(n760), .B1(n730), .C0(n759), .C1(
        n220), .Y(n234) );
  OAI2BB2XL U561 ( .B0(n742), .B1(n142), .A0N(n142), .A1N(n149), .Y(n532) );
  OAI222XL U562 ( .A0(n144), .A1(n741), .B0(n150), .B1(n145), .C0(n151), .C1(
        n696), .Y(n149) );
  OAI211X1 U563 ( .A0(n183), .A1(n184), .B0(n730), .C0(n166), .Y(n171) );
  AND2X2 U564 ( .A(n186), .B(n176), .Y(n183) );
  OAI2BB2XL U565 ( .B0(n748), .B1(n142), .A0N(n142), .A1N(n143), .Y(n531) );
  OAI222XL U566 ( .A0(n144), .A1(n747), .B0(n145), .B1(n146), .C0(n147), .C1(
        n696), .Y(n143) );
  OAI222XL U567 ( .A0(n135), .A1(n721), .B0(n137), .B1(n704), .C0(n139), .C1(
        n722), .Y(n557) );
  INVXL U568 ( .A(N117), .Y(n704) );
  OAI222XL U569 ( .A0(n135), .A1(n719), .B0(n137), .B1(n705), .C0(n139), .C1(
        n720), .Y(n530) );
  INVXL U570 ( .A(N116), .Y(n705) );
  CLKINVX1 U571 ( .A(n582), .Y(n719) );
  CLKINVX1 U572 ( .A(n144), .Y(n728) );
  OAI22XL U573 ( .A0(n702), .A1(n163), .B0(n162), .B1(n227), .Y(n231) );
  OAI22XL U574 ( .A0(n702), .A1(n147), .B0(n146), .B1(n227), .Y(n224) );
  OAI22XL U575 ( .A0(n754), .A1(n242), .B0(n694), .B1(n251), .Y(n549) );
  NOR4X1 U576 ( .A(n252), .B(n253), .C(n254), .D(n255), .Y(n251) );
  OAI22XL U577 ( .A0(n753), .A1(n729), .B0(n755), .B1(n584), .Y(n253) );
  OAI22XL U578 ( .A0(n737), .A1(n220), .B0(n756), .B1(n209), .Y(n255) );
  OAI22XL U579 ( .A0(n747), .A1(n242), .B0(n694), .B1(n244), .Y(n548) );
  NOR4X1 U580 ( .A(n245), .B(n246), .C(n247), .D(n248), .Y(n244) );
  OAI22XL U581 ( .A0(n746), .A1(n729), .B0(n749), .B1(n584), .Y(n246) );
  OAI22XL U582 ( .A0(n748), .A1(n220), .B0(n750), .B1(n209), .Y(n248) );
  OAI22XL U583 ( .A0(n750), .A1(n204), .B0(n692), .B1(n206), .Y(n542) );
  AOI211X1 U584 ( .A0(n727), .A1(n592), .B0(n207), .C0(n208), .Y(n206) );
  OAI22XL U585 ( .A0(n747), .A1(n209), .B0(n744), .B1(n729), .Y(n208) );
  OAI222XL U586 ( .A0(n693), .A1(n147), .B0(n146), .B1(n211), .C0(n746), .C1(
        n584), .Y(n207) );
  OAI2BB2XL U587 ( .B0(n737), .B1(n142), .A0N(n142), .A1N(n270), .Y(n551) );
  OAI222XL U588 ( .A0(n144), .A1(n754), .B0(n162), .B1(n145), .C0(n163), .C1(
        n696), .Y(n270) );
  CLKINVX1 U589 ( .A(n581), .Y(n721) );
  OAI21XL U590 ( .A0(n752), .A1(n221), .B0(n229), .Y(n546) );
  OAI31XL U591 ( .A0(n230), .A1(n231), .A2(n232), .B0(n221), .Y(n229) );
  OAI22XL U592 ( .A0(n756), .A1(n729), .B0(n757), .B1(n584), .Y(n232) );
  OAI21XL U593 ( .A0(n744), .A1(n221), .B0(n222), .Y(n545) );
  OAI31XL U594 ( .A0(n223), .A1(n224), .A2(n225), .B0(n221), .Y(n222) );
  OAI22XL U595 ( .A0(n750), .A1(n729), .B0(n751), .B1(n584), .Y(n225) );
  CLKINVX1 U596 ( .A(n238), .Y(n732) );
  OAI21XL U597 ( .A0(n266), .A1(n695), .B0(n725), .Y(n263) );
  NOR2X2 U598 ( .A(n168), .B(n144), .Y(n174) );
  NAND3X2 U599 ( .A(n735), .B(N90), .C(n728), .Y(n209) );
  OAI21XL U600 ( .A0(n696), .A1(n261), .B0(n725), .Y(n271) );
  OAI21XL U601 ( .A0(n738), .A1(n241), .B0(n227), .Y(n239) );
  NAND4X1 U602 ( .A(n166), .B(n218), .C(n209), .D(n729), .Y(n204) );
  OAI21XL U603 ( .A0(n693), .A1(n219), .B0(n725), .Y(n218) );
  NAND2X1 U604 ( .A(n166), .B(n167), .Y(n152) );
  OAI2BB1X1 U605 ( .A0N(n158), .A1N(n168), .B0(n725), .Y(n167) );
  CLKINVX1 U606 ( .A(n188), .Y(n701) );
  INVX3 U607 ( .A(n184), .Y(n725) );
  NAND2X1 U608 ( .A(n261), .B(n728), .Y(n178) );
  CLKINVX1 U609 ( .A(n599), .Y(n603) );
  INVX3 U610 ( .A(n593), .Y(n749) );
  INVX3 U611 ( .A(n590), .Y(n758) );
  INVX3 U612 ( .A(n592), .Y(n751) );
  XOR2X1 U613 ( .A(n559), .B(n274), .Y(n553) );
  NOR2X1 U614 ( .A(n756), .B(n587), .Y(n282) );
  NAND2X1 U615 ( .A(n276), .B(W[2]), .Y(n275) );
  NOR3X1 U616 ( .A(n718), .B(n720), .C(n722), .Y(n283) );
  INVX3 U617 ( .A(n589), .Y(n744) );
  INVX3 U618 ( .A(n588), .Y(n750) );
  INVX3 U619 ( .A(n587), .Y(n752) );
  INVX3 U620 ( .A(n591), .Y(n753) );
  OAI21XL U621 ( .A0(n582), .A1(n744), .B0(n388), .Y(n381) );
  AOI31X1 U622 ( .A0(n717), .A1(n384), .A2(n385), .B0(n386), .Y(n382) );
  OAI22XL U623 ( .A0(n589), .A1(n719), .B0(n389), .B1(n390), .Y(n388) );
  AOI211XL U624 ( .A0(n581), .A1(n754), .B0(n741), .C0(N278), .Y(n393) );
  AOI211XL U625 ( .A0(n581), .A1(n752), .B0(n758), .C0(N278), .Y(n389) );
  OAI22X1 U626 ( .A0(n712), .A1(n710), .B0(n753), .B1(n307), .Y(n339) );
  NAND4X1 U627 ( .A(n329), .B(n330), .C(n331), .D(n332), .Y(n309) );
  NAND2X1 U628 ( .A(n333), .B(n582), .Y(n331) );
  OAI21XL U629 ( .A0(n333), .A1(n582), .B0(n749), .Y(n329) );
  OAI22XL U630 ( .A0(n334), .A1(n335), .B0(n593), .B1(n709), .Y(n330) );
  OAI2BB2X1 U631 ( .B0(n757), .B1(n336), .A0N(n339), .A1N(n336), .Y(n324) );
  AOI221XL U632 ( .A0(n592), .A1(n337), .B0(n738), .B1(n733), .C0(N90), .Y(
        n345) );
  NAND4X1 U633 ( .A(n342), .B(n343), .C(n344), .D(n345), .Y(n336) );
  NAND2X1 U634 ( .A(n346), .B(n582), .Y(n344) );
  OAI21XL U635 ( .A0(n346), .A1(n582), .B0(n751), .Y(n342) );
  OAI21XL U636 ( .A0(n592), .A1(n337), .B0(n347), .Y(n343) );
  AOI211X1 U637 ( .A0(n593), .A1(n709), .B0(N90), .C0(n733), .Y(n332) );
  CLKINVX1 U638 ( .A(n302), .Y(n713) );
  AOI2BB2X1 U639 ( .B0(n307), .B1(n714), .A0N(n760), .A1N(n307), .Y(n338) );
  AOI211X1 U640 ( .A0(n755), .A1(n324), .B0(n325), .C0(n759), .Y(n334) );
  OAI22XL U641 ( .A0(n588), .A1(n719), .B0(n376), .B1(n377), .Y(n375) );
  NOR2X1 U642 ( .A(n581), .B(n756), .Y(n377) );
  AOI211XL U643 ( .A0(n581), .A1(n756), .B0(n761), .C0(N278), .Y(n376) );
  NOR4X2 U644 ( .A(n724), .B(n559), .C(n623), .D(n558), .Y(N246) );
  NOR4X2 U645 ( .A(n724), .B(n296), .C(n622), .D(n558), .Y(N351) );
  OAI31XL U646 ( .A0(n297), .A1(n710), .A2(n706), .B0(n559), .Y(n296) );
  CLKINVX1 U647 ( .A(N350), .Y(n706) );
  NAND3X1 U648 ( .A(n300), .B(n301), .C(n302), .Y(n297) );
  OAI31XL U649 ( .A0(n398), .A1(n399), .A2(n400), .B0(n740), .Y(N260) );
  NOR3X1 U650 ( .A(n402), .B(n403), .C(n404), .Y(n399) );
  CLKINVX1 U651 ( .A(n307), .Y(n710) );
  OAI22XL U652 ( .A0(n762), .A1(n336), .B0(n338), .B1(n708), .Y(n325) );
  OAI31XL U653 ( .A0(n387), .A1(n758), .A2(n379), .B0(n241), .Y(n386) );
  OAI21XL U654 ( .A0(n587), .A1(n754), .B0(n384), .Y(n387) );
  NOR3X1 U655 ( .A(n736), .B(n697), .C(n739), .Y(n293) );
  NAND3X1 U656 ( .A(n736), .B(n739), .C(n697), .Y(n250) );
  NAND2X1 U657 ( .A(N90), .B(n733), .Y(n241) );
  AOI2BB1X1 U658 ( .A0N(n592), .A1N(n336), .B0(n337), .Y(n315) );
  NOR2X1 U659 ( .A(n749), .B(n592), .Y(n417) );
  NAND2X1 U660 ( .A(n327), .B(n748), .Y(n321) );
  OAI22XL U661 ( .A0(n707), .A1(n709), .B0(n749), .B1(n309), .Y(n327) );
  NAND2X1 U662 ( .A(n715), .B(n302), .Y(n341) );
  NOR3X1 U663 ( .A(n707), .B(n708), .C(n305), .Y(N350) );
  OAI21XL U664 ( .A0(n593), .A1(n309), .B0(n315), .Y(n314) );
  NAND4BX1 U665 ( .AN(n219), .B(n168), .C(n186), .D(n267), .Y(n238) );
  NOR2X1 U666 ( .A(n734), .B(n261), .Y(n267) );
  NAND2X1 U667 ( .A(n717), .B(n747), .Y(n380) );
  OA21XL U668 ( .A0(n588), .A1(n302), .B0(n368), .Y(n352) );
  CLKINVX1 U669 ( .A(n145), .Y(n696) );
  CLKINVX1 U670 ( .A(n227), .Y(n702) );
  CLKINVX1 U671 ( .A(n211), .Y(n693) );
  NAND2X1 U672 ( .A(n323), .B(n309), .Y(n319) );
  AO21X1 U673 ( .A0(n737), .A1(n324), .B0(n325), .Y(n323) );
  CLKINVX1 U674 ( .A(n158), .Y(n698) );
  CLKINVX1 U675 ( .A(n202), .Y(n735) );
  NAND2X1 U676 ( .A(n717), .B(n741), .Y(n379) );
  AOI21X1 U677 ( .A0(n743), .A1(n405), .B0(n401), .Y(N259) );
  OAI21XL U678 ( .A0(n408), .A1(n404), .B0(n745), .Y(n405) );
  AOI211X1 U679 ( .A0(n414), .A1(n415), .B0(n402), .C0(n403), .Y(n408) );
  NAND2X1 U680 ( .A(n593), .B(n748), .Y(n415) );
  CLKINVX1 U681 ( .A(n301), .Y(n717) );
  CLKINVX1 U682 ( .A(n295), .Y(n734) );
  NOR2X1 U683 ( .A(n305), .B(n306), .Y(N349) );
  AOI211X1 U684 ( .A0(n307), .A1(n302), .B0(n708), .C0(n707), .Y(n306) );
  CLKINVX1 U685 ( .A(n398), .Y(n743) );
  CLKINVX1 U686 ( .A(n400), .Y(n745) );
  CLKINVX1 U687 ( .A(n194), .Y(n700) );
  CLKINVX1 U688 ( .A(n176), .Y(n690) );
  CLKINVX1 U689 ( .A(n401), .Y(n740) );
  NOR2X1 U690 ( .A(n755), .B(n324), .Y(n335) );
  NOR2X1 U691 ( .A(n581), .B(n752), .Y(n390) );
  NAND2X1 U692 ( .A(n582), .B(n746), .Y(n365) );
  AO21X1 U693 ( .A0(n308), .A1(n309), .B0(n305), .Y(N348) );
  AO21X1 U694 ( .A0(n341), .A1(n307), .B0(n708), .Y(n308) );
  CLKINVX1 U695 ( .A(n676), .Y(n687) );
  CLKINVX1 U696 ( .A(n662), .Y(n688) );
  INVX12 U697 ( .A(n577), .Y(J[1]) );
  AOI2BB2X1 U698 ( .B0(n623), .B1(n578), .A0N(n623), .A1N(n606), .Y(n577) );
  INVX12 U699 ( .A(n579), .Y(J[2]) );
  AOI2BB2X1 U700 ( .B0(n623), .B1(n580), .A0N(n623), .A1N(n610), .Y(n579) );
  OAI32X1 U701 ( .A0(MatchCount[3]), .A1(n503), .A2(n117), .B0(n435), .B1(n118), .Y(n505) );
  OA21XL U702 ( .A0(MatchCount[2]), .A1(n120), .B0(n121), .Y(n118) );
  CLKINVX1 U703 ( .A(n607), .Y(n578) );
  CLKINVX1 U704 ( .A(n611), .Y(n580) );
  AND2X2 U705 ( .A(n488), .B(n421), .Y(n613) );
  CLKINVX1 U706 ( .A(n487), .Y(n622) );
  OAI22XL U707 ( .A0(n493), .A1(n586), .B0(n681), .B1(n723), .Y(n517) );
  OAI22XL U708 ( .A0(n501), .A1(n586), .B0(n682), .B1(n723), .Y(n516) );
  OAI22XL U709 ( .A0(n500), .A1(n586), .B0(n683), .B1(n723), .Y(n515) );
  OAI22XL U710 ( .A0(n499), .A1(n586), .B0(n684), .B1(n723), .Y(n514) );
  OAI22XL U711 ( .A0(n498), .A1(n586), .B0(n429), .B1(n723), .Y(n513) );
  OAI22XL U712 ( .A0(n497), .A1(n586), .B0(n430), .B1(n723), .Y(n512) );
  OAI22XL U713 ( .A0(n496), .A1(n586), .B0(n685), .B1(n723), .Y(n511) );
  OAI22XL U714 ( .A0(n495), .A1(n586), .B0(n686), .B1(n723), .Y(n510) );
  OAI22XL U715 ( .A0(n494), .A1(n586), .B0(n433), .B1(n723), .Y(n509) );
  OAI22XL U716 ( .A0(n502), .A1(n586), .B0(n424), .B1(n723), .Y(n518) );
  OAI22XL U717 ( .A0(n503), .A1(n121), .B0(n117), .B1(MatchCount[2]), .Y(n506)
         );
  OAI2BB2XL U718 ( .B0(n493), .B1(n585), .A0N(N362), .A1N(n583), .Y(n519) );
  OAI2BB2XL U719 ( .B0(n494), .B1(n585), .A0N(N361), .A1N(n583), .Y(n520) );
  OAI2BB2XL U720 ( .B0(n495), .B1(n585), .A0N(N360), .A1N(n583), .Y(n521) );
  BUFX12 U721 ( .A(n623), .Y(W[2]) );
  OAI22XL U722 ( .A0(n760), .A1(n188), .B0(n701), .B1(n197), .Y(n541) );
  AOI221XL U723 ( .A0(n191), .A1(\sort_list[7][0] ), .B0(n174), .B1(n590), 
        .C0(n198), .Y(n197) );
  OAI222XL U724 ( .A0(n700), .A1(n151), .B0(n150), .B1(n194), .C0(n761), .C1(
        n584), .Y(n198) );
  OAI2BB2XL U725 ( .B0(n496), .B1(n585), .A0N(N359), .A1N(n583), .Y(n522) );
  OAI2BB2XL U726 ( .B0(n497), .B1(n585), .A0N(N358), .A1N(n583), .Y(n523) );
  OAI2BB2XL U727 ( .B0(n498), .B1(n585), .A0N(N357), .A1N(n583), .Y(n524) );
  OAI2BB2XL U728 ( .B0(n499), .B1(n585), .A0N(N356), .A1N(n583), .Y(n525) );
  OAI2BB2XL U729 ( .B0(n500), .B1(n585), .A0N(N355), .A1N(n583), .Y(n526) );
  OAI22XL U730 ( .A0(n762), .A1(n171), .B0(n691), .B1(n181), .Y(n538) );
  AOI221XL U731 ( .A0(n174), .A1(\sort_list[7][0] ), .B0(n727), .B1(
        \sort_list[5][0] ), .C0(n182), .Y(n181) );
  OAI222XL U732 ( .A0(n150), .A1(n176), .B0(n690), .B1(n151), .C0(n758), .C1(
        n584), .Y(n182) );
  OAI22XL U733 ( .A0(n761), .A1(n204), .B0(n692), .B1(n215), .Y(n544) );
  AOI211X1 U734 ( .A0(n727), .A1(\sort_list[3][0] ), .B0(n216), .C0(n217), .Y(
        n215) );
  OAI22XL U735 ( .A0(n741), .A1(n209), .B0(n758), .B1(n729), .Y(n217) );
  OAI222XL U736 ( .A0(n693), .A1(n151), .B0(n150), .B1(n211), .C0(n760), .C1(
        n584), .Y(n216) );
  OAI22XL U737 ( .A0(n759), .A1(n152), .B0(n699), .B1(n164), .Y(n535) );
  AOI221XL U738 ( .A0(n726), .A1(\sort_list[7][0] ), .B0(n727), .B1(n590), 
        .C0(n165), .Y(n164) );
  OAI22XL U739 ( .A0(n150), .A1(n158), .B0(n698), .B1(n151), .Y(n165) );
  OAI2BB2XL U740 ( .B0(n501), .B1(n585), .A0N(N354), .A1N(n583), .Y(n527) );
  OAI2BB2XL U741 ( .B0(n502), .B1(n585), .A0N(N353), .A1N(n583), .Y(n528) );
  CLKBUFX3 U742 ( .A(\sort_list[6][0] ), .Y(n590) );
  OAI22XL U743 ( .A0(n751), .A1(n171), .B0(n691), .B1(n173), .Y(n536) );
  AOI221XL U744 ( .A0(n174), .A1(\sort_list[7][2] ), .B0(n727), .B1(n588), 
        .C0(n175), .Y(n173) );
  OAI222XL U745 ( .A0(n146), .A1(n176), .B0(n690), .B1(n147), .C0(n744), .C1(
        n584), .Y(n175) );
  OAI22XL U746 ( .A0(n746), .A1(n188), .B0(n701), .B1(n190), .Y(n539) );
  AOI221XL U747 ( .A0(n191), .A1(\sort_list[7][2] ), .B0(n174), .B1(n589), 
        .C0(n192), .Y(n190) );
  OAI222XL U748 ( .A0(n700), .A1(n147), .B0(n146), .B1(n194), .C0(n750), .C1(
        n584), .Y(n192) );
  NAND3X2 U749 ( .A(n487), .B(n583), .C(n276), .Y(n144) );
  OAI22XL U750 ( .A0(n749), .A1(n152), .B0(n699), .B1(n154), .Y(n533) );
  AOI221XL U751 ( .A0(n726), .A1(\sort_list[7][2] ), .B0(n727), .B1(n589), 
        .C0(n157), .Y(n154) );
  OAI22XL U752 ( .A0(n146), .A1(n158), .B0(n698), .B1(n147), .Y(n157) );
  OAI22XL U753 ( .A0(n753), .A1(n188), .B0(n701), .B1(n195), .Y(n540) );
  AOI221XL U754 ( .A0(n191), .A1(\sort_list[7][1] ), .B0(n174), .B1(n587), 
        .C0(n196), .Y(n195) );
  OAI222XL U755 ( .A0(n700), .A1(n163), .B0(n162), .B1(n194), .C0(n756), .C1(
        n584), .Y(n196) );
  NOR2X1 U756 ( .A(n421), .B(n488), .Y(n276) );
  OAI211X1 U757 ( .A0(n277), .A1(n278), .B0(n555), .C0(n560), .Y(n556) );
  NAND4X1 U758 ( .A(n286), .B(\sort_list[4][0] ), .C(n287), .D(n288), .Y(n277)
         );
  NAND4X1 U759 ( .A(n281), .B(n282), .C(n283), .D(n284), .Y(n278) );
  OAI22XL U760 ( .A0(n757), .A1(n171), .B0(n691), .B1(n179), .Y(n537) );
  AOI221XL U761 ( .A0(n174), .A1(\sort_list[7][1] ), .B0(n727), .B1(
        \sort_list[5][1] ), .C0(n180), .Y(n179) );
  OAI222XL U762 ( .A0(n162), .A1(n176), .B0(n690), .B1(n163), .C0(n752), .C1(
        n584), .Y(n180) );
  OAI22XL U763 ( .A0(n755), .A1(n152), .B0(n699), .B1(n160), .Y(n534) );
  AOI221XL U764 ( .A0(n726), .A1(\sort_list[7][1] ), .B0(n727), .B1(n587), 
        .C0(n161), .Y(n160) );
  OAI22XL U765 ( .A0(n158), .A1(n162), .B0(n698), .B1(n163), .Y(n161) );
  OAI22XL U766 ( .A0(n756), .A1(n204), .B0(n692), .B1(n212), .Y(n543) );
  AOI211X1 U767 ( .A0(n727), .A1(\sort_list[3][1] ), .B0(n213), .C0(n214), .Y(
        n212) );
  OAI22XL U768 ( .A0(n754), .A1(n209), .B0(n752), .B1(n729), .Y(n214) );
  OAI222XL U769 ( .A0(n693), .A1(n163), .B0(n162), .B1(n211), .C0(n753), .C1(
        n584), .Y(n213) );
  CLKBUFX3 U770 ( .A(N277), .Y(n581) );
  CLKBUFX3 U771 ( .A(N276), .Y(n582) );
  CLKINVX1 U772 ( .A(n486), .Y(n731) );
  CLKBUFX3 U773 ( .A(\sort_list[4][1] ), .Y(n591) );
  CLKBUFX3 U774 ( .A(n133), .Y(n583) );
  NOR2X1 U775 ( .A(n731), .B(n459), .Y(n133) );
  CLKBUFX3 U776 ( .A(\sort_list[6][2] ), .Y(n589) );
  CLKBUFX3 U777 ( .A(\sort_list[5][2] ), .Y(n588) );
  CLKBUFX3 U778 ( .A(\sort_list[6][1] ), .Y(n587) );
  CLKBUFX3 U779 ( .A(\sort_list[2][2] ), .Y(n593) );
  CLKBUFX3 U780 ( .A(\sort_list[3][2] ), .Y(n592) );
  NAND4X1 U781 ( .A(n487), .B(n488), .C(n583), .D(n558), .Y(n184) );
  NAND4X1 U782 ( .A(n199), .B(n729), .C(n730), .D(n584), .Y(n188) );
  NAND2X1 U783 ( .A(n725), .B(n201), .Y(n199) );
  OAI21XL U784 ( .A0(n489), .A1(n202), .B0(n194), .Y(n201) );
  CLKBUFX3 U785 ( .A(n90), .Y(n599) );
  NAND2X1 U786 ( .A(n459), .B(n731), .Y(n90) );
  NAND3X1 U787 ( .A(n590), .B(\sort_list[2][0] ), .C(n591), .Y(n285) );
  NOR4X1 U788 ( .A(n289), .B(\sort_list[5][0] ), .C(n589), .D(n588), .Y(n288)
         );
  XOR2X1 U789 ( .A(n272), .B(n421), .Y(n552) );
  NAND2X1 U790 ( .A(n559), .B(n274), .Y(n272) );
  NOR2X1 U791 ( .A(n751), .B(\sort_list[4][2] ), .Y(n281) );
  OAI22XL U792 ( .A0(n90), .A1(n762), .B0(n436), .B1(n602), .Y(n461) );
  OAI22XL U793 ( .A0(n600), .A1(n761), .B0(n437), .B1(n602), .Y(n462) );
  OAI22XL U794 ( .A0(n600), .A1(n757), .B0(n441), .B1(n602), .Y(n466) );
  OAI22XL U795 ( .A0(n600), .A1(n755), .B0(n443), .B1(n602), .Y(n468) );
  OAI22XL U796 ( .A0(n600), .A1(n754), .B0(n444), .B1(n601), .Y(n469) );
  OAI22XL U797 ( .A0(n600), .A1(n752), .B0(n446), .B1(n601), .Y(n471) );
  OAI22XL U798 ( .A0(n599), .A1(n750), .B0(n448), .B1(n603), .Y(n473) );
  OAI22XL U799 ( .A0(n90), .A1(n747), .B0(n451), .B1(n602), .Y(n476) );
  OAI22XL U800 ( .A0(n90), .A1(n746), .B0(n452), .B1(n602), .Y(n477) );
  OAI22XL U801 ( .A0(n90), .A1(n744), .B0(n453), .B1(n602), .Y(n478) );
  OAI22XL U802 ( .A0(n90), .A1(n742), .B0(n454), .B1(n602), .Y(n479) );
  OAI22XL U803 ( .A0(n599), .A1(n741), .B0(n455), .B1(n602), .Y(n480) );
  OAI22XL U804 ( .A0(n600), .A1(n760), .B0(n438), .B1(n602), .Y(n463) );
  OAI22XL U805 ( .A0(n600), .A1(n759), .B0(n439), .B1(n602), .Y(n464) );
  OAI22XL U806 ( .A0(n600), .A1(n758), .B0(n440), .B1(n602), .Y(n465) );
  OAI22XL U807 ( .A0(n600), .A1(n756), .B0(n442), .B1(n602), .Y(n467) );
  OAI22XL U808 ( .A0(n600), .A1(n753), .B0(n445), .B1(n602), .Y(n470) );
  OAI22XL U809 ( .A0(n600), .A1(n751), .B0(n447), .B1(n602), .Y(n472) );
  OAI22XL U810 ( .A0(n600), .A1(n749), .B0(n449), .B1(n602), .Y(n474) );
  OAI22XL U811 ( .A0(n600), .A1(n748), .B0(n450), .B1(n602), .Y(n475) );
  OAI22XL U812 ( .A0(n600), .A1(n737), .B0(n456), .B1(n602), .Y(n481) );
  OAI22XL U813 ( .A0(n599), .A1(n720), .B0(n457), .B1(n602), .Y(n482) );
  OAI22XL U814 ( .A0(n599), .A1(n722), .B0(n458), .B1(n602), .Y(n483) );
  OAI22XL U815 ( .A0(n90), .A1(n718), .B0(n460), .B1(n602), .Y(n484) );
  NOR3X1 U816 ( .A(\sort_list[2][1] ), .B(\sort_list[3][1] ), .C(
        \sort_list[3][0] ), .Y(n287) );
  OAI21XL U817 ( .A0(n487), .A1(n276), .B0(n144), .Y(n554) );
  NOR2X1 U818 ( .A(\sort_list[1][0] ), .B(n600), .Y(n286) );
  NOR2X1 U819 ( .A(n355), .B(n356), .Y(n354) );
  AOI22X1 U820 ( .A0(n365), .A1(n366), .B0(\sort_list[4][2] ), .B1(n719), .Y(
        n355) );
  OAI33X1 U821 ( .A0(n357), .A1(n358), .A2(n753), .B0(n359), .B1(n714), .B2(
        n358), .Y(n356) );
  OAI32X1 U822 ( .A0(n301), .A1(\sort_list[7][1] ), .A2(n715), .B0(n587), .B1(
        n300), .Y(n364) );
  OAI32X1 U823 ( .A0(n757), .A1(\sort_list[2][1] ), .A2(n417), .B0(n593), .B1(
        n751), .Y(n402) );
  OAI22XL U824 ( .A0(n750), .A1(n368), .B0(n489), .B1(n735), .Y(n370) );
  OAI21X1 U825 ( .A0(\sort_list[4][2] ), .A1(n307), .B0(n352), .Y(n337) );
  OA21XL U826 ( .A0(\sort_list[3][1] ), .A1(n753), .B0(n413), .Y(n412) );
  INVX3 U827 ( .A(n422), .Y(n733) );
  NOR4X1 U828 ( .A(n762), .B(n416), .C(n417), .D(\sort_list[2][0] ), .Y(n403)
         );
  NOR2X1 U829 ( .A(n755), .B(\sort_list[3][1] ), .Y(n416) );
  OAI22XL U830 ( .A0(n707), .A1(n324), .B0(\sort_list[2][1] ), .B1(n309), .Y(
        n326) );
  AOI211X1 U831 ( .A0(n590), .A1(n715), .B0(n761), .C0(n378), .Y(n371) );
  OAI221XL U832 ( .A0(n364), .A1(\sort_list[5][1] ), .B0(n715), .B1(n716), 
        .C0(n374), .Y(n378) );
  OAI21XL U833 ( .A0(\sort_list[7][2] ), .A1(n744), .B0(n407), .Y(n406) );
  OAI32X1 U834 ( .A0(n741), .A1(n590), .A2(n385), .B0(n587), .B1(n754), .Y(
        n407) );
  OAI22XL U835 ( .A0(n410), .A1(n411), .B0(n588), .B1(n746), .Y(n409) );
  NOR2X1 U836 ( .A(n591), .B(n756), .Y(n411) );
  AOI211X1 U837 ( .A0(n591), .A1(n756), .B0(n761), .C0(\sort_list[4][0] ), .Y(
        n410) );
  OAI21XL U838 ( .A0(n589), .A1(n750), .B0(n420), .Y(n419) );
  OAI32X1 U839 ( .A0(n758), .A1(\sort_list[5][0] ), .A2(n282), .B0(
        \sort_list[5][1] ), .B1(n752), .Y(n420) );
  NAND2BX1 U840 ( .AN(n266), .B(n391), .Y(n301) );
  OAI21XL U841 ( .A0(n582), .A1(n747), .B0(n392), .Y(n391) );
  OAI22XL U842 ( .A0(n393), .A1(n394), .B0(\sort_list[7][2] ), .B1(n719), .Y(
        n392) );
  NOR2X1 U843 ( .A(n581), .B(n754), .Y(n394) );
  OAI22XL U844 ( .A0(n348), .A1(n339), .B0(n349), .B1(n757), .Y(n347) );
  AND2X2 U845 ( .A(n348), .B(n339), .Y(n349) );
  NAND2X1 U846 ( .A(n338), .B(\sort_list[3][0] ), .Y(n348) );
  NAND3X1 U847 ( .A(n738), .B(n733), .C(n489), .Y(n186) );
  AND4X1 U848 ( .A(n310), .B(n311), .C(n312), .D(n313), .Y(n305) );
  NAND3X1 U849 ( .A(n326), .B(n321), .C(\sort_list[1][1] ), .Y(n310) );
  AOI21X1 U850 ( .A0(\sort_list[1][2] ), .A1(n314), .B0(n295), .Y(n313) );
  NAND4X1 U851 ( .A(\sort_list[1][0] ), .B(n319), .C(n320), .D(n321), .Y(n311)
         );
  OAI22XL U852 ( .A0(n593), .A1(n748), .B0(n322), .B1(n418), .Y(n414) );
  NAND3X1 U853 ( .A(n490), .B(n733), .C(n489), .Y(n168) );
  NOR2BX1 U854 ( .AN(n352), .B(\sort_list[4][2] ), .Y(n358) );
  NAND3X1 U855 ( .A(n491), .B(n697), .C(n423), .Y(n145) );
  NAND3X1 U856 ( .A(n697), .B(n739), .C(n491), .Y(n211) );
  CLKINVX1 U857 ( .A(n490), .Y(n738) );
  NAND2X1 U858 ( .A(n489), .B(n735), .Y(n295) );
  NOR2X1 U859 ( .A(n755), .B(\sort_list[1][1] ), .Y(n322) );
  OAI21XL U860 ( .A0(n322), .A1(\sort_list[2][0] ), .B0(n707), .Y(n320) );
  NAND2X1 U861 ( .A(n422), .B(n490), .Y(n202) );
  OAI21XL U862 ( .A0(n581), .A1(n753), .B0(n367), .Y(n366) );
  NOR2X1 U863 ( .A(n241), .B(n490), .Y(n266) );
  OAI21XL U864 ( .A0(n582), .A1(n748), .B0(n316), .Y(n312) );
  OAI22XL U865 ( .A0(\sort_list[1][2] ), .A1(n719), .B0(n317), .B1(n318), .Y(
        n316) );
  NOR2X1 U866 ( .A(n581), .B(n737), .Y(n318) );
  AOI211XL U867 ( .A0(n581), .A1(n737), .B0(n742), .C0(N278), .Y(n317) );
  NOR2X1 U868 ( .A(n752), .B(\sort_list[7][1] ), .Y(n385) );
  OAI21XL U869 ( .A0(n591), .A1(n712), .B0(\sort_list[4][0] ), .Y(n359) );
  CLKINVX1 U870 ( .A(n360), .Y(n714) );
  OAI221XL U871 ( .A0(n590), .A1(n341), .B0(\sort_list[5][0] ), .B1(n302), 
        .C0(n361), .Y(n360) );
  NAND3X1 U872 ( .A(n302), .B(n300), .C(n716), .Y(n361) );
  OA21XL U873 ( .A0(n581), .A1(n757), .B0(n353), .Y(n346) );
  OA21XL U874 ( .A0(n581), .A1(n755), .B0(n340), .Y(n333) );
  CLKINVX1 U875 ( .A(N87), .Y(n640) );
  CLKINVX1 U876 ( .A(N88), .Y(n658) );
  CLKINVX1 U877 ( .A(N85), .Y(n641) );
  BUFX12 U878 ( .A(n768), .Y(J[0]) );
  NOR2X1 U879 ( .A(n421), .B(W[0]), .Y(n617) );
  NOR2X1 U880 ( .A(n421), .B(n488), .Y(n616) );
  NOR2X1 U881 ( .A(n488), .B(W[1]), .Y(n614) );
  AO22X1 U882 ( .A0(\cost_list[5][1] ), .A1(n614), .B0(\cost_list[4][1] ), 
        .B1(n613), .Y(n604) );
  AOI221XL U883 ( .A0(\cost_list[6][1] ), .A1(n617), .B0(\cost_list[7][1] ), 
        .B1(n616), .C0(n604), .Y(n607) );
  AO22X1 U884 ( .A0(\cost_list[1][1] ), .A1(n614), .B0(\cost_list[0][1] ), 
        .B1(n613), .Y(n605) );
  AOI221XL U885 ( .A0(\cost_list[2][1] ), .A1(n617), .B0(\cost_list[3][1] ), 
        .B1(n616), .C0(n605), .Y(n606) );
  AO22X1 U886 ( .A0(\cost_list[5][2] ), .A1(n614), .B0(\cost_list[4][2] ), 
        .B1(n613), .Y(n608) );
  AOI221XL U887 ( .A0(\cost_list[6][2] ), .A1(n617), .B0(\cost_list[7][2] ), 
        .B1(n616), .C0(n608), .Y(n611) );
  AO22X1 U888 ( .A0(\cost_list[1][2] ), .A1(n614), .B0(\cost_list[0][2] ), 
        .B1(n613), .Y(n609) );
  AOI221XL U889 ( .A0(\cost_list[2][2] ), .A1(n617), .B0(\cost_list[3][2] ), 
        .B1(n616), .C0(n609), .Y(n610) );
  AO22X1 U890 ( .A0(\cost_list[5][0] ), .A1(n614), .B0(\cost_list[4][0] ), 
        .B1(n613), .Y(n612) );
  AOI221XL U891 ( .A0(\cost_list[6][0] ), .A1(n617), .B0(\cost_list[7][0] ), 
        .B1(n616), .C0(n612), .Y(n619) );
  AO22X1 U892 ( .A0(\cost_list[1][0] ), .A1(n614), .B0(\cost_list[0][0] ), 
        .B1(n613), .Y(n615) );
  AOI221XL U893 ( .A0(\cost_list[2][0] ), .A1(n617), .B0(\cost_list[3][0] ), 
        .B1(n616), .C0(n615), .Y(n618) );
  OAI22XL U894 ( .A0(n619), .A1(n487), .B0(n622), .B1(n618), .Y(n768) );
  NOR2X1 U895 ( .A(n491), .B(N85), .Y(n637) );
  NOR2X1 U896 ( .A(n491), .B(n641), .Y(n636) );
  NOR2X1 U897 ( .A(n641), .B(N86), .Y(n634) );
  NOR2X1 U898 ( .A(N85), .B(N86), .Y(n633) );
  AO22X1 U899 ( .A0(\sort_list[5][0] ), .A1(n634), .B0(\sort_list[4][0] ), 
        .B1(n633), .Y(n624) );
  AOI221XL U900 ( .A0(n590), .A1(n637), .B0(\sort_list[7][0] ), .B1(n636), 
        .C0(n624), .Y(n627) );
  AO22X1 U901 ( .A0(\sort_list[1][0] ), .A1(n634), .B0(\sort_list[0][0] ), 
        .B1(n633), .Y(n625) );
  AOI221XL U902 ( .A0(\sort_list[2][0] ), .A1(n637), .B0(\sort_list[3][0] ), 
        .B1(n636), .C0(n625), .Y(n626) );
  OAI22XL U903 ( .A0(n640), .A1(n627), .B0(N87), .B1(n626), .Y(N118) );
  AO22X1 U904 ( .A0(\sort_list[5][1] ), .A1(n634), .B0(n591), .B1(n633), .Y(
        n628) );
  AOI221XL U905 ( .A0(n587), .A1(n637), .B0(\sort_list[7][1] ), .B1(n636), 
        .C0(n628), .Y(n631) );
  AO22X1 U906 ( .A0(\sort_list[1][1] ), .A1(n634), .B0(\sort_list[0][1] ), 
        .B1(n633), .Y(n629) );
  AOI221XL U907 ( .A0(\sort_list[2][1] ), .A1(n637), .B0(\sort_list[3][1] ), 
        .B1(n636), .C0(n629), .Y(n630) );
  OAI22XL U908 ( .A0(n640), .A1(n631), .B0(N87), .B1(n630), .Y(N117) );
  AO22X1 U909 ( .A0(n588), .A1(n634), .B0(\sort_list[4][2] ), .B1(n633), .Y(
        n632) );
  AOI221XL U910 ( .A0(n589), .A1(n637), .B0(\sort_list[7][2] ), .B1(n636), 
        .C0(n632), .Y(n639) );
  AO22X1 U911 ( .A0(\sort_list[1][2] ), .A1(n634), .B0(\sort_list[0][2] ), 
        .B1(n633), .Y(n635) );
  AOI221XL U912 ( .A0(n593), .A1(n637), .B0(n592), .B1(n636), .C0(n635), .Y(
        n638) );
  OAI22XL U913 ( .A0(n639), .A1(n640), .B0(N87), .B1(n638), .Y(N116) );
  NOR2X1 U914 ( .A(n422), .B(N88), .Y(n655) );
  NOR2X1 U915 ( .A(n422), .B(n658), .Y(n654) );
  NOR2X1 U916 ( .A(n658), .B(N89), .Y(n652) );
  NOR2X1 U917 ( .A(N88), .B(N89), .Y(n651) );
  AO22X1 U918 ( .A0(\sort_list[5][0] ), .A1(n652), .B0(\sort_list[4][0] ), 
        .B1(n651), .Y(n642) );
  AOI221XL U919 ( .A0(n590), .A1(n655), .B0(\sort_list[7][0] ), .B1(n654), 
        .C0(n642), .Y(n645) );
  AO22X1 U920 ( .A0(\sort_list[1][0] ), .A1(n652), .B0(\sort_list[0][0] ), 
        .B1(n651), .Y(n643) );
  AOI221XL U921 ( .A0(\sort_list[2][0] ), .A1(n655), .B0(\sort_list[3][0] ), 
        .B1(n654), .C0(n643), .Y(n644) );
  AO22X1 U922 ( .A0(\sort_list[5][1] ), .A1(n652), .B0(n591), .B1(n651), .Y(
        n646) );
  AOI221XL U923 ( .A0(n587), .A1(n655), .B0(\sort_list[7][1] ), .B1(n654), 
        .C0(n646), .Y(n649) );
  AO22X1 U924 ( .A0(\sort_list[1][1] ), .A1(n652), .B0(\sort_list[0][1] ), 
        .B1(n651), .Y(n647) );
  AOI221XL U925 ( .A0(\sort_list[2][1] ), .A1(n655), .B0(\sort_list[3][1] ), 
        .B1(n654), .C0(n647), .Y(n648) );
  OAI22XL U926 ( .A0(n489), .A1(n649), .B0(N90), .B1(n648), .Y(N277) );
  AO22X1 U927 ( .A0(n588), .A1(n652), .B0(\sort_list[4][2] ), .B1(n651), .Y(
        n650) );
  AOI221XL U928 ( .A0(n589), .A1(n655), .B0(\sort_list[7][2] ), .B1(n654), 
        .C0(n650), .Y(n657) );
  AO22X1 U929 ( .A0(\sort_list[1][2] ), .A1(n652), .B0(\sort_list[0][2] ), 
        .B1(n651), .Y(n653) );
  AOI221XL U930 ( .A0(n593), .A1(n655), .B0(n592), .B1(n654), .C0(n653), .Y(
        n656) );
  OAI22XL U931 ( .A0(n657), .A1(n489), .B0(N90), .B1(n656), .Y(N276) );
  OAI22XL U932 ( .A0(cost_sum[1]), .A1(n659), .B0(n659), .B1(n682), .Y(n661)
         );
  NAND2X1 U933 ( .A(cost_sum[7]), .B(n686), .Y(n673) );
  NAND2X1 U934 ( .A(cost_sum[6]), .B(n685), .Y(n668) );
  NOR3BXL U935 ( .AN(n668), .B(n662), .C(n669), .Y(n660) );
  NAND3X1 U936 ( .A(n661), .B(n673), .C(n660), .Y(n680) );
  NAND2X1 U937 ( .A(cost_sum[9]), .B(n681), .Y(n676) );
  NOR2X1 U938 ( .A(n678), .B(n677), .Y(n667) );
  OAI211X1 U939 ( .A0(n664), .A1(n501), .B0(n663), .C0(n675), .Y(n665) );
  OAI221XL U940 ( .A0(cost_sum[2]), .A1(n683), .B0(cost_sum[3]), .B1(n684), 
        .C0(n665), .Y(n666) );
  AOI222XL U941 ( .A0(n770), .A1(n497), .B0(n771), .B1(n498), .C0(n667), .C1(
        n666), .Y(n671) );
  NAND2BX1 U942 ( .AN(n669), .B(n668), .Y(n670) );
  OAI222XL U943 ( .A0(n671), .A1(n670), .B0(cost_sum[6]), .B1(n685), .C0(
        cost_sum[7]), .C1(n686), .Y(n672) );
  NAND3BX1 U944 ( .AN(N375), .B(n676), .C(n675), .Y(n679) );
  NOR4X1 U945 ( .A(n680), .B(n679), .C(n678), .D(n677), .Y(N376) );
endmodule

