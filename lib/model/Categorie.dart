import 'package:cloud_firestore/cloud_firestore.dart';

class Categorie {
  int idCategorie;
  String nomCategorie, image;
  DateTime date;

  Categorie(
      {required this.idCategorie,
      required this.nomCategorie,
      required this.image,
      required this.date});

  static Categorie fromJson(Map<String, dynamic> json) => Categorie(
        idCategorie: json['idCategorie'],
        nomCategorie: json['nomCategorie'],
        image: json['image'],
        date: (json['date'] as Timestamp).toDate(),
      );
  Map<String, dynamic> toJson() => {
        'idCategorie': idCategorie,
        'nomCategorie': nomCategorie,
        'image': image,
        'date': date,
      };
}
