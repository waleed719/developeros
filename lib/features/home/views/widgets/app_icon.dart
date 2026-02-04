import 'package:flutter/material.dart';

class AppIcon extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const AppIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  State<AppIcon> createState() => _AppIconState();
}

class _AppIconState extends State<AppIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? 1.1 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(
                  12,
                ), // Reduced padding for Dock look
                decoration: BoxDecoration(
                  color: widget.color.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    if (_isHovered)
                      BoxShadow(
                        color: widget.color.withValues(alpha: 0.4),
                        blurRadius: 20,
                        spreadRadius: 4,
                      ),
                  ],
                ),
                child: Icon(
                  widget.icon,
                  size: 32,
                  color: Colors.white,
                ), // Smaller icon for Dock
              ),
              // Dock usually doesn't show labels always, or shows on hover?
              // Fedora dash usually doesn't show labels below icons, only tooltips.
              // But for now, let's keep it simply or remove label to match Fedora better?
              // User asked for "Fedora style app dash". Fedora dash has NO text labels.
              // Let's remove text label for cleaner dock look, or keep it if unsure?
              // Users prompt was "fedora style app dash".
              // I'll keep it simple for now, but fix the layout first.
            ],
          ),
        ),
      ),
    );
  }
}
