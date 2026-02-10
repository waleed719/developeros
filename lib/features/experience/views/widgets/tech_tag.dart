import 'package:flutter/material.dart';

class TechTag extends StatefulWidget {
  final String text;

  const TechTag({super.key, required this.text});

  @override
  State<TechTag> createState() => _TechTagState();
}

class _TechTagState extends State<TechTag> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.08 : 1.0,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOutCubic,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: _isHovered
                ? const Color(0xFF3584E4).withValues(alpha: 0.2)
                : Colors.white10,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: _isHovered
                  ? const Color(0xFF3584E4).withValues(alpha: 0.5)
                  : Colors.white12,
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 11,
              color: _isHovered ? const Color(0xFF3584E4) : Colors.white,
              fontWeight: _isHovered ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
