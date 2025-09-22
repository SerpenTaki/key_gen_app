import 'package:flutter/material.dart';
import 'dart:math';

class Primapagina extends StatefulWidget {
  const Primapagina({super.key});

  @override
  State<Primapagina> createState() => _PrimapaginaState();
}

class _PrimapaginaState extends State<Primapagina> {
  double _width = 250;
  double _height = 250;
  Color _color = Colors.deepPurple;
  double _padding = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prima Pagina")),
      body: Center(
        child: AnimatedPadding(
          duration: const Duration(seconds: 1),
          padding: EdgeInsets.all(_padding),
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FirstPage",
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) =>  Secondapagina(data: 'Vecchio metodo',),),); //vecchio metodo
                  Navigator.pushNamed(
                    context,
                    '/SecondaPagina',
                    arguments: "Frase da passare alla seconda pagina",
                  ); //nuovo metodo
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
              ElevatedButton(onPressed: (){Navigator.pushNamed(context, "/Pagina1");}, child: Text("Pagine chiamate http")),
              AnimatedContainer(
                width: _width,
                height: _height,
                color: _color,
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();
            _width = random.nextInt(250).toDouble();
            _height = random.nextInt(250).toDouble();
            _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
            _padding = random.nextInt(50).toDouble();
          });
        }, child: Icon(Icons.animation),
      ),
    );
  }
}