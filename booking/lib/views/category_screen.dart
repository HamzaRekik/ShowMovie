import 'package:flutter/material.dart';

import '../app_data.dart';
import '../widgets/category_item.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 7 / 8,
      ),
      itemCount: Categories_data.length,
      itemBuilder: (context, index) => CatItem(
        size: size,
        isClicked: () {
          Navigator.of(context).pushNamed(
            '/category-trips',
            arguments: {
              'id': Categories_data[index].id,
              'title': Categories_data[index].title,
            },
          );
        },
        category: Categories_data[index],
      ),
    );
  }
}
