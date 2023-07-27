import 'package:flutter/material.dart';

class FallingPetal extends StatefulWidget {
  const FallingPetal({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FallingPetalState createState() => _FallingPetalState();
}

class _FallingPetalState extends State<FallingPetal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _animation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, 1.5),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset("assets/falling_petal.gif", width: 300, height: 300),
    );
  }
}
