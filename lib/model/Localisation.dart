class Localisation {
  String adresse, latitudeLongitude;

  Localisation({
    required this.adresse,
    required this.latitudeLongitude,
  });
//doc.data())).toList()
  static Localisation fromJson(Map<String, dynamic> json) => Localisation(
        adresse: json['adresse'],
        latitudeLongitude: json['latitudeLongitude'],
      );

  Map<String, dynamic> toJson() => {
        'adresse': adresse,
        'latitudeLongitude': latitudeLongitude,
      };
}
