import 'package:flutter/material.dart';

class TimerDisplay extends StatelessWidget {
  final String time;

  TimerDisplay({required this.time});

  @override
  Widget build(BuildContext context) {
    return Text(
      time,
      style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
