import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:projet_etudes/model/Article.dart';
import 'package:projet_etudes/model/Collection.dart';

class DBServices {
  final CollectionReference Col =
      FirebaseFirestore.instance.collection("Collections");
  final CollectionReference Art =
      FirebaseFirestore.instance.collection("Articles");
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

  Future saveArticle(Article article) async {
    try {
      await Art.add(article.toJson());
      print("object");
      return true;
    } catch (e) {
      print("Exception in methode saveArticle : $e");
      return false;
    }
  }
}
