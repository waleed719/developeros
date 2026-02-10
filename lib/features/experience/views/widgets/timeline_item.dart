import 'package:flutter/material.dart';
import '../../models/experience_models.dart';
import 'tech_tag.dart';

class TimelineItem extends StatefulWidget {
  final ExperienceItem item;
  final bool isLast;

  const TimelineItem({super.key, required this.item, required this.isLast});

  @override
  State<TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<TimelineItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Column
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFF3584E4),
                  shape: BoxShape.circle,
                ),
              ),
              if (!widget.isLast)
                Expanded(child: Container(width: 2, color: Colors.white24)),
            ],
          ),
          const SizedBox(width: 24),
          // Content Column with hover effect
          Expanded(
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutCubic,
                transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
                transformAlignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(bottom: 32.0, right: 8.0),
                  decoration: BoxDecoration(
                    color: _isHovered
                        ? Colors.white.withValues(alpha: 0.05)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _isHovered
                          ? Colors.white.withValues(alpha: 0.1)
                          : Colors.transparent,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.period,
                        style: const TextStyle(
                          color: Color(0xFF3584E4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.item.position,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.item.company,
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.item.description,
                        style: const TextStyle(height: 1.5),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.item.technologies
                            .map((tech) => TechTag(text: tech))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
