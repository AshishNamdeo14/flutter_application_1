import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/calculator_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.blue[400],
        body: SafeArea(
          child: const CalculatorView(),
          ),
      );
  }
}