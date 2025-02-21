import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;// Declare variables here
  num result = 0;

  final display1Controller = TextEditingController();
  final display2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    display1Controller.text = x.toString();
    display2Controller.text = y.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          // 
          Display1(hint: "Enter a Number",controller: display1Controller),
          SizedBox(height: 30),
          Display1(hint: "Enter a Number",controller: display2Controller),
          SizedBox(height: 30),
          Text(
            result.toString(),
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(onPressed: (){
                setState(() {
                  result = num.tryParse(display1Controller.text)! + num.tryParse(display2Controller.text)!;
                });
              }, child: const Icon(CupertinoIcons.add)),
              FloatingActionButton(onPressed: (){}, child: const Icon(CupertinoIcons.minus)),
              FloatingActionButton(onPressed: (){}, child: const Icon(CupertinoIcons.multiply)),
              FloatingActionButton(onPressed: (){}, child: const Icon(CupertinoIcons.divide)),
            ],
          ),
           SizedBox(height:30),
           FloatingActionButton.extended(onPressed: (){
            setState(() {
                  x=0;
                  y=0;
                  result = 0;
                  display1Controller.clear();
                  display2Controller.clear();
                });
           }, 
           label: const Text("Clear"), icon: const Icon(CupertinoIcons.clear_circled)),
        ],
      ),
    );
  }
}

class Display1 extends StatelessWidget {
  const Display1({
    super.key,
    this.hint = "Enter the first number",
    required this.controller,
  });

  final String? hint; 
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
        decoration: InputDecoration(
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1), 
          borderRadius: BorderRadius.circular(10),
        ),
        hintStyle: const TextStyle(color: Colors.black),
      ),
          
    );
  }
}