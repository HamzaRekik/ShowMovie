import 'package:flutter/material.dart';

class FavouriteMovie extends StatelessWidget {
  const FavouriteMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 200,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "hom",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("hello"),
            ),
          ],
        ),
      ),
    );
  }
}
