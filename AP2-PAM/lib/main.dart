import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(CronometroApp());
}

class CronometroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronômetro',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.grey[900],
      ),
      home: HomeScreen(),
    );
  }
}
