import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label, required Future<void> Function() onPressed,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF3DC5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        fixedSize: Size(340, 50),
      ),
    );
  }
}
