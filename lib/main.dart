import 'package:flutter/material.dart';
import 'package:guessing_game/pages/sherlock.dart';

//insted of run click debug if we add a break point in red.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Sherlock(),
      debugShowCheckedModeBanner: false,
    );
  }
}
