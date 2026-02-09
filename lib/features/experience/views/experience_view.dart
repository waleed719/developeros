import 'package:flutter/material.dart';
import '../../../core/di/di.dart';
import '../controllers/experience_controller.dart';
import '../models/experience_models.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<ExperienceController>();

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        padding: const EdgeInsets.all(24),
        child: ListView.builder(
          itemCount: controller.experiences.length,
          itemBuilder: (context, index) {
            final item = controller.experiences[index];
            return _TimelineItem(
              item: item,
              isLast: index == controller.experiences.length - 1,
            );
          },
        ),
      ),
    );
  }
}

// Stateful widget for hover effects
class _TimelineItem extends StatefulWidget {
  final ExperienceItem item;
  final bool isLast;

  const _TimelineItem({required this.item, required this.isLast});

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
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
                            .map((tech) => _TechTag(text: tech))
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

// Stateful tech tag with hover effect
class _TechTag extends StatefulWidget {
  final String text;

  const _TechTag({required this.text});

  @override
  State<_TechTag> createState() => _TechTagState();
}

class _TechTagState extends State<_TechTag> {
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
