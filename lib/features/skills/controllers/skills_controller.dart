import 'package:flutter/material.dart';
import '../models/skill_model.dart';

class SkillsController extends ChangeNotifier {
  SkillCategoryType _selectedCategory = SkillCategoryType.frontend;
  SkillCategoryType get selectedCategory => _selectedCategory;

  void selectCategory(SkillCategoryType type) {
    _selectedCategory = type;
    notifyListeners();
  }

  final Map<SkillCategoryType, List<Skill>> _skillsData = {
    SkillCategoryType.frontend: [
      Skill(name: 'Flutter', level: 0.95, icon: 'flutter'),
      Skill(name: 'Dart', level: 0.9, icon: 'dart'),
      Skill(name: 'HTML/CSS', level: 0.85, icon: 'html'),
      Skill(name: 'React', level: 0.7, icon: 'react'),
    ],
    SkillCategoryType.backend: [
      Skill(name: 'Node.js', level: 0.75, icon: 'node'),
      Skill(name: 'PostgreSQL', level: 0.8, icon: 'db'),
      Skill(name: 'Firebase', level: 0.85, icon: 'firebase'),
      Skill(name: 'Python', level: 0.65, icon: 'python'),
    ],
    SkillCategoryType.tools: [
      Skill(name: 'Git', level: 0.9, icon: 'git'),
      Skill(name: 'Docker', level: 0.6, icon: 'docker'),
      Skill(name: 'Linux', level: 0.85, icon: 'linux'),
      Skill(name: 'VS Code', level: 0.95, icon: 'vscode'),
    ],
    SkillCategoryType.softSkills: [
      Skill(name: 'Communication', level: 0.9, icon: 'chat'),
      Skill(name: 'Teamwork', level: 0.95, icon: 'team'),
      Skill(name: 'Problem Solving', level: 0.9, icon: 'brain'),
      Skill(name: 'Leadership', level: 0.8, icon: 'lead'),
    ],
  };

  List<Skill> get currentSkills => _skillsData[_selectedCategory] ?? [];
}
