class Commande {
  late int idCommande, quantiteCommande, totalCommande;
  late String modelivraison, etatCommande;
  late DateTime dateCommande;
  Commande({
    required this.idCommande,
    required this.quantiteCommande,
    required this.totalCommande,
    required this.modelivraison,
    required this.etatCommande,
    required this.dateCommande,
  });

//doc.data())).toList()
  static Commande fromJson(Map<String, dynamic> json) => Commande(
        idCommande: json['idCommande'],
        quantiteCommande: json['quantiteCommande'],
        totalCommande: json['totalCommande'],
        modelivraison: json['modelivraison'],
        etatCommande: json['etatCommande'],
        dateCommande: json['dateCommande'],
      );

  Map<String, dynamic> toJson() => {
        'idCommande': idCommande,
        'quantiteCommande': quantiteCommande,
        'totalCommande': totalCommande,
        'modelivraison': modelivraison,
        'etatCommande': etatCommande,
        'dateCommande': dateCommande,
      };
}
