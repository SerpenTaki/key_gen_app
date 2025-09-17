import 'package:flutter/material.dart';
import 'package:key_gen_app/screens/_terza_pagina.dart';

class Secondapagina extends StatelessWidget {
  const Secondapagina({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Seconda Pagina")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SecondPage",
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.pop(context),
                //Navigator.pushNamed(context, '/PrimaPagina'),
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 40,
                ),
              ),
              child: Text("Cambia Pagina"),
            ),
            Text(data),
            Image(
              image: AssetImage('images/purple.jpeg'),
              width: 200, // Imposta la larghezza desiderata
              height: 200, // Imposta l'altezza desiderata
              color: Colors.purple,
              colorBlendMode: BlendMode.exclusion,
              fit: BoxFit.cover, // Scegli come l'immagine deve adattarsi allo spazio
              alignment: Alignment.center,
            ),
            ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/TerzaPagina');}, child: Text("Terza Pagina")),
          ],
        ),
      ),
    );
  }
}
