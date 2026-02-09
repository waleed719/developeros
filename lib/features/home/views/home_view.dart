import 'package:flutter/material.dart';
import 'widgets/dash.dart';
import '../../desktop/controllers/window_manager.dart';
import '../../desktop/views/widgets/window.dart';
import '../../../core/di/di.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Window Layer
          AnimatedBuilder(
            animation: sl<WindowManager>(),
            builder: (context, _) {
              final windows = sl<WindowManager>().windows;
              return Stack(
                children: [
                  for (final window in windows)
                    DesktopWindow(
                      key: ValueKey(window.id),
                      entry: window,
                      onClose: () => sl<WindowManager>().closeWindow(window.id),
                      onDragEnd: (newPos) => sl<WindowManager>()
                          .updateWindowPosition(window.id, newPos),
                      onTap: () => sl<WindowManager>().bringToFront(window.id),
                    ),
                ],
              );
            },
          ),

          const Positioned(left: 0, right: 0, bottom: 0, child: Dash()),
        ],
      ),
    );
  }
}
