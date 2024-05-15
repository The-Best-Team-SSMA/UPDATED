import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_conference_app/pages/ChattingPage.dart';

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
              onPressed: navigateToNextPage,
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
    // Création du HashMap pour stocker les éléments sélectionnés
    final HashMap<String, List<String>> selectedElements =
        HashMap<String, List<String>>();
    List<String> selectedQuestions = [];

    // Parcours de la liste des questions pour récupérer les éléments sélectionnés
    for (int i = 0; i < buttonStates.length; i++) {
      if (buttonStates[i]) {
        selectedQuestions.add(widget.questionList[i]);
      }
    }

    // Ajout des éléments sélectionnés au HashMap
    selectedElements[widget.title] = selectedQuestions;

    // Affichage du HashMap dans le terminal
    selectedElements.forEach((title, questions) {
      print("Title: $title");
      print("Questions: ${questions.join(", ")}");
    });

    // Ajout des données à la base de données Firestore
    CollectionReference questionsRef =
        FirebaseFirestore.instance.collection("questions");
    questionsRef.add({
      'title': widget.title,
      'questions': selectedQuestions.join(
          ", "), // Concaténation des questions en une chaîne de caractères
    });

    // Navigation vers la prochaine page
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
            selectedElements: selectedElements,
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
            selectedElements: selectedElements,
          ),
        ),
      );
    } else if (widget.title == "Custom Title3") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ChattingPage(), // Naviguer vers la page ChattingPage
        ),
      );
    }
  }
}

// Créez la page ChattingPage avec les widgets appropriés