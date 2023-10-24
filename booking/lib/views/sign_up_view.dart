import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  late SharedPreferences prefs;
  final TextEditingController _identifiantController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _motDePasseController = TextEditingController();

  Future<void> _onInscrire(BuildContext context) async {
    final identifiant = _identifiantController.text;
    final email = _emailController.text;
    final motDePasse = _motDePasseController.text;

    if (identifiant.isEmpty || email.isEmpty || motDePasse.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Veuillez remplir tous les champs'),
        ),
      );
      return;
    }

    prefs = await SharedPreferences.getInstance();
    prefs.setString('identifiant', identifiant);
    prefs.setString('email', email);
    prefs.setString('motDePasse', motDePasse);
    prefs.setBool('connecte', true);

    Navigator.of(context).pushReplacementNamed(
        '/login'); // Remplacez '/accueil' par la route de votre page d'accueil.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Image.asset(
                  "assets/travel.jpg",
                  width: 700,
                  height: 700,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      // TextInput pour le nom d'utilisateur
                      TextFormField(
                        controller: _identifiantController,
                        decoration: const InputDecoration(
                          labelText: 'Nom d\'utilisateur',
                          icon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // TextInput pour l'email
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          icon: Icon(Icons.mail),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // TextInput pour le mot de passe
                      TextFormField(
                        controller: _motDePasseController,
                        decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          icon: Icon(Icons.lock),
                        ),
                        obscureText: true, // Pour masquer le mot de passe.
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      // Bouton pour s'inscrire
                      ElevatedButton(
                        onPressed: () {
                          _onInscrire(context);
                        },
                        child: Text("S'inscrire"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3DC5F7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          fixedSize: Size(340, 50),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Se Connecter",
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3DC5F7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          fixedSize: Size(340, 50),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
