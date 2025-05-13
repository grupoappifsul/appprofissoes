// main.dart
import 'package:flutter/material.dart';
import 'ui/login/login_screen.dart'; // importa a LoginPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Need App',
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Agora inicia com a tela de login
    );
  }
}
