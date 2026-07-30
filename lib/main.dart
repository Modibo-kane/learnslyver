import 'package:flutter/material.dart';
import 'navigator.dart'; // On importe votre fichier home_page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp DOIT être le premier widget retourné
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // On dit à l'application de démarrer sur MyHomePage
      home: const MyHomePage(),
    );
  }
}