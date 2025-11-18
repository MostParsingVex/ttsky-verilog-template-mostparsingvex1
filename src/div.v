module div( clkin, rst, clkout, divisor );
  input clkin;
  input rst;
  output clkout;
  input [31:0] divisor;

  reg [31:0] state;

  always @ ( posedge clkin )
    begin
      if( rst )
        begin
          state <= 0;
	end
      else
        begin
          state <= state + divisor;
        end
    end

  assign clkout = state[ 31 ];
endmodule
