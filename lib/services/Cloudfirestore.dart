import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projet_etudes/model/Article.dart';
import 'package:projet_etudes/model/Collection.dart';
import 'package:projet_etudes/services/DBServices.dart';

class CloudFirestore {
  checkquantity(id, catgorie) async {
    print(catgorie);
    try {
      DocumentSnapshot<Map<String, dynamic>> feed =
          await FirebaseFirestore.instance.collection("Articles").doc(id).get();

      print(" resulytat ${feed["quantite"]}");

      print("qunatite${feed["quantite"]}");
      print("DEbut ");

      return feed["quantite"];
    } catch (e) {
      print(" on a une exception $e");
    }
  }

  addCollection(nom, upl, date) async {
    try {
      var url = await (await upl).ref.getDownloadURL();
      print("url:$url");
      await DBServices().saveCollection(
        Collection(nomCollection: nom, image: url, date: date),
      );
    } catch (e) {
      print("Exception in methode setlocation : $e");
    }
  }

  addArticle(referenceArticle, nomArticle, prix, quantite, description, upl,
      collection, categorie) async {
    try {
      var url = await (await upl).ref.getDownloadURL();
      print("url:$url");
      await DBServices().saveArticle(
        Article(
            referenceArticle: referenceArticle,
            nomArticle: nomArticle,
            disponibilite: "disponible",
            description: description,
            image: url,
            quantite: quantite,
            prix: prix,
            collection: collection,
            categorie: categorie),
      );
    } catch (e) {
      print("Exception in methode addarticle : $e");
    }
  }
}
