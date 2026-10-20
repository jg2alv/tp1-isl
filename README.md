# High Five — a SystemVerilog modulo-five combinational circuit

High Five maps a four-bit sensor reading to its remainder modulo five, represented by three output bits. The project connects a numerical specification, Boolean design, an explicit HDL mapping, and a testbench that exposes signal changes for inspection.

## 1. Academic context and scope

- **Institution:** Universidade Federal de Minas Gerais (UFMG)
- **Degree:** Ciência da Computação
- **Course:** Introdução aos Sistemas Lógicos
- **Assignment:** Trabalho Prático 1
- **Semester:** 2024-02

The input domain contains sixteen values, from zero through fifteen; the output domain contains the remainders zero through four. The design work included a truth table, canonical Boolean expressions, Karnaugh-map simplification into product-of-sums forms, and a gate diagram. The repository contains the SystemVerilog implementation, its testbench, and the project documentation.

## 2. How to run

Use EDA Playground, the simulation environment specified by the assignment:

1. Load [design.sv](design.sv) as the circuit design and [testbench.sv](testbench.sv) as the testbench.
2. Choose a SystemVerilog-compatible simulator and use `tb_resto_divisao_por_5` as the simulation top module.
3. Run the simulation and inspect the monitored input/output values. The testbench also requests `dump.vcd`; inspect `dado_sensor` and `resto` in the waveform viewer.

The stimuli are defined in the testbench, not supplied through standard input.

## 3. Usage example

The assignment's five sensor readings are already included in `testbench.sv`:

```systemverilog
dado_sensor = 4'b0110; #5;
dado_sensor = 4'b1101; #5;
dado_sensor = 4'b1010; #5;
dado_sensor = 4'b0011; #5;
dado_sensor = 4'b1001; #5;
```

The expected outputs follow the modulo-five mapping in `design.sv`:

| Sensor input | Decimal input | Expected remainder | Decimal remainder |
| --- | --- | --- | --- |
| `0110` | 6 | `001` | 1 |
| `1101` | 13 | `011` | 3 |
| `1010` | 10 | `000` | 0 |
| `0011` | 3 | `011` | 3 |
| `1001` | 9 | `100` | 4 |

After these readings, the testbench increments the four-bit input until it wraps to zero.

## 4. Implementation decisions

The `resto_divisao_por_5` module has a four-bit input, `dado_sensor`, and a three-bit output, `resto`. An `always @(*)` block expresses combinational behavior, with a `case` entry for every binary input value. This makes the implementation directly comparable to the truth table instead of relying on a runtime division operation.

The testbench instantiates that module and separates stimulus generation from the design. `$monitor` displays the input and output in binary and decimal, while `$dumpfile` and `$dumpvars` request a waveform file named `dump.vcd`. The fixed delays separate successive stimulus changes for inspection.

## 5. Tests and evaluation

`testbench.sv` supplies an executable stimulus sequence and waveform instrumentation. It does not contain assertions or a self-checking comparison against an independent modulo-five reference. Inspecting a waveform and passing an automated correctness test are therefore different evaluation steps.

<!--
### Verified results
-->

## 6. Learning and details

The central exercise was maintaining consistency across binary encoding, Boolean expressions, and HDL behavior. Moving between these representations made the connection between algebraic simplification and observable signals concrete.

The module covers a fixed four-bit unsigned input and a fixed divisor. Its default branch assigns zero when the `case` does not match a listed binary value, so that branch should not be interpreted as a separate arithmetic specification for unknown signal states.

The testbench does not declare a `timescale`, so `#5` denotes simulation time units rather than an explicitly specified physical duration.
