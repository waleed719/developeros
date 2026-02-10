import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'digital_clock.dart';

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
          const DigitalClock(),
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
