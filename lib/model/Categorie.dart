import 'package:cloud_firestore/cloud_firestore.dart';

class Categorie {
  int idCategorie;
  String nomCategorie, image;
  DateTime Date;

  Categorie(
      {required this.idCategorie,
      required this.nomCategorie,
      required this.image,
      required this.Date});

  static Categorie fromJson(Map<String, dynamic> json) => Categorie(
        idCategorie: json['idCategorie'],
        nomCategorie: json['nomCategorie'],
        image: json['image'],
        Date: (json['Date'] as Timestamp).toDate(),
      );
  Map<String, dynamic> toJson() => {
        'idCategorie': idCategorie,
        'nomCategorie': nomCategorie,
        'image': image,
        'Date': Date,
      };
}
