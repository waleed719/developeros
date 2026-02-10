import 'package:flutter/material.dart';

class FileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const FileItem({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 32),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.white70),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
