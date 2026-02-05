import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/theme.dart';
import '../../../core/di/di.dart';
import '../controllers/auth_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(AppTheme.backgroundPath, fit: BoxFit.cover),
          ),

          // Blur overlay
          Positioned.fill(
            child: Container(color: Colors.black.withValues(alpha: 0.3)),
          ),

          // Central content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _DigitalClockLarge(),
                const SizedBox(height: 48),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white24,
                  backgroundImage: const AssetImage(
                    'assets/images/profilePic.png',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Waleed Qamar',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    sl<AuthController>().login();
                    context.go('/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3584E4),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Unlock'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DigitalClockLarge extends StatelessWidget {
  const _DigitalClockLarge();

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
        final date = "${_getMonth(time.month)} ${time.day}";
        return Column(
          children: [
            Text(
              '$hours:$minutes',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 80,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              date,
              style: GoogleFonts.inter(
                color: Colors.white70,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        );
      },
    );
  }

  String _getMonth(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}
