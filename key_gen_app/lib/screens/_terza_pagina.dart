import 'package:flutter/material.dart';
import 'package:key_gen_app/screens/_quarta_pagina.dart';

class TerzaPagina extends StatelessWidget {
  const TerzaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terza Pagina"),
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.wallet)),
          IconButton(onPressed: () => {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () => {}, icon: Icon(Icons.logout)),
        ],
      ),

      //body: Padding(
      //  padding: EdgeInsets.all(90),
      //  child: Container(
      //    color: Colors.orange,
      //   child: Container(
      //     width: 200,
      //     height: 200,
      // color: Colors.blue,
      //   ),
      //   transform: Matrix4.rotationZ(0.2),
      //margin: EdgeInsets.all(90),
      // ),
      // ),
      // body: Column(
      //   children: [
      //    Container(
      //    height: 200,
      //     color: Colors.red,
      // ),
      //  SizedBox(
      //    height: 20,
      //    width: double.infinity, //prende tutto lo spazio a disposizione
      //  ),
      //  Container(
      //    height: 200,
      //   color: Colors.orange,
      // )
      //  ],
      // )
      //body: Stack(
      //  children: [
      //    Container(height: 500, color: Colors.red),
      //    Positioned(
      //        bottom: 0,
      //        child: Icon(Icons.ac_unit)
      //    ),
      //  ],
      //),
      body: Scrollbar(
        scrollbarOrientation: ScrollbarOrientation.right,
        thickness: 10,
        thumbVisibility: true,
        trackVisibility: false,
        radius: Radius.circular(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut pharetra eleifend dolor, elementum ultrices velit faucibus eu. Nullam feugiat risus quis ipsum placerat, non fermentum massa pulvinar. Vivamus ac dui justo. Vivamus vel lacus est. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla lobortis euismod vulputate. Donec quam felis, dictum sed nisl id, congue dictum erat.Nam id mauris odio. Nunc finibus mi vitae est consequat, et sodales leo fermentum. Donec consequat, turpis vitae sollicitudin vestibulum, tellus ipsum fermentum felis, sed cursus enim libero vehicula tellus. Donec tincidunt molestie tempor. Quisque imperdiet commodo ullamcorper. Etiam id erat nec sem consequat accumsan. Cras pretium eros eget neque consectetur dignissim. Nam mollis dignissim purus ac sodales. Curabitur at tortor in enim mattis mollis sit amet sed metus. Duis erat urna, congue feugiat faucibus sit amet, fermentum at nibh. Cras et dui tempor, faucibus urna at, elementum lorem.Sed eu tellus in urna luctus vulputate. Etiam pulvinar eros urna, ut pharetra risus porttitor at. Donec dignissim, elit non laoreet semper, nisi urna semper magna, sit amet imperdiet elit nunc non purus. Vestibulum finibus vel felis sed euismod. Cras turpis nisl, interdum in malesuada et, eleifend nec velit. Morbi suscipit quam sed ex faucibus fringilla. Mauris tempus leo eu nunc efficitur efficitur.Fusce pulvinar et massa in mollis. Donec a dignissim magna. Suspendisse placerat quis elit sit amet laoreet. Fusce diam ex, sagittis in augue nec, faucibus varius neque. Integer et augue tortor. Sed sem lorem, finibus sit amet elementum et, elementum in quam. Cras efficitur tempus nulla ac aliquam. Morbi pretium augue bibendum erat cursus aliquet id sed libero. Maecenas vitae ligula tortor. Curabitur volutpat accumsan risus, sed ornare urna faucibus et. Cras erat ex, dapibus sit amet sodales sit amet, venenatis eu sapien. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam consectetur eget orci eget feugiat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque maximus tristique libero, ut egestas libero euismod at.Suspendisse aliquet pretium turpis, eu rutrum lorem convallis at. In ac sagittis eros, et vestibulum libero. Etiam non eros non magna facilisis feugiat sagittis a arcu. Nam a semper magna, nec semper lacus. Donec ac massa scelerisque, vehicula tortor ac, mollis turpis. Sed at felis non erat dictum pharetra. Cras lobortis tristique neque, nec cursus urna aliquam in. Maecenas ornare eget turpis vel euismod. Ut eget justo et ex dignissim cursus at non leo. Etiam placerat eget odio id convallis."),
              TextButton(onPressed: () {Navigator.pushNamed(context, "/QuartaPagina");}, child: Text("Vai a pagina 4")),
            ]
          ),
        ),
      ),
    );
  }
}
