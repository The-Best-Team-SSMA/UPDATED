import 'package:flutter/material.dart';
import 'package:video_conference_app/pages/LoginPage.dart';

class AccueilPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 23, 39),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ajout de cette ligne
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            Image.asset(
              'assets/images/SSMALogoChat.png',
              width: 500, // Largeur souhaitée de l'image
              height: 500, // Hauteur souhaitée de l'image
            ),
            // Text "Welcome SSMAChat application"
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 24, color: Colors.white),
                children: [
                  TextSpan(
                    text: 'Welcome ',
                  ),
                  TextSpan(
                    text: 'SSMAChat',
                    style: TextStyle(
                      color: Colors.blue, // Couleur bleue pour "SSMAChat"
                      fontWeight: FontWeight.bold, // Mettre en gras
                    ),
                  ),
                  TextSpan(
                    text: ' application',
                  ),
                ],
              ),
            ),

            SizedBox(height: 20), // Espacement entre le texte et le bouton
            // Bouton "Start Login"
            ElevatedButton(
              onPressed: () {
                // Action à effectuer lorsque le bouton est cliqué
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Start Login'),
            ),
          ],
        ),
      ),
    );
  }
}
