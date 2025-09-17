import 'package:flutter/material.dart';

class QuintaPagina extends StatelessWidget {
  List<int> lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  QuintaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quinta Pagina"),
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.wallet)),
          IconButton(onPressed: () => {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () => {}, icon: Icon(Icons.logout)),
        ],
      ),
      body: ListView(
        children: [
          for (var i in lista)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const ListTile(
                tileColor: Colors.grey,
                trailing: Icon(Icons.drag_handle),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=64",
                  ),
                  radius: 30,
                ),
                title: Text("Luca Rossi"),
                subtitle: Text("Ciao Sono Nuovo"),
              ),
            ),
        ],
      ),
    );
  }
}
