import 'package:flutter/material.dart' show Alignment, BuildContext, Colors, Container, EdgeInsets, State, StatefulWidget, Text, Widget;

class CardTesto extends StatefulWidget {
  CardTesto({super.key, required this.numero});
  var numero;

  @override
  State<CardTesto> createState() => _CardTestoState();
}

class _CardTestoState extends State<CardTesto> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      color: Colors.orange[700],
      margin: EdgeInsets.only(bottom: 10),
      height: 100,
      child: Text(widget.numero.toString()),
    );
  }
}