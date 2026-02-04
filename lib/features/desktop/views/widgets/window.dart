import 'package:flutter/material.dart';
import '../../controllers/window_manager.dart';

class DesktopWindow extends StatefulWidget {
  final WindowEntry entry;
  final VoidCallback onClose;
  final Function(Offset) onDragEnd;
  final VoidCallback onTap;

  const DesktopWindow({
    super.key,
    required this.entry,
    required this.onClose,
    required this.onDragEnd,
    required this.onTap,
  });

  @override
  State<DesktopWindow> createState() => _DesktopWindowState();
}

class _DesktopWindowState extends State<DesktopWindow> {
  late Offset _position;

  @override
  void initState() {
    super.initState();
    _position = widget.entry.position;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _position.dx,
      top: _position.dy,
      child: GestureDetector(
        onTap: widget.onTap,
        onPanUpdate: (details) {
          setState(() {
            _position += details.delta;
          });
        },
        onPanEnd: (_) {
          widget.onDragEnd(_position);
        },
        child: Container(
          width: widget.entry.size.width,
          height: widget.entry.size.height,
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E), // Dark theme background
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 24,
                spreadRadius: 8,
              ),
            ],
          ),
          child: Column(
            children: [
              // Title Bar
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFF2D2D2D), // Dark title bar
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Row(
                  children: [
                    Icon(widget.entry.icon, size: 16, color: Colors.white70),
                    const SizedBox(width: 8),
                    Text(
                      widget.entry.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    // Close Button
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: widget.onClose,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Colors.transparent, // Or drag handle color
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Content
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                  child: widget.entry.content,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
