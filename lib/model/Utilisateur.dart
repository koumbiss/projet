class Utilisateur {
  late String nomUtilisateur, email, adresse, motDePasse;
  late int age, telephone;

  Utilisateur({
    required this.nomUtilisateur,
    required this.email,
    required this.adresse,
    required this.motDePasse,
    required this.age,
    required this.telephone,
  });

  static Utilisateur fromJson(Map<String, dynamic> json) => Utilisateur(
      nomUtilisateur: json['nomUtilisateur'],
      email: json['email'],
      adresse: json['adresse'],
      motDePasse: json['motDePasse'],
      age: json['age'],
      telephone: json['telephone']);

  Map<String, dynamic> toJson() => {
        'nomUtilisateur': nomUtilisateur,
        'email': email,
        'adresse': adresse,
        'motDePasse': motDePasse,
        'age': age,
        'telephone': telephone
      };
}
