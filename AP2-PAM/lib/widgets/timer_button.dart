import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  TimerButton(
      {required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
