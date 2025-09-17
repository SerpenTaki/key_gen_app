import 'package:flutter/material.dart';
import 'package:key_gen_app/screens/_quinta_pagina.dart';

class QuartaPagina extends StatelessWidget {
  List<int> lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  QuartaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quarta Pagina"),
          actions: [
            TextButton(onPressed: () {Navigator.pushNamed(context, "/QuintaPagina");}, child: Text("Pagina 5"))
          ],
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(8),
            itemCount: lista.length, //di default è infinito
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.grey,
                alignment: Alignment.center,
                child: Text('${index+1}'),
              );
            }
        )
      //GridView.count(
      //  crossAxisCount: 2,
      //  mainAxisSpacing: 8,
      //  crossAxisSpacing: 8,
      //  children: [
      //    for (var i in lista)
      //      Container(
      //        color: Colors.grey,
      //        alignment: Alignment.center,
      //        child: Text('$i'),
      //     ),
      // ],
      //),
    );
  }
}
