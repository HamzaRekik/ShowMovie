import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';

class FavouritScreen extends StatelessWidget {
  final List<Trip> favoriteTrip;
  const FavouritScreen(this.favoriteTrip, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteTrip.isEmpty) {
      return const Center(
        child: Text("Vide"),
      );
    } else {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 1.4,
        ),
        itemCount: favoriteTrip.length,
        itemBuilder: (context, index) => TripBody(
          trip: favoriteTrip[index],
        ),
      );
    }
  }
}
