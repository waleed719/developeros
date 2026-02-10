import 'package:developeros/features/projects/models/project_model.dart';
import 'package:developeros/features/projects/views/widgets/timeline_milestone_card.dart';
import 'package:flutter/material.dart';

class TimelineTab extends StatelessWidget {
  final Project project;
  const TimelineTab({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    if (project.timeline == null || project.timeline!.isEmpty) {
      return const Center(
        child: Text(
          'No timeline available',
          style: TextStyle(color: Colors.white54),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      child: Column(
        children: [
          for (int i = 0; i < project.timeline!.length; i++)
            Timelinemilestonecard(
              milestone: project.timeline![i],
              isLast: i == project.timeline!.length - 1,
            ),
        ],
      ),
    );
  }
}
