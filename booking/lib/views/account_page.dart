import 'package:booking/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountView extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  const AccountView(
      {super.key, required this.toggleTheme, required this.isDarkMode});
  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Text('Account'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user?.photoURL ??
                  "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
            ),
            SizedBox(height: 20),
            Text(
              user?.displayName ?? "",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              user?.email ?? "",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: () async {
                AuthenticationService().logout();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
