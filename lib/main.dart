import 'package:flutter/material.dart';
import 'core/router/router.dart';
import 'core/theme/theme.dart';
import 'core/di/di.dart' as di;
import 'features/settings/controllers/settings_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const DeveloperOS());
}

class DeveloperOS extends StatelessWidget {
  const DeveloperOS({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: di.sl<SettingsController>(),
      builder: (context, _) {
        final settings = di.sl<SettingsController>();
        return MaterialApp.router(
          title: 'Waleed Qamar',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: settings.themeMode,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
