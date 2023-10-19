import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.label,
    required this.icon,
  });

  final String label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            label: Text(label),
            suffixIcon: icon,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32))));
  }
}
