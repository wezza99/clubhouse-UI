import 'package:chat_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
// ignore: duplicate_import
import 'package:chat_ui/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        hintColor: const Color(0xFFFEF9EB),
      ),
      home: const HomeScreen(),
    );
  }
}
