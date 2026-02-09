import 'package:flutter/material.dart';
import '../models/profile_model.dart';

class AboutController extends ChangeNotifier {
  final DeveloperProfile profile = DeveloperProfile(
    name: 'Waleed Qamar',
    title: 'Flutter Developer & Computer Science Student',
    bio:
        'Passionate about building high-quality agentic applications and premium UI/UX experiences. Expert in Clean Architecture and the power of Dart.',
    avatarUrl: 'https://github.com/waleedqamar.png', // Placeholder
    email: 'wqamar719@gmail.com',
    githubUrl: 'https://github.com/waleed719',
    highlights: [
      'Flutter & Dart',
      'Clean Architecture',
      'Aspiring Data Scientist',
      'Open Source Contributor',
    ],
  );
}
