import 'package:flutter/material.dart';
import '../../../core/di/di.dart';
import '../controllers/skills_controller.dart';
import 'widgets/graph_card.dart';
import 'widgets/skill_table_row.dart';
import 'widgets/skill_row.dart';

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
  List<SkillRow> get _allSkills {
    final skills = <SkillRow>[];
    _controller.allSkillsData.forEach((category, skillList) {
      for (var skill in skillList) {
        skills.add(SkillRow(skill: skill, category: category));
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
                child: GraphCard(
                  title: 'Frontend & Mobile',
                  subtitle: 'Primary Stack',
                  percentage: 92,
                  color: const Color(0xFF3584E4),
                  icon: Icons.phone_android,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: GraphCard(
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
                      return SkillTableRow(
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
