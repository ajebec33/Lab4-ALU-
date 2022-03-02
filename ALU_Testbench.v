module ALU_Testbench;

parameter N = 31;

reg [N:0]A;
reg [N:0]B;
reg Cin;
reg [2:0] Op;

wire [N:0] Sum;
wire [1:0] Status;
wire [1:0] Status2;


ALU dut(.A(A),.B(B),.Cin(Cin), .Op(Op), .Sum(Sum), .Status(Status), .Status2(Status2));

initial begin
	A = 31'b0;
	B = 31'b0;
	Cin = 1'b0;
	Op = 3'b0;
	#100;
	A = 31'b1;
	#20;
	B = 31'b1;
	#20;
	Op = 001;
	#20;
	Op = 010;
	#20
	Op = 011;
	#20;
	Op = 100;
	#20;
	Op = 101;
	#20;
	Op = 110;
	#20;
	Op = 111;
end
endmodule
	