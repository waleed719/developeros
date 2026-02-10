import 'package:flutter/material.dart';
import '../../models/skill_model.dart';

class SkillTableRow extends StatefulWidget {
  final Skill skill;
  final SkillCategoryType category;

  const SkillTableRow({super.key, required this.skill, required this.category});

  @override
  State<SkillTableRow> createState() => _SkillTableRowState();
}

class _SkillTableRowState extends State<SkillTableRow> {
  bool _isHovered = false;

  Color _getCategoryColor() {
    return switch (widget.category) {
      SkillCategoryType.frontend => const Color(0xFF3584E4),
      SkillCategoryType.backend => const Color(0xFF2EC27E),
      SkillCategoryType.tools => const Color(0xFFF5C211),
      SkillCategoryType.softSkills => const Color(0xFFC061CB),
    };
  }

  IconData _getSkillIcon() {
    // Map common skill names to icons
    final iconMap = {
      'flutter': Icons.phone_android,
      'dart': Icons.code,
      'python': Icons.terminal,
      'react': Icons.web,
      'node': Icons.dns,
      'db': Icons.storage,
      'firebase': Icons.cloud,
      'git': Icons.source,
      'docker': Icons.view_in_ar,
      'linux': Icons.computer,
      'vscode': Icons.edit_note,
      'chat': Icons.chat_bubble_outline,
      'team': Icons.groups,
      'brain': Icons.psychology,
      'lead': Icons.star,
    };

    return iconMap[widget.skill.icon.toLowerCase()] ?? Icons.code;
  }

  String _getCategoryName() {
    return switch (widget.category) {
      SkillCategoryType.frontend => 'Frontend',
      SkillCategoryType.backend => 'Backend',
      SkillCategoryType.tools => 'Tools',
      SkillCategoryType.softSkills => 'Soft Skills',
    };
  }

  @override
  Widget build(BuildContext context) {
    final categoryColor = _getCategoryColor();
    final percentage = (widget.skill.level * 100).toInt();

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: _isHovered
              ? Colors.white.withValues(alpha: 0.05)
              : Colors.transparent,
          border: Border(
            bottom: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
          ),
        ),
        child: Row(
          children: [
            // Skill Name with Icon
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: categoryColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      _getSkillIcon(),
                      size: 16,
                      color: categoryColor,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    widget.skill.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Category
            Expanded(
              flex: 2,
              child: Text(
                _getCategoryName(),
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              ),
            ),

            // Status Badge
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF2EC27E).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 5,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF2EC27E),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Active',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2EC27E),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 25),
            // Proficiency Bar
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: widget.skill.level,
                        child: Container(
                          decoration: BoxDecoration(
                            color: categoryColor,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 40,
                    child: Text(
                      '$percentage%',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'monospace',
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
