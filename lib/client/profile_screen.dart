import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final String profileImage = "assets/maybe.jpeg";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          margin: EdgeInsets.only(left: 170),
          child: Text(
            "profile",
            style: GoogleFonts.quicksand(fontSize: 20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Text("Koumbiss BK",
                  style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                    color: Colors.black,
                    //Theme.of(context).textTheme.labelLarge,
                  ) //
                  ),
              const SizedBox(height: 20),
              const SizedBox(height: 30),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Adresses",
                  icon: LineAwesomeIcons.address_book,
                  textColor: Colors.black,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Porte-Cartes",
                  icon: LineAwesomeIcons.address_card,
                  textColor: Colors.black,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "E-mail",
                  icon: LineAwesomeIcons.mail_bulk,
                  textColor: Colors.black,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Telephone",
                  icon: LineAwesomeIcons.phone,
                  textColor: Colors.black,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Mot de passe",
                  icon: LineAwesomeIcons.fingerprint,
                  textColor: Colors.black,
                  onPress: () {}),
              const Divider(color: Colors.black),
              ProfileMenuWidget(
                title: "Se déconnecter",
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {},
              ),
              ProfileMenuWidget(
                  title: "Supprimer votre compte",
                  icon: LineAwesomeIcons.trash,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onPress,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.black.withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        title: Text(title,
            style:
                Theme.of(context).textTheme.bodyLarge?.apply(color: textColor)),
        trailing: endIcon
            ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black.withOpacity(0.1),
                ),
                child: const Icon(
                  LineAwesomeIcons.angle_right,
                  size: 18.0,
                  color: Colors.black,
                ),
              )
            : null);
  }
}
