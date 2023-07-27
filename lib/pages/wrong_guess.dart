import 'package:flutter/material.dart';

class WrongGuess extends StatelessWidget {
  const WrongGuess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Wrong guess",
              style: TextStyle(fontSize: 20),
            ),
            Image.asset(
              "assets/wrong1.png",
              width: 200,
              height: 200,
            ),
            ElevatedButton(
                onPressed: () {
                  debugPrint("Navigating back to Sherlock page.");
                  Navigator.pop(context);
                },
                child: const Text("Guess Again"))
          ],
        ),
      ),
    );
  }
}
