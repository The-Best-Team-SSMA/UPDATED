import 'package:flutter/material.dart';
import 'package:video_conference_app/widgets/textField.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          TProgress(
            hintText: "Nom",
            prefix: Icon(Icons.contacts),
          ),
          SizedBox(
            height: 15,
          ),
          TProgress(
            hintText: "Prénom",
            prefix: Icon(Icons.contacts),
          ),
          SizedBox(
            height: 15,
          ),
          TProgress(
            hintText: "Poste",
            prefix: Icon(Icons.work),
          ),
        ],
      ),
    );
  }
}
