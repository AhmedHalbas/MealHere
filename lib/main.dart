import 'package:flutter/material.dart';
import 'package:whattoeat/screens/meal_loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoadingScreen(),
    );
  }
}
