class Livraison {
  late int idLivraison, numeroLivreur;
  late String nomLivreur, delaiLivraison;
  late double prixLivraison;
  late DateTime dateLivraison;

  Livraison({
    required this.idLivraison,
    required this.numeroLivreur,
    required this.nomLivreur,
    required this.delaiLivraison,
    required this.dateLivraison,
    required this.prixLivraison,
  });

//doc.data())).toList()
  static Livraison fromJson(Map<String, dynamic> json) => Livraison(
        idLivraison: json['idLivraison'],
        numeroLivreur: json['numeroLivreur'],
        nomLivreur: json['nomLivreur'],
        delaiLivraison: json['delaiLivraison'],
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
