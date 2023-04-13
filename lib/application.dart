import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Calc extends StatefulWidget {
  final String input = '0';
  final String currentValue = '0';
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
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
                                  widget.input,
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
                                  widget.currentValue,
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
                                  onPressed: () {},
                                  child: const Text("C")),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "÷",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {},
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
                                  onPressed: () {},
                                  child: const Text(
                                    "7",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "8",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "9",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {},
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
                                  onPressed: () {},
                                  child: const Text(
                                    "4",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "5",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "6",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {},
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
                                  onPressed: () {},
                                  child: const Text(
                                    "1",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "2",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "3",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {},
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
                                  onPressed: () {},
                                  child: const Text(
                                    ".",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "0",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "00",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.18,
                              child: ElevatedButton(
                                  onPressed: () {},
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
