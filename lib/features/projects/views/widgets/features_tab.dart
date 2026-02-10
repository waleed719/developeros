import 'package:developeros/features/projects/models/project_model.dart';
import 'package:flutter/material.dart';

class FeaturesTab extends StatefulWidget {
  final Project project;
  const FeaturesTab({super.key, required this.project});

  @override
  State<FeaturesTab> createState() => _FeaturesTabState();
}

class _FeaturesTabState extends State<FeaturesTab> {
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    if (widget.project.features.isEmpty) {
      return const Center(
        child: Text(
          'No features listed',
          style: TextStyle(color: Colors.white54),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 2.5,
        ),
        itemCount: widget.project.features.length,
        itemBuilder: (context, index) {
          final feature = widget.project.features[index];
          final isExpanded = _expandedIndex == index;

          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _expandedIndex = isExpanded ? null : index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isExpanded
                      ? const Color(0xFF3584E4).withValues(alpha: 0.2)
                      : Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isExpanded
                        ? const Color(0xFF3584E4)
                        : Colors.white.withValues(alpha: 0.05),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        feature.icon,
                        color: Colors.white70,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            feature.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            feature.description,
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 13,
                              height: 1.4,
                            ),
                            maxLines: isExpanded ? null : 2,
                            overflow: isExpanded
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
