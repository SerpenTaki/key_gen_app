import 'package:flutter/material.dart';
import 'package:key_gen_app/screens/PrimaPagina.dart';
import 'package:key_gen_app/screens/Carta.dart';
import 'package:key_gen_app/screens/Sliddare.dart';

class Tabbare extends StatefulWidget {
  const Tabbare({super.key});

  @override
  State<Tabbare> createState() => _TabbareState();
}

class _TabbareState extends State<Tabbare> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Tabs Demo"),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          centerTitle: true,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
             // Text("Flutter Tabs Demo", textAlign: TextAlign.center,),
              //Se metti qui la tabbar non hai problemi e non fa lo spazio sopra brutto
            ],
          ),
          bottom: TabBar(
            //isScrollable: true, //per tanti elementi tipo 7 e otto
             // indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              automaticIndicatorColorAdjustment: true,
              dividerColor: Colors.orange,
              //indicator: BoxDecoration(
              //  borderRadius: BorderRadius.circular(50),
              //  color: Colors.blue,
              //),
              tabs: const [
                Tab(icon: Icon(Icons.directions_bike, color: Colors.white,), text: "bike",),
                Tab(icon: Icon(Icons.directions_bus, color: Colors.white,), text: "bus",),
                Tab(icon: Icon(Icons.directions_boat, color: Colors.white,), text: "Boat",),
              ]),
        ),
        body: TabBarView(
          children: [
            //Primapagina(),
            //Carta(),
            //Sliddare(), //Attenzione che importa l'intera pagina con tutti i suoi widget, floating action button e appbar
            Icon(Icons.directions_bike, color: Colors.black,),
            Icon(Icons.directions_bus, color: Colors.black,),
            Icon(Icons.directions_boat, color: Colors.black,),
          ],
        ),
      ),
    );
  }
}
