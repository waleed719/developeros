import 'package:developeros/features/projects/models/project_model.dart';
import 'package:flutter/material.dart';

class Buildmainimage extends StatefulWidget {
  final Project project;
  final int currentImageIndex;
  final VoidCallback onShowLightbox;

  const Buildmainimage({
    super.key,
    required this.project,
    required this.currentImageIndex,
    required this.onShowLightbox,
  });

  @override
  State<Buildmainimage> createState() => _BuildmainimageState();
}

class _BuildmainimageState extends State<Buildmainimage> {
  @override
  Widget build(BuildContext context) {
    final currentImage = widget.project.galleryImages[widget.currentImageIndex];
    final isPortrait = currentImage.orientation == ImageOrientation.portrait;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate optimal image size based on available space
        // Use more of the vertical space available
        final availableHeight = constraints.maxHeight;
        final availableWidth = constraints.maxWidth;

        double imageMaxWidth;
        double imageMaxHeight;

        if (isPortrait) {
          // Portrait images (mobile apps)
          imageMaxWidth = availableWidth * 0.5; // 50% of width
          imageMaxHeight = availableHeight * 0.8; // 80% of available height
        } else {
          // Landscape images (web/desktop)
          imageMaxWidth = availableWidth * 0.9; // 90% of width
          imageMaxHeight = availableHeight * 0.8; // 80% of available height
        }

        return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: widget.onShowLightbox,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: imageMaxWidth,
                        maxHeight: imageMaxHeight,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          children: [
                            Image.asset(
                              currentImage.url,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: imageMaxWidth,
                                  height: imageMaxHeight,
                                  color: Colors.white.withValues(alpha: 0.1),
                                  child: const Center(
                                    child: Icon(
                                      Icons.image_not_supported,
                                      size: 64,
                                      color: Colors.white54,
                                    ),
                                  ),
                                );
                              },
                            ),
                            // Expand icon overlay
                            Positioned(
                              top: 16,
                              right: 16,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.fullscreen,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Fullscreen button
                ElevatedButton.icon(
                  onPressed: widget.onShowLightbox,
                  icon: const Icon(Icons.fullscreen, size: 18),
                  label: const Text('View Fullscreen'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3584E4),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
