import 'package:flutter/material.dart';
import 'package:video_conference_app/widgets/textField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          TProgress(
            hintText: "Nom de votre entreprise",
            prefix: Icon(FontAwesomeIcons.building),
          ),
          SizedBox(
            height: 15,
          ),
          TProgress(
            hintText: "Secteur d'activité",
            prefix: Icon(FontAwesomeIcons.industry),
          ),
          SizedBox(
            height: 15,
          ),
          TProgress(
            hintText: "Localisation",
            prefix: Icon(FontAwesomeIcons.mapMarkerAlt),
          ),
        ],
      ),
    );
  }
}
