import 'package:flutter/material.dart';
import '../../../core/di/di.dart';
import '../controllers/settings_controller.dart';
import 'widgets/setting_row.dart';
import 'widgets/color_circle.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final SettingsController _controller = sl<SettingsController>();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_rebuild);
  }

  @override
  void dispose() {
    _controller.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Appearance',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 32),
        SettingRow(
          label: 'Dark Mode',
          trailing: Switch(
            value: _controller.themeMode == ThemeMode.dark,
            onChanged: (_) => _controller.toggleTheme(),
            activeThumbColor: const Color(0xFF3584E4),
          ),
        ),
        const Divider(height: 48, color: Colors.white10),
        Text(
          'Accent Color',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ColorCircle(
              color: const Color(0xFF3584E4),
              tooltip: 'Ocean Blue',
              isSelected: _controller.accentColor == const Color(0xFF3584E4),
              onTap: () => _controller.setAccentColor(const Color(0xFF3584E4)),
            ),
            ColorCircle(
              color: const Color(0xFF2EC27E),
              tooltip: 'Success Green',
              isSelected: _controller.accentColor == const Color(0xFF2EC27E),
              onTap: () => _controller.setAccentColor(const Color(0xFF2EC27E)),
            ),
            ColorCircle(
              color: const Color(0xFFF5C211),
              tooltip: 'Energy Yellow',
              isSelected: _controller.accentColor == const Color(0xFFF5C211),
              onTap: () => _controller.setAccentColor(const Color(0xFFF5C211)),
            ),
            ColorCircle(
              color: const Color(0xFFC061CB),
              tooltip: 'Vibrant Purple',
              isSelected: _controller.accentColor == const Color(0xFFC061CB),
              onTap: () => _controller.setAccentColor(const Color(0xFFC061CB)),
            ),
          ],
        ),
        const SizedBox(height: 48),
        const Center(
          child: Text(
            'Waleed Qamar - Portfolio 2026',
            style: TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
