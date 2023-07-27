import 'package:flutter/material.dart';
import 'package:guessing_game/pages/sherlock.dart';

class GameOver extends StatelessWidget {
  final int secret;

  const GameOver({super.key, required this.secret});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Game Over",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Secret Number is: $secret",
              style: const TextStyle(fontSize: 20),
            ),
            Image.asset(
              "assets/sad.png",
              width: 200,
              height: 200,
            ),
            ElevatedButton(
                onPressed: () {
                  debugPrint("Navigating back to Sherlock page.");
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Sherlock()));
                },
                child: const Text("Start Again"))
          ],
        ),
      ),
    );
  }
}
