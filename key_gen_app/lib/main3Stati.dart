import 'package:flutter/material.dart';

void main() {
  runApp( MyAppStati());
}

class MyAppStati extends StatefulWidget {
  MyAppStati({super.key});

  @override
  State<MyAppStati> createState() => _MyAppStatiState();
}

class _MyAppStatiState extends State<MyAppStati> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Esercizio Pratico',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Esercizio Pratico StateFul Widget", textAlign: TextAlign.center,),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onDoubleTap: () {
                setState(() {
                  isFavourite = !isFavourite;
                });
              },
              child: SizedBox(
                height: 250,
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  elevation: 20,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Image.asset("images/purple.jpeg", fit: BoxFit.fill,),
                      Positioned(top: 10, right:10, child: isFavourite ? Icon(Icons.favorite, color: Colors.white,) : Icon(Icons.favorite_outline, color: Colors.white,)),
                    ],
                  ),
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//Stateless : senza stato -> sasso sarà sempre sasso
//Statefull : con stato -> persona può essere un avvocato, sviluppatore, studente
//(stato) -> quelle cose che ci permettono di cambiare

//@override
//Widget build(BuildContext context) {
//  return MaterialApp(
//    title: 'Stati Demo',
//    theme: ThemeData(primarySwatch: Colors.blue),
//    home: Scaffold(
//      appBar: AppBar(title: Text("Stati Demo")),
//      body: Center(
//        child: Text("$counter", style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700),),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {setState(() {
//          counter++;
//          print(counter);
//        });
//          // counter++;
//          // print(counter);//il valore cambia nella logica ma il widget non cambia (statelessWidget)
//          //nonostante in console cambia
//        },
//        child: Icon(Icons.plus_one),
//      ),
//    ),
//  );
//}