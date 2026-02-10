import 'package:developeros/features/projects/models/project_model.dart';
import 'package:developeros/features/projects/views/widgets/link_button.dart';
import 'package:developeros/features/projects/views/widgets/tech_chip.dart';
import 'package:flutter/material.dart';

class OverviewTab extends StatelessWidget {
  final Project project;
  const OverviewTab({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Description
          Text(
            'About',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF3584E4),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            project.description,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(height: 1.6, color: Colors.white70),
          ),
          const SizedBox(height: 32),

          // Tech Stack
          Text(
            'Tech Stack',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF3584E4),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: project.tags.map((tag) => Techchip(label: tag)).toList(),
          ),
          const SizedBox(height: 32),

          // Links
          Text(
            'Links',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF3584E4),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Linkbutton(icon: Icons.code, label: 'GitHub', onPressed: () {}),
              if (project.demoUrl != null) ...[
                const SizedBox(width: 12),
                Linkbutton(
                  icon: Icons.open_in_new,
                  label: 'Live Demo',
                  onPressed: () {},
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
