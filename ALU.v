module ALU (A,B,Cin, Op, Sum, Status, Status2);
parameter N = 31;
input [N:0]A;
input [N:0]B;
input Cin;
input [2:0] Op;

output [N:0] Sum;

output reg [1:0] Status;
output reg [1:0] Status2;



//for Full Adder ouput
wire carry[31:0];
wire [N:0] I0, I1, I2, I3,I4,I5,I6,I7;




assign I0 = A^B;
assign I1 = A&B;
assign I2 = A|B;
assign I3 = (~A)|B;



//Call Full Adder
//loop
FullAdder inst0 (A[0], B[0], Cin, I4[0], carry[0]);
FullAdder inst1 (A[1], B[1], carry[0], I4[1], carry[1]);
FullAdder inst2 (A[2], B[2], carry[1], I4[2], carry[2]);
FullAdder inst3 (A[3], B[3], carry[2], I4[3], carry[3]);
FullAdder inst4 (A[4], B[4], carry[3], I4[4], carry[4]);
FullAdder inst5 (A[5], B[5], carry[4], I4[5], carry[5]);
FullAdder inst6 (A[6], B[6], carry[5], I4[6], carry[6]);
FullAdder inst7 (A[7], B[7], carry[6], I4[7], carry[7]);
FullAdder inst8 (A[8], B[8], carry[7], I4[8], carry[8]);
FullAdder inst9 (A[9], B[9], carry[8], I4[9], carry[9]);
FullAdder inst10 (A[10], B[10], carry[9], I4[10], carry[10]);
FullAdder inst11 (A[11], B[11], carry[10], I4[11], carry[11]);
FullAdder inst12 (A[12], B[12], carry[11], I4[12], carry[12]);
FullAdder inst13 (A[13], B[13], carry[12], I4[13], carry[13]);
FullAdder inst14 (A[14], B[14], carry[13], I4[14], carry[14]);
FullAdder inst15 (A[15], B[15], carry[14], I4[15], carry[15]);
FullAdder inst16 (A[16], B[16], carry[15], I4[16], carry[16]);
FullAdder inst17 (A[17], B[17], carry[16], I4[17], carry[17]);
FullAdder inst18 (A[18], B[18], carry[17], I4[18], carry[18]);
FullAdder inst19 (A[19], B[19], carry[18], I4[19], carry[19]);
FullAdder inst20 (A[20], B[20], carry[19], I4[20], carry[20]);
FullAdder inst21 (A[21], B[21], carry[20], I4[21], carry[21]);
FullAdder inst22 (A[22], B[22], carry[21], I4[22], carry[22]);
FullAdder inst23 (A[23], B[23], carry[22], I4[23], carry[23]);
FullAdder inst24 (A[24], B[24], carry[23], I4[24], carry[24]);
FullAdder inst25 (A[25], B[25], carry[24], I4[25], carry[25]);
FullAdder inst26 (A[26], B[26], carry[25], I4[26], carry[26]);
FullAdder inst27 (A[27], B[27], carry[26], I4[27], carry[27]);
FullAdder inst28 (A[28], B[28], carry[27], I4[28], carry[28]);
FullAdder inst29 (A[29], B[29], carry[28], I4[29], carry[29]);
FullAdder inst30 (A[30], B[30], carry[29], I4[30], carry[30]);
FullAdder inst31 (A[31], B[31], carry[30], I4[31], carry[31]);

always @ (A or B) begin
	Status2[0] = carry[31];
	//Negative
	Status2[1] = Sum[31];
end


//generate
//	genvar i;
//		for(i =1; i< 33 ; i = i+1)
//		begin: full_adder
//		FullAdder inst1 (A[i], B[i], carry[i-1], I4[i], carry[i]);//A,B,Cin,S,Cout
//	end
//endgenerate


	

//without loop
//Full_Adder inst0 (A[0], B[0], carry[i],

//Call Shifter
Shifter inst32 (A, B, I5, I6);

assign I7 = 32'b0;

//Call Mux
Mux_8to1 inst33 (I0, I1, I2, I3, I4, I5, I6, I7, Op, Sum);

//Status
	//Overflow
always @ (A or B) begin
	if( (A[N] == 1 && B[N] == 1) || (A[N] == 0 && B[N] == 0))
		Status[0] = 1'b1;
	else 
		Status[0] = 1'b0;
end



	

	//Zero
	
always @ (Sum) begin
	if ( Sum == 32'b0)
		Status[1] = 1'b1;
	else
		Status[1] = 1'b0;
end

endmodule

// if you remove reg from status then every assign status with a bit has an error and if you add reg to output then the others have error
