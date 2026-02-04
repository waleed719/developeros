import 'package:flutter/material.dart';
import '../../../../core/di/di.dart';
import '../../../about/views/about_view.dart';
import '../../../skills/views/skills_view.dart';
import '../../../projects/views/projects_view.dart';
import '../../../terminal/views/terminal_view.dart';
import '../../../experience/views/experience_view.dart';
import '../../../settings/views/settings_view.dart';
import '../../../desktop/controllers/window_manager.dart';
import 'app_icon.dart';

class Dash extends StatelessWidget {
  const Dash({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 32),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 20,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppIcon(
              icon: Icons.person_outline,
              label: 'About',
              color: const Color(0xFF3584E4),
              onTap: () {
                sl<WindowManager>().openWindow(
                  WindowEntry(
                    id: 'about',
                    title: 'About',
                    icon: Icons.person_outline,
                    content: const AboutView(),
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
            AppIcon(
              icon: Icons.analytics_outlined,
              label: 'Skills',
              color: const Color(0xFF2EC27E),
              onTap: () {
                sl<WindowManager>().openWindow(
                  WindowEntry(
                    id: 'skills',
                    title: 'Skills',
                    icon: Icons.analytics_outlined,
                    content: const SkillsView(),
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
            AppIcon(
              icon: Icons.folder_outlined,
              label: 'Projects',
              color: const Color(0xFFF5C211),
              onTap: () {
                sl<WindowManager>().openWindow(
                  WindowEntry(
                    id: 'projects',
                    title: 'Projects',
                    icon: Icons.folder_outlined,
                    content: const ProjectsView(),
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
            AppIcon(
              icon: Icons.terminal,
              label: 'Terminal',
              color: const Color(0xFF1E1E1E),
              onTap: () {
                sl<WindowManager>().openWindow(
                  WindowEntry(
                    id: 'terminal',
                    title: 'Terminal',
                    icon: Icons.terminal,
                    content: const TerminalView(),
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
            AppIcon(
              icon: Icons.timeline,
              label: 'Experience',
              color: const Color(0xFFC061CB),
              onTap: () {
                sl<WindowManager>().openWindow(
                  WindowEntry(
                    id: 'experience',
                    title: 'Experience',
                    icon: Icons.timeline,
                    content: const ExperienceView(),
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
            AppIcon(
              icon: Icons.settings_outlined,
              label: 'Settings',
              color: Colors.grey,
              onTap: () {
                sl<WindowManager>().openWindow(
                  WindowEntry(
                    id: 'settings',
                    title: 'Settings',
                    icon: Icons.settings_outlined,
                    content: const SettingsView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
