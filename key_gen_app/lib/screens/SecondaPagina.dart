import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:key_gen_app/screens/_terza_pagina.dart';
import 'package:key_gen_app/providers/counter.dart';
import 'package:provider/provider.dart';

class Secondapagina extends StatelessWidget {
  const Secondapagina({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Seconda Pagina"),
      actions: [
        TextButton(onPressed: () {context.read<Counter>().plusOne();}, child: Text("+1")),
        TextButton(onPressed: () {context.read<Counter>().minusOne();}, child: Text("-1")),
      ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              clipBehavior: Clip.hardEdge,
              child: Hero(
                tag: "immagine_prova",
                child: Image.asset('images/purple.jpeg'),
              ),
            ),
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
            Text(data), // Mostra l'argomento che gli passiamo in creazione
            Image(
              image: AssetImage('images/purple.jpeg'),
              width: 50,
              // Imposta la larghezza desiderata
              height: 50,
              // Imposta l'altezza desiderata
              color: Colors.purple,
              colorBlendMode: BlendMode.exclusion,
              fit: BoxFit.cover,
              // Scegli come l'immagine deve adattarsi allo spazio
              alignment: Alignment.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/TerzaPagina');
              },
              child: Text("Terza Pagina"),
            ),
          ],
        ),
      ),
    );
  }
}
