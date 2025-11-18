module amx_core1( clk, rst, data_in, data_out );
  input clk;
  input rst;
  input [7:0] data_in;
  output [7:0] data_out;

  wire [31:0] divisor;
  assign divisor = 32'h051eb852;

  wire carrier;

  div U0( .clkin( clk ), .rst( rst ), .clkout( carrier ), .divisor( divisor ) );

  modulator1 U1(.clk(clk),.rst(rst),.data_in(data_in),.carrier_in(carrier),.data_out(data_out));
endmodule
