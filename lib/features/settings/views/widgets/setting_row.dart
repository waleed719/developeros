import 'package:flutter/material.dart';

class SettingRow extends StatelessWidget {
  final String label;
  final Widget trailing;

  const SettingRow({super.key, required this.label, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        trailing,
      ],
    );
  }
}
