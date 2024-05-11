import 'package:flutter/material.dart';

class AccueilPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 23, 39),
      body: Center(
        child: Container(
          width: 800, // Largeur souhaitée de l'image
          height: 800, // Hauteur souhaitée de l'image
          child: Image.asset("assets/images/SSMAChats.png"),
        ),
      ),
    );
  }
}
