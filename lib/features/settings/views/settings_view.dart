import 'package:flutter/material.dart';
import '../../../core/di/di.dart';
import '../controllers/settings_controller.dart';

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
        _buildSettingRow(
          'Dark Mode',
          Switch(
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
            _buildColorCircle(const Color(0xFF3584E4), 'Fedora Blue'),
            _buildColorCircle(const Color(0xFF2EC27E), 'GNOME Green'),
            _buildColorCircle(const Color(0xFFF5C211), 'Solar Yellow'),
            _buildColorCircle(const Color(0xFFC061CB), 'Matcha Purple'),
          ],
        ),
        const SizedBox(height: 48),
        const Center(
          child: Text(
            'Developer OS v1.0.0 (Fedora Edition)',
            style: TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingRow(String label, Widget trailing) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        trailing,
      ],
    );
  }

  Widget _buildColorCircle(Color color, String tooltip) {
    final isSelected = _controller.accentColor == color;
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: () => _controller.setAccentColor(color),
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? Colors.white : Colors.transparent,
              width: 3,
            ),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: color.withValues(alpha: 0.4),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
