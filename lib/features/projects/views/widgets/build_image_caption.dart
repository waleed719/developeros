import 'package:developeros/features/projects/models/project_model.dart';
import 'package:flutter/material.dart';

class Buildimagecaption extends StatelessWidget {
  final int index;
  final Project project;
  const Buildimagecaption({
    super.key,
    required this.index,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final caption = project.galleryImages[index].caption!;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: Colors.white70, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              caption,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
