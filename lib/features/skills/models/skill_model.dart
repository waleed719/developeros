class Skill {
  final String name;
  final double level; // 0.0 to 1.0
  final String icon;

  Skill({required this.name, required this.level, required this.icon});
}

enum SkillCategoryType { frontend, backend, tools, softSkills }

class SkillCategory {
  final String name;
  final List<Skill> skills;
  final SkillCategoryType type;

  SkillCategory({required this.name, required this.skills, required this.type});
}
