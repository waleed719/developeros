import 'package:flutter/material.dart';

class HighlightChip extends StatelessWidget {
  final String text;

  const HighlightChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
      ),
      child: Text(text, style: const TextStyle(fontSize: 13)),
    );
  }
}
