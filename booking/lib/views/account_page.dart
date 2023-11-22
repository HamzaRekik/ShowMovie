import 'package:booking/services/authentication_service.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/travel.jpg'), // Add your image asset
            ),
            SizedBox(height: 20),
            Text(
              'Name: John Doe',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Email: john.doe@example.com',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                AuthenticationService().logout();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
