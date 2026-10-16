module resto_divisao_por_5 (
    input [3:0] dado_sensor, // Entrada de 4 bits (dado do sensor)
    output reg [2:0] resto    // Resto da divisão por 5 (0 a 4)
);

    // Processo combinatório para calcular o resto da divisão por 5
    always @(*) begin
        case (dado_sensor)
            4'b0000: resto = 3'b000; // 0 % 5 = 0
            4'b0001: resto = 3'b001; // 1 % 5 = 1
            4'b0010: resto = 3'b010; // 2 % 5 = 2
            4'b0011: resto = 3'b011; // 3 % 5 = 3
            4'b0100: resto = 3'b100; // 4 % 5 = 4
            4'b0101: resto = 3'b000; // 5 % 5 = 0
            4'b0110: resto = 3'b001; // 6 % 5 = 1
            4'b0111: resto = 3'b010; // 7 % 5 = 2
            4'b1000: resto = 3'b011; // 8 % 5 = 3
            4'b1001: resto = 3'b100; // 9 % 5 = 4
            4'b1010: resto = 3'b000; // 10 % 5 = 0
            4'b1011: resto = 3'b001; // 11 % 5 = 1
            4'b1100: resto = 3'b010; // 12 % 5 = 2
            4'b1101: resto = 3'b011; // 13 % 5 = 3
            4'b1110: resto = 3'b100; // 14 % 5 = 4
            4'b1111: resto = 3'b000; // 15 % 5 = 0
            default: resto = 3'b000; // Caso de erro (não esperado)
        endcase
    end

endmodule
