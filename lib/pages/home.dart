import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String email;

  const HomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Selamat datang, $email !",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
