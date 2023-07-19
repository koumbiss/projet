class Facture {
  late int idFacture;
  late String recu, image;
  late int totalApayer;

  Facture({
    required this.idFacture,
    required this.recu,
    required this.image,
    required this.totalApayer,
  });

//doc.data())).toList()
  static Facture fromJson(Map<String, dynamic> json) => Facture(
        idFacture: json['idFacture'],
        recu: json['recu'],
        image: json['image'],
        totalApayer: json['totalApayer'],
      );

  Map<String, dynamic> toJson() => {
        'idFacture': idFacture,
        'recu': recu,
        'image': image,
        'totalApayer': totalApayer,
      };
}
