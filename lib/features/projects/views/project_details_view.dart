import 'package:developeros/features/projects/views/widgets/project_details_section.dart';
import 'package:developeros/features/projects/views/widgets/project_features_section.dart';
import 'package:developeros/features/projects/views/widgets/project_hero_section.dart';
import 'package:developeros/features/projects/views/widgets/project_overview_section.dart';
import 'package:developeros/features/projects/views/widgets/project_persistent_footer.dart';
import 'package:developeros/features/projects/views/widgets/project_tech_stack_section.dart';
import 'package:flutter/material.dart';
import '../models/project_model.dart';

class ProjectDetailsView extends StatefulWidget {
  final Project project;

  const ProjectDetailsView({super.key, required this.project});

  @override
  State<ProjectDetailsView> createState() => _ProjectDetailsViewState();
}

class _ProjectDetailsViewState extends State<ProjectDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                _buildScrollableContent(context),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ProjectPersistentFooter(project: widget.project),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollableContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        24,
        24,
        24,
        100,
      ), // Extra bottom padding for footer
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectHeroSection(project: widget.project),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return _buildWideLayout(context);
              } else {
                return _buildNarrowLayout(context);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectOverviewSection(project: widget.project),
              const SizedBox(height: 32),
              ProjectFeaturesSection(project: widget.project),
            ],
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectTechStackSection(project: widget.project),
              const SizedBox(height: 24),
              ProjectDetailsSection(project: widget.project),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectOverviewSection(project: widget.project),
        const SizedBox(height: 32),
        ProjectFeaturesSection(project: widget.project),
        const SizedBox(height: 32),
        ProjectTechStackSection(project: widget.project),
        const SizedBox(height: 24),
        ProjectDetailsSection(project: widget.project),
      ],
    );
  }
}
