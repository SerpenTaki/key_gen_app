import 'package:flutter/material.dart';

void main() {
  runApp( AppWidgets());
}

class AppWidgets extends StatefulWidget {
  AppWidgets({super.key});

  @override
  State<AppWidgets> createState() => _AppWidgetsState();
}

class _AppWidgetsState extends State<AppWidgets> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main 4',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Main 4",),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: null
      ),
    );
  }
}