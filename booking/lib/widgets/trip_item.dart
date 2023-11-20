import 'package:flutter/material.dart';
import '../models/trip.dart';

class TripBody extends StatelessWidget {
  const TripBody({
    super.key,
    required this.trip,
  });
  final Trip trip;

  void inSelect(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      '/trip-deatil',
      arguments: trip,
    )
        .then((value) {
      if (value != null) {
        print(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => inSelect(context),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 25,
              color: Colors.black26,
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  image: DecorationImage(
                    image: NetworkImage(trip.imageUrl),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      trip.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.today,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text('${trip.duration} days'),
                    ],
                  ),
                  Row(
                    children: [
                      trip.season.name == 'Winter'
                          ? const Icon(
                              Icons.cloud,
                              color: Colors.blue,
                            )
                          : const Icon(
                              Icons.sunny,
                              color: Colors.blue,
                            ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(trip.season.name),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.family_restroom,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(trip.tripType.name),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
