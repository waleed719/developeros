import 'package:flutter/material.dart';
import '../models/experience_models.dart';

class ExperienceController extends ChangeNotifier {
  final List<ExperienceItem> experiences = [
    ExperienceItem(
      company: 'Freelance / Open Source',
      position: 'Flutter Developer',
      period: '2023 - Present',
      description:
          'Developing high-performance Flutter applications and contributing to various open-source projects including Developer OS.',
      technologies: ['Flutter', 'Dart', 'Firebase', 'Clean Architecture'],
    ),
    ExperienceItem(
      company: 'University Project Lab',
      position: 'Android Intern',
      period: '2022 - 2023',
      description:
          'Built educational apps for students using Native Android (Java) and translated requirements into functional code.',
      technologies: ['Java', 'Android SDK', 'SQLite'],
    ),
    ExperienceItem(
      company: 'Tech Solutions Ltd',
      position: 'Junior Developer',
      period: '2021 - 2022',
      description:
          'Assisted in front-end development for various client websites and internal management tools.',
      technologies: ['HTML', 'CSS', 'JavaScript', 'Bootstrap'],
    ),
  ];
}
