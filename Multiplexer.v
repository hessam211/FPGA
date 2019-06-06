module MUX(input [0:3]inp, [0:1]s, output out);
  assign out = inp[s];
endmodule

module MUX16 (input inp[0:15], s[0:3] , output out);

MUX m1(s[0+:1], d[0+:3], out[0]);
MUX m2(select[0+:1], d[4+:3], out[1]);
MUX m3(select[0+:1], d[8+:3], out[2]);
MUX m4(select[0+:1], d[12+:3], out[3]);
MUX m5(select[2+:1], q[0+:3], out);

endmodule
