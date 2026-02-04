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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Category Tabs
          _buildCategoryTabs(),

          // Skills List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: _controller.currentSkills.length,
              itemBuilder: (context, index) {
                final skill = _controller.currentSkills[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            skill.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('${(skill.level * 100).toInt()}%'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: skill.level,
                          minHeight: 12,
                          backgroundColor: Colors.white12,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _getCategoryColor(_controller.selectedCategory),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: SkillCategoryType.values.map((type) {
          final isSelected = _controller.selectedCategory == type;
          return InkWell(
            onTap: () => _controller.selectCategory(type),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected
                        ? _getCategoryColor(type)
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                type.name.toUpperCase(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white60,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Color _getCategoryColor(SkillCategoryType type) {
    return switch (type) {
      SkillCategoryType.frontend => const Color(0xFF3584E4),
      SkillCategoryType.backend => const Color(0xFF2EC27E),
      SkillCategoryType.tools => const Color(0xFFF5C211),
      SkillCategoryType.softSkills => const Color(0xFFC061CB),
    };
  }
}
