import 'package:flutter/material.dart';
import 'package:key_gen_app/widgets/CardTesto.dart';
import 'package:key_gen_app/widgets/CardVideo.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;


void main() {
  runApp(AppWidgets());
}

class AppWidgets extends StatefulWidget {
  AppWidgets({super.key});

  @override
  State<AppWidgets> createState() => _AppWidgetsState();
}

class _AppWidgetsState extends State<AppWidgets> {
  final lista = [3, 6, 54, 2, 3, 5, 8, 95, 2, 1, 0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main 4',
      theme: ThemeData(//Colori tema chiaro
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.orange,
            accentColor: Colors.teal,
            backgroundColor: Colors.pinkAccent,
          ),
          //primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
          )
      ),
      darkTheme: ThemeData.dark().copyWith( //Colori tema scuro
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        //primarySwatch: Colors.deepPurple,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
          accentColor: Colors.tealAccent, // Use a contrasting accent color for dark theme
          backgroundColor: Colors.black87, // Use a darker background for dark theme
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Main 4", style: GoogleFonts.actor(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),),
        ),
        body: ListView.builder(
          itemCount: 10,
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) {
            if (lista[index] % 2 == 0) {
              return CardVideo(numero: index);
            } else {
              return CardTesto(numero: index);
            }
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {},
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 16), // Add some spacing between the buttons
            FloatingActionButton(
              onPressed: () {},
              tooltip: 'Delete',
              child: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
