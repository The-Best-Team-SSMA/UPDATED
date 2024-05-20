import 'package:flutter/material.dart';
import 'package:video_conference_app/widgets/textField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<Widget> departmentFields = []; // Liste des champs de département
  int departmentCount = 2; // Nombre de champs de département initiaux

  @override
  void initState() {
    super.initState();
    // Initialisation des champs de départementt
    for (int i = 0; i < departmentCount; i++) {
      departmentFields.add(buildDepartmentField(i + 1));
    }
  }

  // Fonction pour construire un champ de département
  Widget buildDepartmentField(int departmentNumber) {
    return Column(
      children: [
        TProgress(
          hintText: "Département $departmentNumber",
          prefix: Icon(FontAwesomeIcons.users),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          // Affichage des champs de département
          Column(children: departmentFields),

          Container(
            width: double.infinity, // Pour occuper toute la largeur
            padding:
                EdgeInsets.symmetric(horizontal: 20), // Espacement horizontal
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              color: Colors.grey.withOpacity(.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ElevatedButton.icon(
              onPressed: () {
                // Ajoute un nouveau champ de département
                setState(() {
                  departmentCount++;
                  departmentFields.add(buildDepartmentField(departmentCount));
                });
              },
              icon: Icon(Icons.add, color: Colors.blue), // icône +
              label: Text(
                "Ajouter",
                style: TextStyle(color: Colors.blue), // texte "Ajouter"
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: Colors.transparent, // Fond transparent
              ),
            ),
          ),
        ],
      ),
    );
  }
}
