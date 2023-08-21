import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ! late added to avoid null error in the future when we use it
late SharedPreferences sharedPreferences;

Future<void> main() async {
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
