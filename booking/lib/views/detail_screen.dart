import 'package:flutter/material.dart';
import '../models/trip.dart';

class TripDetail extends StatelessWidget {
  final Function manageFavorite;
  final Function isFavorite;
  const TripDetail(this.manageFavorite, this.isFavorite, {super.key});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as Trip;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[400],
        title: Text(
          argument.title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              argument.imageUrl,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Activities",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) => ActivitiesItem(
                    size: size,
                    activities: argument.activities[index],
                  ),
                  itemCount: argument.activities.length,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Daily programme",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("Day ${index + 1}"),
                        ),
                        title: Text(argument.program[index]),
                      ),
                      const Divider(),
                    ],
                  ),
                  itemCount: argument.program.length,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(argument.id) ? Icons.star : Icons.star_border),
        onPressed: () {
          manageFavorite(argument.id);
        },
      ),
    );
  }
}

class ActivitiesItem extends StatelessWidget {
  const ActivitiesItem({
    super.key,
    required this.size,
    required this.activities,
  });

  final Size size;
  final String activities;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(activities),
      ),
    );
  }
}
