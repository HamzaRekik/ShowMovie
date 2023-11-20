import 'package:booking/services/authentication_service.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  ListTile listTileMethod(IconData x, String z, Function onTabLink) {
    return ListTile(
      leading: Icon(
        x,
        color: Colors.blue[400],
        size: 30,
      ),
      title: Text(
        z,
        style: const TextStyle(
          fontSize: 25,
          color: Color.fromARGB(200, 0, 0, 0),
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => onTabLink(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            color: Colors.yellow,
            child: const Text(
              "Your tour guide",
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          listTileMethod(
            Icons.card_travel,
            "Trips",
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          listTileMethod(
            Icons.filter_list,
            "Filter",
            () {
              Navigator.of(context).pushReplacementNamed("/filter");
            },
          ),
          listTileMethod(
            Icons.logout_rounded,
            "Deconnexion",
            () {
              AuthenticationService().logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/login", (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
