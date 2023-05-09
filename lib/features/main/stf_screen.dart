import 'package:flutter/material.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({super.key});

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _clicks = 0;

  void _increaseClicks() => setState(() => _clicks++);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You have clicked $_clicks times"),
          ElevatedButton(
            onPressed: _increaseClicks,
            child: const Text("Click me"),
          ),
        ],
      ),
    );
  }
}
