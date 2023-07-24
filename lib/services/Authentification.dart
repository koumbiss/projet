import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_etudes/model/Client.dart';
import 'package:projet_etudes/services/DBServices.dart';

class Authentification {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User> get user async {
    final user = FirebaseAuth.instance.currentUser!;
    return user;
  }

  Future Logout() async {
    try {
      return auth.signOut();
    } catch (e) {
      return null;
    }
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
      } else {
        print("sgniin exception ${e.code} ");
      }
      return "$e";
    } catch (e) {
      print(e);
    }
  }

  Future signup(formstate, myemailController, mypasswordController, nom,
      addresse, telephone) async {
    try {
      print('1k');
      print("email : $myemailController");
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: myemailController.trim(),
              password: mypasswordController.trim());
      print('11k');
      if (userCredential == null) {
        print('2k');
        return "false";
      } else {
        print('3k');
        await DBServices().saveClient(Client(
          idClient: userCredential.user!.uid,
          nomUtilisateur: nom.trim(),
          email: myemailController.trim(),
          adresse: addresse.trim(),
          telephone: telephone.trim(),
        ));

        final user = FirebaseAuth.instance.currentUser!;

        return "true";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("password");
        return "password";
      } else if (e.code == 'email-already-in-use') {
        print("exception user existe");
        return "l'adresse e-mail est déjà associée à un compte";
      }
    } catch (e) {
      print(" esxep : $e");
    }
  }
}
