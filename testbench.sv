module tb_resto_divisao_por_5;
    reg [3:0] dado_sensor;
    wire [2:0] resto;

    resto_divisao_por_5 uut (
        .dado_sensor(dado_sensor),
        .resto(resto)
    );

    initial begin
        $monitor("Entrada=%b (%d), Saida=%b (%d)", dado_sensor, dado_sensor, resto, resto);

      	// Gerar arquivo VCD para a simulação de ondas
      	$dumpfile("dump.vcd");
        $dumpvars(1, tb_resto_divisao_por_5);

      	// Casos particulares de leitura
        dado_sensor = 4'b0110; #5;
        dado_sensor = 4'b1101; #5;
        dado_sensor = 4'b1010; #5;
        dado_sensor = 4'b0011; #5;
        dado_sensor = 4'b1001; #5;

      	do begin
            #5; // Esperando o tempo de atualizacao
          	dado_sensor = dado_sensor + 1;
        end
        while(dado_sensor != 0); // Quando dado_sensor vira 16, ele volta pra zero

        $finish;
    end
endmodule
