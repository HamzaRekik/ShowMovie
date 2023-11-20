import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';

class TripsScreen extends StatefulWidget {
  final List<Trip> availableTrip;

  const TripsScreen({
    Key? key,
    required this.availableTrip,
  }) : super(key: key);

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  late List<Trip> displayTrips;
  late Map<String, String> argument;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    argument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    displayTrips = widget.availableTrip
        .where((trip) => trip.categories.contains(argument['id']!))
        .toList();
  }

  // void _removeTrip(String tripId) {
  //   setState(() {
  //     displayTrips.removeWhere((trip) => trip.id == tripId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[400],
        title: Text(
          argument['title']!,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 1.4,
        ),
        itemCount: displayTrips.length,
        itemBuilder: (context, index) => TripBody(
          trip: displayTrips[index],
        ),
      ),
    );
  }
}
