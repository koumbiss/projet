import 'package:projet_etudes/model/Utilisateur.dart';

class Client extends Utilisateur {
  late int idClient;
  late String sexeClient;

  Client({
    required super.nomUtilisateur,
    required super.email,
    required super.adresse,
    required super.motDePasse,
    required super.age,
    required super.telephone,
    required this.idClient,
    required this.sexeClient,
  });

  static Client fromJson(Map<String, dynamic> json) => Client(
        nomUtilisateur: json['nomUtilisateur'],
        email: json['email'],
        adresse: json['adresse'],
        motDePasse: json['motDePasse'],
        age: json['age'],
        telephone: json['telephone'],
        idClient: json['idClient'],
        sexeClient: json['sexeClient'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'nomUtilisateur': nomUtilisateur,
        'email': email,
        'adresse': adresse,
        'motDePasse': motDePasse,
        'age': age,
        'telephone': telephone,
        'idClient': idClient,
        'sexeClient': sexeClient,
      };
}
