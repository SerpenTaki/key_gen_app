import 'package:flutter/material.dart';
import 'package:key_gen_app/screens/_tabs.dart';


class Sliddare extends StatelessWidget {
  const Sliddare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true, //fa riapparire la appbar in alto una volta scrollato
            //pinned: true, //fa rimanere sempre visibile la appbar
            expandedHeight: 50, //fa espandere la appbar in base al contenuto
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Slivers", style: TextStyle(color: Colors.white),),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
                  (context, index) {
                return ListTile(
                  trailing: Icon(Icons.account_box),
                  title: Text('Item $index'),
                );
              },
            ),
          ),
          SliverGrid(delegate: SliverChildBuilderDelegate((context, index) {
            return GridTile(child: Container(
              color: Colors.blue,
              height: 100,
              child: Text("Item $index"),
            ));
          }),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {Navigator.pushNamed(context, "/Tabs");},
      child: Icon(Icons.next_week),),
    );
  }
}
