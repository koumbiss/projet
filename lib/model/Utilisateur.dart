class Utilisateur {
  late String nomUtilisateur, telephone, email, adresse, motDePasse;
  late int age;

  Utilisateur({
    required this.nomUtilisateur,
    required this.email,
    required this.adresse,
    required this.telephone,
  });

  static Utilisateur fromJson(Map<String, dynamic> json) => Utilisateur(
      nomUtilisateur: json['nomUtilisateur'],
      email: json['email'],
      adresse: json['adresse'],
      telephone: json['telephone']);

  Map<String, dynamic> toJson() => {
        'nomUtilisateur': nomUtilisateur,
        'email': email,
        'adresse': adresse,
        'telephone': telephone
      };
}
