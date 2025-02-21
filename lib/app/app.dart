import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: "Hello Ashish", 
      home: HomeView(),
    );
  }
}