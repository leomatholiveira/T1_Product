import 'package:flutter/material.dart';
import 'package:untitled1/data/product_inherited.dart';
import 'package:untitled1/screens/initial_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductInherited(
        child: const InitialScreen(),
      ),
    );
  }
}


