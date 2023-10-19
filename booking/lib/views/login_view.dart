import 'package:booking/views/sign_up_view.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/text_input.dart';

class LoginPage extends StatelessWidget {
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
                            label: "Email",
                            icon: Icon(Icons.mail),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextInput(
                            label: "Password",
                            icon: Icon(Icons.password_rounded),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 200),
                            child: Text("Mot de passe oublié ?"),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Button(
                            label: "Se Connecter",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage("assets/google.png"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Google",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                  side: BorderSide(color: Colors.black)),
                              fixedSize: Size(340, 50),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Vous n'avez pas de compte ?"),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return SignUpPage();
                                    }));
                                  },
                                  child: Text(
                                    " S'inscrire",
                                    style: TextStyle(
                                        color: Color(0xFF3DC5F7),
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ])
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
