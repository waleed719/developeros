import 'package:flutter/material.dart';
import '../../../core/di/di.dart';
import '../controllers/skills_controller.dart';
import '../models/skill_model.dart';

class SkillsView extends StatefulWidget {
  const SkillsView({super.key});

  @override
  State<SkillsView> createState() => _SkillsViewState();
}

class _SkillsViewState extends State<SkillsView> {
  final SkillsController _controller = sl<SkillsController>();

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

  // Get all skills across all categories
  List<_SkillRow> get _allSkills {
    final skills = <_SkillRow>[];
    _controller.allSkillsData.forEach((category, skillList) {
      for (var skill in skillList) {
        skills.add(_SkillRow(skill: skill, category: category));
      }
    });
    // Sort by proficiency (highest first)
    skills.sort((a, b) => b.skill.level.compareTo(a.skill.level));
    return skills;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Graph Cards Section
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Expanded(
                child: _GraphCard(
                  title: 'Frontend & Mobile',
                  subtitle: 'Primary Stack',
                  percentage: 92,
                  color: const Color(0xFF3584E4),
                  icon: Icons.phone_android,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _GraphCard(
                  title: 'Backend & Tools',
                  subtitle: 'Infrastructure',
                  percentage: 78,
                  color: const Color(0xFF2EC27E),
                  icon: Icons.dns,
                ),
              ),
            ],
          ),
        ),

        // Skills Table Section
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.2),
              border: Border(
                top: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
              ),
            ),
            child: Column(
              children: [
                // Table Header
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'SKILL NAME',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withValues(alpha: 0.5),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'CATEGORY',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withValues(alpha: 0.5),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'STATUS',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withValues(alpha: 0.5),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'PROFICIENCY',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withValues(alpha: 0.5),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Table Body
                Expanded(
                  child: ListView.builder(
                    itemCount: _allSkills.length,
                    itemBuilder: (context, index) {
                      final skillRow = _allSkills[index];
                      return _SkillTableRow(
                        skill: skillRow.skill,
                        category: skillRow.category,
                      );
                    },
                  ),
                ),

                // Footer Status Bar
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.3),
                    border: Border(
                      top: BorderSide(
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 14,
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Experience: 2+ years',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Icon(
                        Icons.code,
                        size: 14,
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Active Skills: ${_allSkills.length}',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Skills Monitor v1.0',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Helper class to pair skill with category
class _SkillRow {
  final Skill skill;
  final SkillCategoryType category;

  _SkillRow({required this.skill, required this.category});
}

// Graph Card Widget
class _GraphCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int percentage;
  final Color color;
  final IconData icon;

  const _GraphCard({
    required this.title,
    required this.subtitle,
    required this.percentage,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '$percentage%',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Mock graph visualization
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CustomPaint(painter: _GraphPainter(color: color)),
            ),
          ),
        ],
      ),
    );
  }
}

// Simple graph painter
class _GraphPainter extends CustomPainter {
  final Color color;

  _GraphPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);

    // Create a wavy line
    for (var i = 0; i <= 10; i++) {
      final x = (size.width / 10) * i;
      final y = size.height * (0.3 + (i % 3) * 0.15);
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);

    // Draw line on top
    final linePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final linePath = Path();
    linePath.moveTo(0, size.height * 0.5);
    for (var i = 0; i <= 10; i++) {
      final x = (size.width / 10) * i;
      final y = size.height * (0.3 + (i % 3) * 0.15);
      linePath.lineTo(x, y);
    }
    canvas.drawPath(linePath, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Skill Table Row Widget
class _SkillTableRow extends StatefulWidget {
  final Skill skill;
  final SkillCategoryType category;

  const _SkillTableRow({required this.skill, required this.category});

  @override
  State<_SkillTableRow> createState() => _SkillTableRowState();
}

class _SkillTableRowState extends State<_SkillTableRow> {
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
            SizedBox(width: 25),
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
