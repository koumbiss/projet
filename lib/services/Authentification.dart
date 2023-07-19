import 'package:firebase_auth/firebase_auth.dart';

class Authentification {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User> get user async {
    final user = FirebaseAuth.instance.currentUser!;
    return user;
  }

  Future signinn(memailController, mpasswordController) async {
    try {
      UserCredential cruduser = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: memailController.text.trim(),
              password: mpasswordController.text.trim());
      var user = FirebaseAuth.instance.currentUser;
      return "true";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("not user");
        return "l'adresse e-mail n'est pas associée à un compte";
      } else if (e.code == 'wrong-password') {
        print('WRONG PASSWORD');
        return "mot de passe incorrecte";
      } else
        print("sgniin exception ${e.code} ");
      return "$e";
    } catch (e) {
      print(e);
    }
  }
}
