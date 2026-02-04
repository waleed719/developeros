import 'package:flutter/material.dart';
import 'widgets/dash.dart';
import 'widgets/workspace_pager.dart';
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
          // Sliding Workspaces
          const Positioned.fill(child: WorkspacePager()),

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

          // Top Search Bar
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Container(
          //     margin: const EdgeInsets.only(top: 80), // Below GNOME top bar
          //     width: 400,
          //     height: 48,
          //     decoration: BoxDecoration(
          //       color: Colors.black26,
          //       borderRadius: BorderRadius.circular(24),
          //       border: Border.all(color: Colors.white10),
          //     ),
          //     child: const Row(
          //       children: [
          //         SizedBox(width: 16),
          //         Icon(Icons.search, color: Colors.white54, size: 20),
          //         SizedBox(width: 12),
          //         Text(
          //           'Type to search...',
          //           style: TextStyle(color: Colors.white54),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          // Bottom Dash
          // Using Positioned to ensure it stays at bottom regardless of stack sizing
          const Positioned(left: 0, right: 0, bottom: 0, child: Dash()),
        ],
      ),
    );
  }
}
