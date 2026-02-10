import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  final Color color;
  final String tooltip;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorCircle({
    super.key,
    required this.color,
    required this.tooltip,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onTap,
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
