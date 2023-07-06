import 'package:cloud_firestore/cloud_firestore.dart';

class Collection {
  String nomCollection, image;
  DateTime date;

  Collection(
      {required this.nomCollection, required this.image, required this.date});

  static Collection fromJson(Map<String, dynamic> json) => Collection(
        nomCollection: json['nomCollection'],
        image: json['image'],
        date: (json['date'] as Timestamp).toDate(),
      );
  Map<String, dynamic> toJson() => {
        'nomCollection': nomCollection,
        'image': image,
        'date': date,
      };
}
