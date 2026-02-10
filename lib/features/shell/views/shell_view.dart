import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import 'widgets/gnome_top_bar.dart';

class ShellView extends StatelessWidget {
  final Widget child;

  const ShellView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(AppTheme.backgroundPath, fit: BoxFit.cover),
          ),

          // Content Area
          Padding(
            padding: const EdgeInsets.only(top: 32.0), // Space for top bar
            child: child,
          ),

          // GNOME Top Bar
          const Positioned(top: 0, left: 0, right: 0, child: GnomeTopBar()),
        ],
      ),
    );
  }
}
