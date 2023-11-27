import 'package:booking/services/authentication_service.dart';
import 'package:booking/views/account_page.dart';
import 'package:booking/views/favourits_page.dart';
import 'package:booking/views/login_view.dart';
import 'package:booking/views/settings.dart';
import 'package:booking/widgets/tab_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'views/sign_up_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Booking());
}

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  void initState() {
    AuthenticationService().checkUserStatus();
    super.initState();
  }

  bool _isDarkMode = false;

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  final ThemeData _lightTheme =
      ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light);

  final ThemeData _darkTheme =
      ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark);

  @override
  Widget build(BuildContext context) {
    final themeData = _isDarkMode ? _darkTheme : _lightTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: AuthenticationService().userStatus() ? '/' : '/login',
      routes: {
        '/': (context) => CircularTabBar(
              toggleTheme: toggleTheme,
              isDarkMode: _isDarkMode,
            ),
        '/login': (context) => LoginPage(),
        '/sign-up': (context) => SignUpPage(),
        '/profile': (context) => AccountView(
              toggleTheme: toggleTheme,
              isDarkMode: _isDarkMode,
            ),
        '/favorites': (context) => Favourits(),
        '/settings': (context) => Settings(
              toggleTheme: toggleTheme,
              isDarkMode: _isDarkMode,
            ),
      },
    );
  }
}
