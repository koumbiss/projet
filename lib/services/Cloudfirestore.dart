import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_etudes/model/Article.dart';
import 'package:projet_etudes/model/Collection.dart';
import 'package:projet_etudes/model/Commande.dart';
import 'package:projet_etudes/model/Item.dart';
import 'package:projet_etudes/model/Paiement.dart';
import 'package:projet_etudes/services/DBServices.dart';

class CloudFirestore {
  idincrement() async {
    try {
      print("methode idincrements");

      QuerySnapshot<Object?> querySnapshot2 =
          await FirebaseFirestore.instance.collection("Commandes").get();
      print("length : ${querySnapshot2.docs.length}");

      var len = querySnapshot2.docs.length + 1;
      return len.toString();
    } catch (e) {
      print("Exception in methode idincrements : $e");
    }
  }

  addCommandProducts(idcommande, List<Item> listeItem) async {
    try {
      for (int i = 0; i < listeItem.length; i++) {
        await DBServices().saveitem(
            Item(
              image: listeItem[i].image,
              prixunitaire: listeItem[i].prixunitaire,
              referenceArticle: listeItem[i].referenceArticle,
              nomArticle: listeItem[i].nomArticle,
              disponibilite: "disponible",
              description: listeItem[i].description,
              quantite: listeItem[i].quantite,
              prix: listeItem[i].prix,
              collection: listeItem[i].collection,
              categorie: listeItem[i].categorie,
            ),
            idcommande);
      }
    } catch (e) {
      print("Exception in methode addmypaimnt : $e");
    }
  }

  updatedata(idcommande, etat) async {
    try {
      print("methode updatedata");

      FirebaseFirestore.instance
          .collection("Commandes")
          .doc("${idcommande}")
          .update({"etatCommande": etat});
    } catch (e) {
      print("Exception in methode idincrements : $e");
    }
  }

  addCommand(total, idc, qte, service) async {
    try {
      print("debut");
      await DBServices().saveCommand(
          Commande(
              Idclient: FirebaseAuth.instance.currentUser!.uid,
              idCommande: int.parse(idc),
              quantiteCommande: qte,
              totalCommande: total,
              dateCommande: DateTime.now(),
              modelivraison: service,
              etatCommande: "n'est pas encore confirmée"),
          idc);
      print("fin");
    } catch (e) {
      print("Exception in methode addmypaimnt : $e");
    }
  }

  addPaiement(idcommande, mode, compteR, ref) async {
    print(" Reglement");

    try {
      await DBServices().savePaiement(Paiement(
        idcommande: idcommande,
        comptePaiement: compteR,
        modePaiement: mode,
        idPaiement: ref,
      ));
    } catch (e) {
      print("Exception in methode addmypaimnt : $e");
    }
  }

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

  getTypeuser(id) async {
    DocumentReference dat =
        await FirebaseFirestore.instance.collection("Clients").doc(id);
    print(" result1 : ${dat}");
    DocumentSnapshot<Object?> querySnapshot1 = await dat.get();
    print("query1: ${querySnapshot1}");
    final _docData1 = await querySnapshot1.data();
    print(" doc1 : ${_docData1}");
    if (_docData1 == null) {
      DocumentReference dat1 =
          await FirebaseFirestore.instance.collection("Fournisseur").doc(id);
      print(" result2 : ${dat1}");
      DocumentSnapshot<Object?> querySnapshot = await dat1.get();
      print("query2: ${querySnapshot}");
      final _docData = await querySnapshot.data();
      print(" doc2 : ${_docData}");
      return false;
    } else {
      return true;
    }
  }

  updateadresse(idclient, value) async {
    try {
      print("methode updatedata");

      FirebaseFirestore.instance
          .collection("Clients")
          .doc(idclient)
          .update({"adresse": value});
    } catch (e) {
      print("Exception in methode update : $e");
    }
  }
}
