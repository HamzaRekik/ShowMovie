import 'package:flutter/material.dart';

import '../models/category.dart';

class CatItem extends StatelessWidget {
  const CatItem({
    Key? key,
    required this.size,
    required this.isClicked,
    required this.category,
  }) : super(key: key);

  final Size size;
  final Category category;
  final Function() isClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => isClicked(),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(category.imageUrl),
              fit: BoxFit.cover,
              opacity: 0.5,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              category.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
