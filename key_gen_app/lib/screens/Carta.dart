import 'package:flutter/material.dart';
import 'package:key_gen_app/screens/Sliddare.dart';

class Carta extends StatelessWidget {
  const Carta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carta', textAlign: TextAlign.center)),
      body: Scrollbar(
        scrollbarOrientation: ScrollbarOrientation.right,
        thickness: 10,
        thumbVisibility: true,
        trackVisibility: false,
        radius: Radius.circular(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20),
          child: Column(// Changed SizedBox to Column to allow multiple children
            children: [
              InkWell(
                onTap: () => {Navigator.pushNamed(context, "/SecondaPagina", arguments: "Sei tornato indietro, vista l'animazione?")},
                child: SizedBox(
                  height: 500, // Adjusted height for the Card
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.deepPurple,
                    shadowColor: Colors.indigoAccent,
                    elevation: 30,
                    margin: EdgeInsets.all(20), // Corrected EdgeInsetsGeometry.all to EdgeInsets.all
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        Hero(tag: "immagine_prova",
                        child: Image.asset("images/purple.jpeg")), // Assuming the image is in assets/images
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://i.pravatar.cc/150?img=64"),
                          ),
                          title: Text("Luca Rossi"),
                          subtitle: Text("Ciao Sono Nuovo"),
                          trailing: Icon(Icons.favorite),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Transform.translate(
               // angle: 35, //transform.rotate
                //scale: 2, //.scale -> scale e scaleX e scaleY, Offset //accetta un double,
                offset: Offset(0, 0), //transform.translate
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
              ),
              ClipOval( //ClipRect
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  //image: DecorationImage(image: AssetImage("images/purple.jpeg")),
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red, width: 5),
                  backgroundBlendMode: BlendMode.difference,
                  gradient: LinearGradient(colors: [Colors.red, Colors.white])
                ),
                child: Container(
                  height: 200,
                  width: 100,
                ),
              ),
              TextButton(onPressed: () {Navigator.pushNamed(context, "/Slievers");}, child: Text("Vai a slievers"),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 40,
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
