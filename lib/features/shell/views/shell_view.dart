import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/theme.dart';

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

class GnomeTopBar extends StatelessWidget {
  const GnomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.black.withValues(alpha: 0.8),
      child: Row(
        children: [
          InkWell(
            onTap: () => context.go('/home'),
            child: Text(
              'Activities',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          const _DigitalClock(),
          const Spacer(),
          const Icon(Icons.network_wifi, color: Colors.white, size: 16),
          const SizedBox(width: 8),
          const Icon(Icons.volume_up, color: Colors.white, size: 16),
          const SizedBox(width: 8),
          const Icon(Icons.battery_full, color: Colors.white, size: 16),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_drop_down, color: Colors.white, size: 16),
        ],
      ),
    );
  }
}

class _DigitalClock extends StatelessWidget {
  const _DigitalClock();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: Stream.periodic(
        const Duration(seconds: 1),
        (_) => DateTime.now(),
      ),
      builder: (context, snapshot) {
        final time = snapshot.data ?? DateTime.now();
        final hours = time.hour.toString().padLeft(2, '0');
        final minutes = time.minute.toString().padLeft(2, '0');
        return Text(
          '$hours:$minutes',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        );
      },
    );
  }
}
