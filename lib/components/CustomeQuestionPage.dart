import 'package:flutter/material.dart';

class CustomQuestionPage extends StatelessWidget {
  final String title;
  final String question;
  final double initialValue;

  const CustomQuestionPage({
    Key? key,
    required this.title,
    required this.question,
    required this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implémentez le code de votre page personnalisée ici
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              question,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Initial Value: $initialValue',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
