import 'package:get_it/get_it.dart';
import '../../features/settings/controllers/settings_controller.dart';
import '../../features/terminal/controllers/terminal_controller.dart';
import '../../features/login/controllers/auth_controller.dart';
import '../../features/skills/controllers/skills_controller.dart';
import '../../features/about/controllers/about_controller.dart';
import '../../features/experience/controllers/experience_controller.dart';
import '../../features/projects/controllers/projects_controller.dart';
import '../../features/desktop/controllers/window_manager.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Controllers
  sl.registerLazySingleton(() => SettingsController());
  sl.registerLazySingleton(() => TerminalController());
  sl.registerLazySingleton(() => AuthController());
  sl.registerLazySingleton(() => SkillsController());
  sl.registerLazySingleton(() => AboutController());
  sl.registerLazySingleton(() => ExperienceController());
  sl.registerLazySingleton(() => ProjectsController());
  sl.registerLazySingleton(() => WindowManager());
}
