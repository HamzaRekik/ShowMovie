import 'package:booking/views/login_view.dart';
import 'package:booking/widgets/button.dart';
import 'package:flutter/material.dart';

import '../widgets/text_input.dart';

class SignUpPage extends StatelessWidget {
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
                  child: Image(
                image: AssetImage("assets/travel.jpg"),
                width: 700,
                height: 700,
              )),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          TextInput(
                            label: "Nom d'utilisateur",
                            icon: Icon(Icons.man),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextInput(
                            label: "Email",
                            icon: Icon(Icons.mail),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextInput(
                            label: "Mot de passe",
                            icon: Icon(Icons.password_rounded),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Button(label: "S'inscrire"),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }));
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
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
