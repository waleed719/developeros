import 'package:flutter/material.dart';
import '../../../core/di/di.dart';
import '../controllers/about_controller.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<AboutController>();
    final profile = controller.profile;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left: Avatar and Title
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white10,
                    child: Icon(Icons.person, size: 100, color: Colors.white),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    profile.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    profile.title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 48),
            // Right: Bio and Highlights
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'System Overview',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xFF3584E4),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    profile.bio,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Core Modules',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xFF3584E4),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: profile.highlights
                        .map((h) => _buildHighlightChip(context, h))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlightChip(BuildContext context, String text) {
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
