import 'package:flutter/material.dart';
import '../../../core/di/di.dart';
import '../controllers/experience_controller.dart';
import 'widgets/timeline_item.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<ExperienceController>();

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        padding: const EdgeInsets.all(24),
        child: ListView.builder(
          itemCount: controller.experiences.length,
          itemBuilder: (context, index) {
            final item = controller.experiences[index];
            return TimelineItem(
              item: item,
              isLast: index == controller.experiences.length - 1,
            );
          },
        ),
      ),
    );
  }
}
