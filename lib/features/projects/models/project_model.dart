import 'package:flutter/material.dart';

enum ImageOrientation {
  portrait, // Mobile apps (9:16, 9:19.5)
  landscape, // Web/Desktop (16:9, 16:10)
  square, // Square images (1:1)
}

class ProjectImage {
  final String url;
  final ImageOrientation orientation;
  final String? caption;

  ProjectImage({required this.url, required this.orientation, this.caption});
}

class ProjectFeature {
  final IconData icon;
  final String title;
  final String description;
  final String? imageUrl;

  ProjectFeature({
    required this.icon,
    required this.title,
    required this.description,
    this.imageUrl,
  });
}

class ProjectMetrics {
  final int? downloads;
  final int? stars;
  final int? contributors;
  final String? rating;
  final Map<String, String>? customMetrics;

  ProjectMetrics({
    this.downloads,
    this.stars,
    this.contributors,
    this.rating,
    this.customMetrics,
  });
}

class TimelineMilestone {
  final String title;
  final String description;
  final DateTime date;
  final String? imageUrl;
  final IconData icon;

  TimelineMilestone({
    required this.title,
    required this.description,
    required this.date,
    this.imageUrl,
    required this.icon,
  });
}

class Project {
  final String title;
  final String description;
  final String imageUrl; // Main thumbnail
  final List<ProjectImage> galleryImages; // Additional screenshots
  final String githubUrl;
  final List<String> tags;
  final List<ProjectFeature> features;
  final ProjectMetrics? metrics;
  final List<TimelineMilestone>? timeline;
  final String? demoUrl;
  final String? videoUrl;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.galleryImages = const [],
    required this.githubUrl,
    required this.tags,
    this.features = const [],
    this.metrics,
    this.timeline,
    this.demoUrl,
    this.videoUrl,
  });
}
