import 'package:cloud_firestore/cloud_firestore.dart';

class Collection {
  String nom, image;
  DateTime Date;

  Collection({required this.nom, required this.image, required this.Date});

  static Collection fromJson(Map<String, dynamic> json) => Collection(
        nom: json['nom'],
        image: json['image'],
        Date: (json['Date'] as Timestamp).toDate(),
      );
  Map<String, dynamic> toJson() => {
        'nom': nom,
        'image': image,
        'Date': Date,
      };
}
