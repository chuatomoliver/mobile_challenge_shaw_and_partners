import 'package:flutter/material.dart';
import 'package:mobile_challenge_shaw_and_partners/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "montserrat_regular",
        colorScheme: const ColorScheme.light(
          primary: Colors.teal,
          secondary: Colors.green,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
