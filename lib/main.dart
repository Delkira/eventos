import 'package:flutter/material.dart';
import 'package:practica4_app/models/modelo_evento.dart';
import 'package:practica4_app/screens/list_evento.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => EventProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manejo de Eventos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EventListScreen(),
    );
  }
}
