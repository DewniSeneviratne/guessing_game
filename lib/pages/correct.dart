import 'package:flutter/material.dart';
import 'package:guessing_game/pages/falling_petal.dart';
import 'package:guessing_game/pages/sherlock.dart';
import 'package:hexcolor/hexcolor.dart';

class Correct extends StatelessWidget {
  final int secret;

  const Correct({super.key, required this.secret});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("FCFEFC"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const FallingPetal(),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Congratulations! You guessed right",
              style: TextStyle(fontSize: 20, color: Colors.pink),
            ),
            Text(
              "Secret Number is: $secret",
              style: const TextStyle(fontSize: 20, color: Colors.pink),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.pink[200]),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Sherlock()),
                );
              },
              child: const Text("Start Again"),
            )
          ],
        ),
      ),
    );
  }
}
