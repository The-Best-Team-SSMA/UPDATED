import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      print("Error creating user: $e");
      throw e; // Renvoyer l'erreur pour que les parties utilisant cette méthode puissent réagir en conséquence
    }
  }

  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      print("Error logging in: $e");
      throw e; // Renvoyer l'erreur pour que les parties utilisant cette méthode puissent réagir en conséquence
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Error signing out: $e");
      throw e; // Renvoyer l'erreur pour que les parties utilisant cette méthode puissent réagir en conséquence
    }
  }
}
