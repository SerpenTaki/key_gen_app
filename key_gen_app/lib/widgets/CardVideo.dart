import 'package:flutter/material.dart' show Alignment, BuildContext, Colors, Container, EdgeInsets, StatelessWidget, Text, Widget;

class CardVideo extends StatelessWidget {
  CardVideo({super.key, required this.numero});
  final int numero;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.orange[300],
      margin: EdgeInsets.only(bottom: 10),
      height: 100,
      child: Text("$numero"),
    );;
  }
}