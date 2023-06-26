import 'package:cloud_firestore/cloud_firestore.dart';

class Collection {
  int idCollection;
  String nomCollection, image;
  DateTime date;

  Collection(
      {required this.idCollection,
      required this.nomCollection,
      required this.image,
      required this.date});

  static Collection fromJson(Map<String, dynamic> json) => Collection(
        idCollection: json['idCollection'],
        nomCollection: json['nomCollection'],
        image: json['image'],
        date: (json['date'] as Timestamp).toDate(),
      );
  Map<String, dynamic> toJson() => {
        'idCollection': idCollection,
        'nomCollection': nomCollection,
        'image': image,
        'date': date,
      };
}
