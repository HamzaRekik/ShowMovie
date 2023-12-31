import 'package:booking/services/authentication_service.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SingleChildScrollView(
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
                    "assets/movie.png",
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: username,
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
                          controller: email,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            icon: Icon(Icons.mail),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                            labelText: 'Mot de passe',
                            icon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        // Bouton pour s'inscrire
                        ElevatedButton(
                          onPressed: () {
                            AuthenticationService().createAccount(
                                emailAddress: email.text,
                                password: password.text,
                                username: username.text,
                                context: context);
                          },
                          child: Text("S'inscrire"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
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
                            Navigator.of(context)
                                .pushReplacementNamed('/login');
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
                            backgroundColor: Colors.deepPurple,
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
      ),
    );
  }
}
