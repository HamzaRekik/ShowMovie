import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  late SharedPreferences prefs;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _motDePasseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(
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
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          icon: Icon(Icons.mail),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _motDePasseController,
                        decoration: const InputDecoration(
                          labelText: 'Mot de passe',
                          icon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 200),
                        child: Text("Mot de passe oublié ?"),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3DC5F7),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                          fixedSize: const Size(340, 50),
                        ),
                        child: const Text("Se Connecter"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/sign-up');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                            side: const BorderSide(color: Colors.black),
                          ),
                          fixedSize: const Size(340, 50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/google.png"),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Google",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Vous n'avez pas de compte ?"),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/sign-up');
                            },
                            child: const Text(
                              " S'inscrire",
                              style: TextStyle(
                                color: Color(0xFF3DC5F7),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      )
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
