// lib/main.dart
import 'package:flutter/material.dart';
import 'package:guia_de_moteis/providers/motel_provider.dart';
import 'package:guia_de_moteis/screens/motel_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MotelProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guia de Motéis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MotelListScreen(),
    );
  }
}
