import 'package:cloud_firestore/cloud_firestore.dart';

class Collection {
  int idCollection;
  String nomCollection, image;
  DateTime Date;

  Collection(
      {required this.idCollection,
      required this.nomCollection,
      required this.image,
      required this.Date});

  static Collection fromJson(Map<String, dynamic> json) => Collection(
        idCollection: json['idCollection'],
        nomCollection: json['nomCollection'],
        image: json['image'],
        Date: (json['Date'] as Timestamp).toDate(),
      );
  Map<String, dynamic> toJson() => {
        'idCollection': idCollection,
        'nomCollection': nomCollection,
        'image': image,
        'Date': Date,
      };
}
