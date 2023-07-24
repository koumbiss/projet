class Paiement {
  late String idPaiement;
  late String idcommande, modePaiement, comptePaiement;

  Paiement({
    required this.idPaiement,
    required this.idcommande,
    required this.modePaiement,
    required this.comptePaiement,
  });
//doc.data())).toList()
  static Paiement fromJson(Map<String, dynamic> json) => Paiement(
        idPaiement: json['idPaiement'],
        idcommande: json['idcommande'],
        modePaiement: json['modePaiement'],
        comptePaiement: json['comptePaiement'],
      );

  Map<String, dynamic> toJson() => {
        'idPaiement': idPaiement,
        'idcommande': idcommande,
        'modePaiement': modePaiement,
        ' comptePaiement': comptePaiement,
      };
}
