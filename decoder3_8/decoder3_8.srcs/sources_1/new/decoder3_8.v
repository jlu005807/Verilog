module decoder3_8 (
    input Sw3_A2,
    input Sw2_A1,
    input Sw1_A0,
    output LED1_Y0,
    output LED2_Y1,
    output LED3_Y2,
    output LED4_Y3,
    output LED5_Y4,
    output LED6_Y5,
    output LED7_Y6,
    output LED8_Y7
);
    begin
       assign LED1_Y0 = ~Sw1_A0&~Sw2_A1&~Sw3_A2;
       assign LED2_Y1 = Sw1_A0&~Sw2_A1&~Sw3_A2;
       assign LED3_Y2 = ~Sw1_A0&Sw2_A1&~Sw3_A2;
       assign LED4_Y3 = Sw1_A0&Sw2_A1&~Sw3_A2;
       assign LED5_Y4 = ~Sw1_A0&~Sw2_A1&Sw3_A2;
       assign LED6_Y5 = Sw1_A0&~Sw2_A1&Sw3_A2;
       assign LED7_Y6 = ~Sw1_A0&Sw2_A1&Sw3_A2;
       assign LED8_Y7 = Sw1_A0&Sw2_A1&Sw3_A2;
    end
endmodule