module FullAdder ( in1, in2, c_in, c_out, out);

input in1;
input in2;
input c_in;

output reg c_out;
output reg out;

	always @ (in1 or in2 or c_in) begin
	{c_out, out} = in1 + in2 + c_in;
end
endmodule
