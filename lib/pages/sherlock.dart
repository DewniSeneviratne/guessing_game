import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guessing_game/pages/attempt_over.dart';
import 'package:guessing_game/pages/wrong_guess.dart';

import 'correct.dart';

class Sherlock extends StatefulWidget {
  const Sherlock({super.key});

  @override
  State<Sherlock> createState() => _SherlockState();
}

class _SherlockState extends State<Sherlock> {
  late final int myNumber = Random().nextInt(10) + 1;

  int counter = 0;
  int? userInput;

  final TextEditingController _guessNum = TextEditingController();

  @override
  void dispose() {
    _guessNum.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text("Guessing Game"),
        backgroundColor: Colors.blue[300],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
            children: [
              Image.asset(
                "assets/cute.png",
                width: 300,
                height: 300,
              ),
              const Text(
                  "I have a secret number in my mind. Can you guess it? (1 - 10)"),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      userInput = int.tryParse(value);
                    });
                  },
                  controller: _guessNum,
                  decoration: const InputDecoration(
                    hintText: "Enter the number",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[300]),
                  onPressed: () {
                    debugPrint("userInput: $userInput, myNumber: $myNumber");
                    if (userInput == myNumber) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Correct(
                                    secret: myNumber,
                                  )));
                    } else {
                      counter++;
                      debugPrint("Counter incremented: $counter");

                      if (counter >= 3) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GameOver(secret: myNumber)),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WrongGuess()),
                        );
                      }
                    }
                  },
                  child: const Text("Guess")),
            ],
          ),
        ),
      ),
    );
  }
}
