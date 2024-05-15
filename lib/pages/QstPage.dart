import 'dart:collection';

import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:video_conference_app/Services/FireStore.dart'; // Importer firebase_core.dart
// Importer le service Firestore si nécessaire
// import 'package:video_conference_app/Services/FireStore.dart';

class QstPage extends StatefulWidget {
  final String title;
  final String question;
  final double initialValue;
  final List<String> questionList;
  final String buttonText;
  final HashMap<String, List<String>> selectedElements;

  QstPage({
    Key? key,
    required this.title,
    required this.question,
    required this.initialValue,
    required this.questionList,
    required this.buttonText,
    required this.selectedElements,
  }) : super(key: key);

  @override
  _QstPageState createState() => _QstPageState();
}

class _QstPageState extends State<QstPage> {
  late double sliderCurrentValue;
  late List<bool> buttonStates;

  @override
  void initState() {
    super.initState();
    sliderCurrentValue = widget.initialValue;
    buttonStates = List.generate(
      widget.questionList.length,
      (index) => false,
    );
  }

  // final FireStoreService fireStoreService =
  //     FireStoreService(); // Instancier le service Firestore si nécessaire

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 8,
                overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4),
                trackShape: RoundedRectSliderTrackShape(),
                overlayColor: Colors.transparent,
              ),
              child: Slider(
                value: sliderCurrentValue,
                max: 100,
                divisions: 100,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    sliderCurrentValue = value;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              width: 200,
              child: Text(
                widget.question,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 50),
          for (int i = 0; i < buttonStates.length; i++) ...[
            buildButton(i),
            SizedBox(height: 10),
          ],
          SizedBox(height: 150),
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(right: 7),
            child: ElevatedButton(
              onPressed: () {
                navigateToNextPage();
                // String title = widget.title;
                // String question = widget.selectedElements.keys.first;
                // Appel de la méthode Firestore pour ajouter la question et les éléments sélectionnés
                // fireStoreService.addQuestion(title, question);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.buttonText,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: InkWell(
        onTap: () {
          setState(() {
            buttonStates[index] = !buttonStates[index];
          });
        },
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: buttonStates[index] ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: Colors.blue),
          ),
          child: Center(
            child: Text(
              widget.questionList[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: buttonStates[index] ? Colors.white : Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigateToNextPage() {
    // Navigation vers la page suivante avec les paramètres appropriés
    if (widget.title == "Custom Title") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QstPage(
            title: "Custom Title2",
            question: "What's your custom question numero2?",
            initialValue: 50,
            questionList: [
              "Question A",
              "Question B",
              "Question C",
              "Question D"
            ],
            buttonText: "Next",
            // Utilisez le même HashMap pour transmettre les éléments sélectionnés
            selectedElements: widget.selectedElements,
          ),
        ),
      );
    } else if (widget.title == "Custom Title2") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QstPage(
            title: "Custom Title3",
            question: "What's your custom question numero3?",
            initialValue: 100,
            questionList: [
              "Question E",
              "Question F",
              "Question G",
              "Question H"
            ],
            buttonText: "Get started",
            // Utilisez le même HashMap pour transmettre les éléments sélectionnés
            selectedElements: widget.selectedElements,
          ),
        ),
      );
    } else {
      // Si c'est la dernière page, vous pouvez faire quelque chose ici, comme afficher un message ou revenir à la première page.
    }
  }
}
