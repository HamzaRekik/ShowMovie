import 'package:booking/views/account_page.dart';
import 'package:flutter/material.dart';
import 'package:booking/services/authentication_service.dart';

class Settings extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  const Settings({
    Key? key,
    required this.toggleTheme,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void _navigateToProfilePage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AccountView(
          toggleTheme: widget.toggleTheme,
          isDarkMode: widget.isDarkMode,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30),
            _buildListTile(
              icon: Icons.person,
              title: "Profile",
              onTap: _navigateToProfilePage,
            ),
            SizedBox(height: 20),
            _buildListTile(
              icon: widget.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              title: "${widget.isDarkMode ? 'Dark Mode' : 'Light Mode'}",
              onTap: widget.toggleTheme,
            ),
            SizedBox(height: 20),
            Divider(height: 40),
            _buildListTile(
              icon: Icons.output_outlined,
              title: "Log Out",
              onTap: () {
                AuthenticationService().logout();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required Function onTap,
  }) {
    return ListTile(
      onTap: () => onTap(),
      leading: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 35,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
