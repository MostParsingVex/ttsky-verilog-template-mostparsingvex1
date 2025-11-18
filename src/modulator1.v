module modulator1( clk, rst, data_in, carrier_in, data_out );
  input clk;
  input rst;
  input [7:0] data_in;
  input carrier_in;
  output [7:0] data_out;

  wire [7:0] baseband;
  wire [7:0] baseband_mixed;
  wire intermediate_data_out;

  div U0( .clkin( clk ), .rst( rst ), .clkout( baseband[0] ), .divisor( 32'd37796 ) );
  div U1( .clkin( clk ), .rst( rst ), .clkout( baseband[1] ), .divisor( 32'd42424 ) );
  div U2( .clkin( clk ), .rst( rst ), .clkout( baseband[2] ), .divisor( 32'd47620 ) );
  div U3( .clkin( clk ), .rst( rst ), .clkout( baseband[3] ), .divisor( 32'd50451 ) );

  div U4( .clkin( clk ), .rst( rst ), .clkout( baseband[4] ), .divisor( 32'd56630 ) );
  div U5( .clkin( clk ), .rst( rst ), .clkout( baseband[5] ), .divisor( 32'd63565 ) );
  div U6( .clkin( clk ), .rst( rst ), .clkout( baseband[6] ), .divisor( 32'd71349 ) );
  div U7( .clkin( clk ), .rst( rst ), .clkout( baseband[7] ), .divisor( 32'd75591 ) );

  assign baseband_mixed = baseband & data_in;

  assign intermediate_data_out = !(| baseband_mixed) & carrier_in;

  assign data_out = intermediate_data_out ? 8'hff : 8'h00;
endmodule
