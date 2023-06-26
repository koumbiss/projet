import 'package:cloud_firestore/cloud_firestore.dart';

class Facture {
  late int idLivraison, numeroLivreur;
  late String nomLivreur;
  late double prixLivraison;
  late DateTime dateLivraison, delaiLivraison;

  Facture({
    required this.idLivraison,
    required this.numeroLivreur,
    required this.nomLivreur,
    required this.delaiLivraison,
    required this.dateLivraison,
    required this.prixLivraison,
  });

//doc.data())).toList()
  static Facture fromJson(Map<String, dynamic> json) => Facture(
        idLivraison: json['idLivraison'],
        numeroLivreur: json['numeroLivreur'],
        nomLivreur: json['nomLivreur'],
        delaiLivraison: (json['delaiLivraison'] as Timestamp).toDate(),
        dateLivraison: json['dateLivraison'],
        prixLivraison: json['prixLivraison'],
      );

  Map<String, dynamic> toJson() => {
        'idLivraison': idLivraison,
        'numeroLivreur': numeroLivreur,
        'nomLivreur': nomLivreur,
        'delaiLivraison': delaiLivraison,
        'dateLivraison': dateLivraison,
        'prixLivraison': prixLivraison,
      };
}
