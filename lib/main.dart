import 'package:flutter/material.dart';
import 'screens/liveboard_screen.dart';

void main() {
  runApp(const LiveBoardApp());
}

class LiveBoardApp extends StatelessWidget {
  const LiveBoardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiveBoard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        fontFamily: 'Roboto',
      ),
      home: const LiveBoardScreen(),
    );
  }
}
