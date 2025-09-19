import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget titleText; // Tipo corretto: Widget

  const CustomAppBar({required this.titleText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleText,
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  //l secondo errore, The argument type 'CustomAppBar' can't be assigned to the
// parameter type 'PreferredSizeWidget?', indica che il widget Scaffold (che solitamente ha la proprietà appBar)
// non sa la dimensione della tua CustomAppBar.
// Il Scaffold ha bisogno di una dimensione predefinita per posizionare gli altri elementi dello schermo
// correttamente. Per risolvere, devi implementare l'interfaccia PreferredSizeWidget e definire la dimensione
// preferita della tua app bar.
}
