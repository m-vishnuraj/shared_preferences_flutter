import 'package:flutter/material.dart';
import 'package:shar_pref/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getSavedData(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  saveUserName(context);
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }

  Future<void> saveUserName(context) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('username', _textEditingController.text);

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    ));
  }
}

//  get username from shared preferences

Future<void> getSavedData(context) async {
  final sharedPref = await SharedPreferences.getInstance();
  final username = sharedPref.getString('username');

  if (username != null) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }
}
