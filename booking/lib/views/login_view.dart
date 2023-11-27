import 'package:booking/services/authentication_service.dart';
import 'package:booking/views/reset_password.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Image.asset(
                    "assets/movie.png",
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        TextField(
                          controller: email,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            icon: Icon(Icons.mail),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: password,
                          decoration: const InputDecoration(
                            labelText: 'Mot de passe',
                            icon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ResetPasswordPage();
                            }));
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 200),
                            child: Text(
                              "Mot de passe oublié ?",
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            AuthenticationService().login(
                                emailAddress: email.text,
                                password: password.text,
                                context: context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
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
                            AuthenticationService().loginWithGoogle(context);
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
                                  color: Colors.deepPurple,
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
      ),
    );
  }
}
