// main.dart
import 'package:flutter/material.dart';
import 'screens/login_page.dart'; // importa a LoginPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Need App',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(), // Agora inicia com a tela de login
    );
  }
}
