import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:projet_etudes/model/Collection.dart';

class DBServices {
  final CollectionReference Col =
      FirebaseFirestore.instance.collection("Collections");
  Future saveCollection(Collection col) async {
    try {
      await Col.add(col.toJson());
      print("object");
      return true;
    } catch (e) {
      print("Exception in methode saveCollection : $e");
      return false;
    }
  }
}
