module Mux_8to1(i0, i1, i2, i3, i4, i5, i6, i7, s, o);
parameter N = 31;
input [N:0] i0;
input [N:0] i1;
input [N:0] i2;
input [N:0] i3;
input [N:0] i4;
input [N:0] i5;
input [N:0] i6;
input [N:0] i7;

input [2:0] s;
output reg [N:0] o;

always @ (i0 or i1 or i2 or i3 or i4 or i5 or i6 or i7 or s) begin
case (s)
3'b000 : o <= i0;
3'b001 : o <= i1;
3'b010 : o <= i2;
3'b011 : o <= i3;
3'b100 : o <= i4;
3'b101 : o <= i5;
3'b110 : o <= i6;
3'b111 : o <= i7;

endcase
end
endmodule