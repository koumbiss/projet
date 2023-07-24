import 'package:projet_etudes/model/Utilisateur.dart';

class Client extends Utilisateur {
  late String idClient;

  Client({
    required super.nomUtilisateur,
    required super.email,
    required super.adresse,
    required super.telephone,
    required this.idClient,
  });

  static Client fromJson(Map<String, dynamic> json) => Client(
        nomUtilisateur: json['nomUtilisateur'],
        email: json['email'],
        adresse: json['adresse'],
        telephone: json['telephone'],
        idClient: json['idClient'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'nomUtilisateur': nomUtilisateur,
        'email': email,
        'adresse': adresse,
        'telephone': telephone,
        'idClient': idClient,
      };
}
