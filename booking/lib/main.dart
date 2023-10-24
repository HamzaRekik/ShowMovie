import 'package:booking/views/login_view.dart';
import 'package:flutter/material.dart';

import 'app_data.dart';
import 'models/trip.dart';
import 'views/detail_screen.dart';
import 'views/filter_screen.dart';
import 'views/sign_up_view.dart';
import 'views/tabs_screen.dart';
import 'views/trips_screen.dart';

void main() {
  runApp(const Booking());
}

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };
  late List<Trip> availableTrip = Trips_data;
  final List<Trip> _favoriteTrips = [];
  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableTrip = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId) {
    final exestingIndex =
        _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (exestingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(exestingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool _isFavorite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => TabsScreen(_favoriteTrips),
        '/login': (context) => LoginPage(),
        '/sign-up': (context) => SignUpPage(),
        '/category-trips': (context) =>
            TripsScreen(availableTrip: availableTrip),
        '/trip-deatil': (context) => TripDetail(_manageFavorite, _isFavorite),
        '/filter': (context) => FilterScreen(_filters, _changeFilters),
      },
    );
  }
}
