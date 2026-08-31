module digital_clock(
  input clk,
  input reset,
  output reg[3:0] seconds_units, //(birler basamağı)
  output reg[3:0] seconds_tens  //(onlar basamağı)
);
  always @(posedge clk or posedge reset) begin
    if (reset) begin // reset sinyali geldiğinde şunları yap
      seconds_units <= 4'd0; // saniye birler basamağı non-blocking atama sıfır
      seconds_tens <= 4'd0;
    end else begin
      if (seconds_units == 4'd9) begin //birler basamağı dokuza ulaştıysa
          seconds_units <= 4'd0;    //sıfıra eşitle
        if(seconds_tens == 4'd5) begin  // onlar basamağı 5 oldu mu
          seconds_tens <= 4'd0; //onlar basamağını sıfırlar
        end else begin
          seconds_tens <= seconds_tens + 1; //onlar basamağını 1 arttırır
        end
      end else begin
        seconds_units <= seconds_units + 1;
      end
    end
  end
endmodule
