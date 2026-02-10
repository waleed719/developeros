import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DigitalClockLarge extends StatelessWidget {
  const DigitalClockLarge({super.key});

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
