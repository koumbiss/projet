class Paiement {
  late int idPaiement;
  late String moyenPaiement, modePaiement, comptePaiement;

  Paiement({
    required this.idPaiement,
    required this.moyenPaiement,
    required this.modePaiement,
    required this.comptePaiement,
  });
//doc.data())).toList()
  static Paiement fromJson(Map<String, dynamic> json) => Paiement(
        idPaiement: json['idPaiement'],
        moyenPaiement: json['moyenPaiement'],
        modePaiement: json['modePaiement'],
        comptePaiement: json['comptePaiement'],
      );

  Map<String, dynamic> toJson() => {
        'idPaiement': idPaiement,
        'moyenPaiement': moyenPaiement,
        'modePaiement': modePaiement,
        ' comptePaiement': comptePaiement,
      };
}
