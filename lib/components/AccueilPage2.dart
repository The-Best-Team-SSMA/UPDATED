import 'package:flutter/material.dart';

class AccueilPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 23, 39),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
              width: 400, // Largeur souhaitée de l'image
              height: 500, // Hauteur souhaitée de l'image
              child: Image.asset("assets/images/LogoPhones.png"),
            ),
            const Text(
              'Send messages and call your team',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20, // Taille de police souhaitée
                color: Colors.white, // Couleur du texte
              ),
            ),
            const SizedBox(
                height: 20), // Espacement entre le titre et le paragraphe
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'You can communicate with your work team, gaming buddies, family, etc. by simply creating a group. From there, you can initiate calls with all members. Additionally, you have the option to create a meeting code with scheduled plans.',
                style: TextStyle(
                  color: Color.fromARGB(255, 70, 65, 96), // Couleur du texte
                  fontSize: 16, // Taille de police souhaitée
                ),
                textAlign: TextAlign.center, // Alignement du texte au centre
              ),
            ),
          ],
        ),
      ),
    );
  }
}
