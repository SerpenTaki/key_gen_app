import 'package:flutter/material.dart';
import 'package:key_gen_app/screens/SecondaPagina.dart';

class Primapagina extends StatelessWidget {
  const Primapagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prima Pagina")),
      body: Container(
        color: Colors.orange,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "FirstPage",
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) =>  Secondapagina(data: 'Vecchio metodo',),),); //vecchio metodo
                Navigator.pushNamed(context, '/SecondaPagina', arguments: "Frase da passare alla seconda pagina"); //nuovo metodo
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 40,
                ),
              ),
              child: const Text("Cambia Pagina"),
            ),
            Text("Testo"),
          ],
        ),
      ),
    );
  }
}
