// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:projet_etudes/model/Article.dart';
import 'package:projet_etudes/model/Client.dart';
import 'package:projet_etudes/model/Collection.dart';
import 'package:projet_etudes/model/Commande.dart';
import 'package:projet_etudes/model/Item.dart';
import 'package:projet_etudes/model/Paiement.dart';

class DBServices {
  // ignore: non_constant_identifier_names
  final CollectionReference Col =
      FirebaseFirestore.instance.collection("Collections");
  final CollectionReference commandecol =
      FirebaseFirestore.instance.collection("Commandes");

  final CollectionReference paiecol =
      FirebaseFirestore.instance.collection("Paiements");
  final CollectionReference clientcol =
      FirebaseFirestore.instance.collection("Clients");
  // ignore: non_constant_identifier_names
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

  Future saveitem(Item item, id) async {
    try {
      await commandecol.doc(id).collection("Item").add(item.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future savePaiement(Paiement paiement) async {
    print(" Reglement");
    try {
      await paiecol.add(paiement.toJson());
      return true;
    } catch (e) {
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

  Future saveClient(Client client) async {
    try {
      print("here");
      await clientcol.doc(client.idClient).set(client.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future saveCommand(Commande cmnd, id) async {
    try {
      print("debut2");
      await commandecol.doc(id).set(cmnd.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
