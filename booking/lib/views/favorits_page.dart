import 'package:flutter/material.dart';

class FavoritsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Favourite Movies",
          style: TextStyle(color: Colors.deepPurple),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 15,
        itemBuilder: (context, index) {
          return FavouriteMovie();
        },
      ),
    );
  }
}

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "hom",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("hello"),
            ),
          ],
        ),
      ),
    );
  }
}
