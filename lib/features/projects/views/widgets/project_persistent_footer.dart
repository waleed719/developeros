import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/project_model.dart';

class ProjectPersistentFooter extends StatelessWidget {
  final Project project;

  const ProjectPersistentFooter({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // Dark footer
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
        ),
      ),
      child: Row(
        children: [
          const Text(
            'Designed for Project Details',
            style: TextStyle(color: Colors.white54, fontSize: 13),
          ),
          const Spacer(),
          OutlinedButton.icon(
            onPressed: () async {
              final url = Uri.parse(project.githubUrl);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
            icon: const Icon(Icons.code, size: 18),
            label: const Text('Source Code'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white24),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton.icon(
            onPressed: () async {
              if (project.demoUrl != null) {
                final url = Uri.parse(project.demoUrl!);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
              }
            },
            icon: const Icon(Icons.rocket_launch, size: 18),
            label: const Text('Launch Demo'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3584E4),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
