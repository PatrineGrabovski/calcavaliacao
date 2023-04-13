import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  double? result;
  String input = "";
  String expression = "";
  double? firstValue;
  double? secondValue;
  String operator = "";

  void reset() {
    setState(() {
      result = null;
      input = "";
      expression = "";
      firstValue = null;
      secondValue = null;
      operator = "";
    });
  }

  void delete() {
    setState(() {
      input = input.substring(0, input.length - 1);
      expression = expression.substring(0, expression.length - 1);
    });
  }

  bool isOperator(String value) {
    if (value == 'X' ||
        value == '-' ||
        value == '+' ||
        value == '÷' ||
        value == '%' ||
        value == 'C') {
      return true;
    }
    return false;
  }

  void onPressed(String buttonValue) {
    setState(() {
      switch (buttonValue) {
        case "c":
          reset();
          break;
        case "del":
          delete();
          break;
        case "+":
        case "-":
        case "x":
        case "÷":
          //if (firstValue == null) break;
          //verifica se primeiro valor é operador
          if (operator.isEmpty) {
            operator = buttonValue;
            expression += buttonValue;
            firstValue = double.parse(input);
          } else {
            operator = buttonValue;
            expression = expression.substring(0, expression.length - 1);
            expression += buttonValue;
          }
          input = "";
          break;

        case "=":
          if (operator.isNotEmpty) {
            secondValue = double.parse(input);
            expression += '=';
            calculate(firstValue!, secondValue!, operator);
            expression = result.toString() == 'null' ? '' : result.toString();
            input = result.toString() == 'null' ? '' : result.toString();
            operator = '';
            firstValue = null;
            secondValue = null;
          }
          break;

        case ".":
          if (input == "") {
            // trata a inserção do zero no início
            input = "0.";
            expression += "0.";
          } else if (input.contains('.')) {
            // impede que mais de um ponto seja adicionado
            break;
          } else {
            input += buttonValue;
            expression += buttonValue;
          }
          break;

        default:
          input += buttonValue;
          expression += buttonValue;
          break;
      }
    });
  }

  void calculate(double firstValue, double secondValue, String operator) {
    setState(() {
      switch (operator) {
        case '+':
          result = firstValue + secondValue;
          break;
        case '-':
          result = firstValue - secondValue;
          break;
        case 'x':
          result = firstValue * secondValue;
          break;
        case '÷':
          if (secondValue != 0) {
            result = firstValue / secondValue;
          } else {
            reset();
          }
      }
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Calculadora"),
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.calculate))),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red.shade100,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.5),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 8),
                                child: Text(
                                  expression,
                                  style: const TextStyle(fontSize: 30),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 35, right: 8),
                                child: Text(
                                  input,
                                  style: const TextStyle(fontSize: 40),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll(Colors.red),
                                      textStyle: MaterialStatePropertyAll(
                                          TextStyle(fontSize: 30))),
                                  onPressed: () {
                                    reset();
                                  },
                                  child: const Text("C")),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("÷");
                                  },
                                  child: const Text(
                                    "÷",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("del");
                                  },
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.backspace))),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("7");
                                  },
                                  child: const Text(
                                    "7",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("8");
                                  },
                                  child: const Text(
                                    "8",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("9");
                                  },
                                  child: const Text(
                                    "9",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("x");
                                  },
                                  child: const Text(
                                    "x",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("4");
                                  },
                                  child: const Text(
                                    "4",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("5");
                                  },
                                  child: const Text(
                                    "5",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("6");
                                  },
                                  child: const Text(
                                    "6",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("-");
                                  },
                                  child: const Text(
                                    "-",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("1");
                                  },
                                  child: const Text(
                                    "1",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("2");
                                  },
                                  child: const Text(
                                    "2",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("3");
                                  },
                                  child: const Text(
                                    "3",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("+");
                                  },
                                  child: const Text(
                                    "+",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed(".");
                                  },
                                  child: const Text(
                                    ".",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("0");
                                  },
                                  child: const Text(
                                    "0",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("00");
                                  },
                                  child: const Text(
                                    "00",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {
                                    onPressed("=");
                                  },
                                  child: const Text(
                                    "=",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
