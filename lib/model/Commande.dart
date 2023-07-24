class Commande {
  late int idCommande, quantiteCommande, totalCommande;
  late String modelivraison, Idclient, etatCommande;
  late DateTime dateCommande;
  Commande({
    required this.idCommande,
    required this.Idclient,
    required this.quantiteCommande,
    required this.totalCommande,
    required this.modelivraison,
    required this.etatCommande,
    required this.dateCommande,
  });

//doc.data())).toList()
  static Commande fromJson(Map<String, dynamic> json) => Commande(
        idCommande: json['idCommande'],
        Idclient: json['Idclient'],
        quantiteCommande: json['quantiteCommande'],
        totalCommande: json['totalCommande'],
        modelivraison: json['modelivraison'],
        etatCommande: json['etatCommande'],
        dateCommande: json['dateCommande'],
      );

  Map<String, dynamic> toJson() => {
        'idCommande': idCommande,
        'Idclient': Idclient,
        'quantiteCommande': quantiteCommande,
        'totalCommande': totalCommande,
        'modelivraison': modelivraison,
        'etatCommande': etatCommande,
        'dateCommande': dateCommande,
      };
}
