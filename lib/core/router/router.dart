import 'package:go_router/go_router.dart';
import '../../features/login/views/login_view.dart';
import '../../features/shell/views/shell_view.dart';
import '../../features/about/views/about_view.dart';
import '../../features/home/views/home_view.dart';
import '../../features/skills/views/skills_view.dart';
import '../../features/projects/views/projects_view.dart';
import '../../features/terminal/views/terminal_view.dart';
import '../../features/experience/views/experience_view.dart';
import '../../features/settings/views/settings_view.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginView()),
      ShellRoute(
        builder: (context, state, child) {
          return ShellView(child: child);
        },
        routes: [
          GoRoute(path: '/home', builder: (context, state) => const HomeView()),
          GoRoute(
            path: '/about',
            builder: (context, state) => const AboutView(),
          ),
          GoRoute(
            path: '/skills',
            builder: (context, state) => const SkillsView(),
          ),
          GoRoute(
            path: '/projects',
            builder: (context, state) => const ProjectsView(),
          ),
          GoRoute(
            path: '/terminal',
            builder: (context, state) => const TerminalView(),
          ),
          GoRoute(
            path: '/experience',
            builder: (context, state) => const ExperienceView(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsView(),
          ),
        ],
      ),
    ],
  );
}
