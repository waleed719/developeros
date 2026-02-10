import 'package:flutter/material.dart';
import '../models/project_model.dart';

class ProjectsController extends ChangeNotifier {
  final List<Project> projects = [
    Project(
      title: 'Developer OS',
      description:
          'A Fedora-inspired portfolio web application built with Flutter Web and MVC architecture. Features a complete desktop environment with windowing system, terminal emulator, and interactive UI components.',
      imageUrl: 'assets/images/fedora_bg.png',
      githubUrl: 'https://github.com/waleedqamar/developeros',
      tags: ['Flutter', 'MVC', 'Clean UI', 'Web'],
      galleryImages: [
        ProjectImage(
          url: 'assets/images/devos_home.png',
          orientation: ImageOrientation.landscape,
          caption: 'Desktop home screen with app grid',
        ),
        ProjectImage(
          url: 'assets/images/devos_terminal.png',
          orientation: ImageOrientation.landscape,
          caption: 'Interactive terminal with command execution',
        ),
        ProjectImage(
          url: 'assets/images/devos_projects.png',
          orientation: ImageOrientation.landscape,
          caption: 'Projects file manager view',
        ),
      ],
      features: [
        ProjectFeature(
          icon: Icons.window,
          title: 'Desktop Environment',
          description:
              'Full windowing system with drag, resize, minimize, and maximize capabilities. Multi-window support with z-index management.',
        ),
        ProjectFeature(
          icon: Icons.terminal,
          title: 'Terminal Emulator',
          description:
              'Interactive command-line interface with custom commands, autocomplete, and command history.',
        ),
        ProjectFeature(
          icon: Icons.folder,
          title: 'File Manager',
          description:
              'Browse projects and experiences with a familiar file explorer interface.',
        ),
        ProjectFeature(
          icon: Icons.palette,
          title: 'Fedora-Inspired Design',
          description:
              'Clean, modern UI following Fedora design principles with custom theming.',
        ),
      ],
      metrics: ProjectMetrics(
        stars: 15,
        contributors: 1,
        customMetrics: {
          'Lines of Code': '5K+',
          'Components': '20+',
          'Features': '8',
        },
      ),
      timeline: [
        TimelineMilestone(
          title: 'Project Kickoff',
          description: 'Initial concept and architecture design',
          date: DateTime(2026, 1, 15),
          icon: Icons.rocket_launch,
        ),
        TimelineMilestone(
          title: 'Core UI Implementation',
          description: 'Built desktop environment and window management',
          date: DateTime(2026, 1, 20),
          icon: Icons.construction,
        ),
        TimelineMilestone(
          title: 'Terminal Integration',
          description: 'Added interactive terminal with custom commands',
          date: DateTime(2026, 2, 1),
          icon: Icons.code,
        ),
        TimelineMilestone(
          title: 'Polish & Deploy',
          description: 'Final touches and web deployment',
          date: DateTime(2026, 2, 9),
          icon: Icons.check_circle,
        ),
      ],
    ),
    Project(
      title: 'MindForge',
      description:
          'An offline-first Flutter application for memory training and cognitive development. Features progressive difficulty, daily missions, and comprehensive analytics.',
      imageUrl: 'assets/projects/mind_forge/logo.png',
      githubUrl: 'https://github.com/waleedqamar/mindforge',
      tags: ['Flutter', 'Clean Architecture', 'Offline-First', 'Mobile'],
      galleryImages: [
        ProjectImage(
          url: 'assets/projects/mind_forge/CC_Portrait_home screen 1.png',
          orientation: ImageOrientation.portrait,
          caption: 'Daily missions dashboard',
        ),
        ProjectImage(
          url: 'assets/projects/mind_forge/CC_Portrait_mission page.png',
          orientation: ImageOrientation.portrait,
          caption: 'Memory training exercise',
        ),
        ProjectImage(
          url: 'assets/projects/mind_forge/CC_Portrait_stats page.png',
          orientation: ImageOrientation.portrait,
          caption: 'Progress analytics',
        ),
      ],
      features: [
        ProjectFeature(
          icon: Icons.psychology,
          title: 'Memory Training',
          description:
              'Multiple exercise types including word recall, pattern recognition, and spatial memory.',
        ),
        ProjectFeature(
          icon: Icons.trending_up,
          title: 'Progressive Difficulty',
          description:
              'Automatically adjusts challenge level based on performance and active days.',
        ),
        ProjectFeature(
          icon: Icons.offline_bolt,
          title: 'Fully Offline',
          description:
              'No internet required. All data stored locally with Hive database.',
        ),
        ProjectFeature(
          icon: Icons.analytics,
          title: 'Detailed Analytics',
          description:
              'Track progress with comprehensive statistics and performance graphs.',
        ),
      ],
      metrics: ProjectMetrics(
        downloads: 500,
        rating: '4.5',
        customMetrics: {
          'Active Users': '200+',
          'Exercises': '15+',
          'Difficulty Levels': '10',
        },
      ),
    ),
    Project(
      title: 'AH Traders',
      description:
          'A premium wholesale management application with Supabase integration and custom branding. Features product catalog, admin dashboard, and customer management.',
      imageUrl: 'https://via.placeholder.com/300x200',
      githubUrl: 'https://github.com/waleedqamar/ah-traders',
      tags: ['Flutter', 'Supabase', 'Premium UI', 'Web'],
      galleryImages: [
        ProjectImage(
          url: 'https://via.placeholder.com/1200x800',
          orientation: ImageOrientation.landscape,
          caption: 'Product catalog with categories',
        ),
        ProjectImage(
          url: 'https://via.placeholder.com/1200x800',
          orientation: ImageOrientation.landscape,
          caption: 'Admin dashboard',
        ),
      ],
      features: [
        ProjectFeature(
          icon: Icons.inventory,
          title: 'Product Management',
          description:
              'Complete catalog system with categories, multiple images, and dynamic pricing.',
        ),
        ProjectFeature(
          icon: Icons.admin_panel_settings,
          title: 'Admin Dashboard',
          description:
              'Secure admin panel for managing products, categories, and orders.',
        ),
        ProjectFeature(
          icon: Icons.cloud,
          title: 'Supabase Backend',
          description:
              'Real-time database, authentication, and storage integration.',
        ),
        ProjectFeature(
          icon: Icons.phone,
          title: 'Contact Integration',
          description:
              'WhatsApp and phone integration for direct customer communication.',
        ),
      ],
      metrics: ProjectMetrics(
        customMetrics: {
          'Products': '100+',
          'Categories': '12',
          'Daily Visitors': '50+',
        },
      ),
    ),
  ];
}
