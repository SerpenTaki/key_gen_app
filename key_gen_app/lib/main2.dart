import 'package:flutter/material.dart';
import 'package:key_gen_app/RouteGenerator.dart';
import 'package:key_gen_app/screens/PrimaPagina.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Navigazione",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: Primapagina(), //widget
     // routes: { //route per navigare tra le pagine statico
      //  '/PrimaPagina' : (context) => Primapagina(),
      //  '/SecondaPagina' : (context) => Secondapagina(data: 'Frase da passare alla seconda pagina',),
      //},
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
