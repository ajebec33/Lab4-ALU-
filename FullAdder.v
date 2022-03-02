module FullAdder (

input [31:0] in1,
input [31:0] in2,
input c_in,
output reg c_out,
output reg [31:0] out);

	always @ (in1 or in2 or c_in) begin
	{c_out, out} = in1 + in2 + c_in;
end
endmodule
