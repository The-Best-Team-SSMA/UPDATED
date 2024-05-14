import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  // get collection of questions
  final CollectionReference questions =
      FirebaseFirestore.instance.collection(('questions'));
  // CREATE

  Future<void> addQuestion(String title, String question) {
    return questions.add({'title': title, 'quesiton': question});
  }
  // READ

  // UPDATE

  //DELETE
}
