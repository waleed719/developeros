import 'package:flutter/material.dart';
import '../models/project_model.dart';

class ProjectsController extends ChangeNotifier {
  final List<Project> projects = [
    Project(
      title: 'Developer OS',
      description:
          'A Fedora-inspired portfolio web application built with Flutter Web and MVC architecture.',
      imageUrl: 'assets/images/fedora_bg.png',
      githubUrl: 'https://github.com/waleedqamar/developeros',
      tags: ['Flutter', 'MVC', 'Clean UI'],
    ),
    Project(
      title: 'MindForge',
      description:
          'An offline-first Flutter application for memory training and cognitive development.',
      imageUrl: 'https://via.placeholder.com/300x200',
      githubUrl: 'https://github.com/waleedqamar/mindforge',
      tags: ['Flutter', 'Clean Architecture', 'Offline-First'],
    ),
    Project(
      title: 'AH Traders',
      description:
          'A premium wholesale management application with Supabase integration and custom branding.',
      imageUrl: 'https://via.placeholder.com/300x200',
      githubUrl: 'https://github.com/waleedqamar/ah-traders',
      tags: ['Flutter', 'Supabase', 'Premium UI'],
    ),
  ];
}
