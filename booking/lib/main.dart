import 'package:booking/services/authentication_service.dart';
import 'package:booking/views/login_view.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AuthenticationService().userStatus() ? '/' : '/login',
      routes: {
        '/': (context) => CircularTabBar(),
        '/login': (context) => LoginPage(),
        '/sign-up': (context) => SignUpPage(),
      },
    );
  }
}
