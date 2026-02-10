import 'package:developeros/features/projects/models/project_model.dart';
import 'package:developeros/features/projects/views/widgets/build_image_caption.dart';
import 'package:developeros/features/projects/views/widgets/build_light_box.dart';
import 'package:developeros/features/projects/views/widgets/build_main_image.dart';
import 'package:flutter/material.dart';

class GalleryTab extends StatefulWidget {
  final Project project;
  const GalleryTab({super.key, required this.project});

  @override
  State<GalleryTab> createState() => _GalleryTabState();
}

class _GalleryTabState extends State<GalleryTab> {
  int _currentImageIndex = 0;
  bool showLightbox = false;

  @override
  Widget build(BuildContext context) {
    if (widget.project.galleryImages.isEmpty) {
      return _buildEmptyState();
    }

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail Strip - vertical on left side
              _buildThumbnailStrip(),
              const SizedBox(width: 24),

              // Main Image Display and Info - takes remaining space
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main Image Display - takes most of the space
                    Expanded(
                      child: Buildmainimage(
                        project: widget.project,
                        currentImageIndex: _currentImageIndex,
                        onShowLightbox: () =>
                            setState(() => showLightbox = true),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Image Info - fixed height
                    if (widget
                            .project
                            .galleryImages[_currentImageIndex]
                            .caption !=
                        null)
                      Buildimagecaption(
                        index: _currentImageIndex,
                        project: widget.project,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Lightbox
        if (showLightbox)
          Buildlightbox(
            project: widget.project,
            currentImageIndex: _currentImageIndex,
            onClose: () => setState(() => showLightbox = false),
            onImageChanged: (newIndex) =>
                setState(() => _currentImageIndex = newIndex),
          ),
      ],
    );
  }

  Widget _buildThumbnailStrip() {
    return SizedBox(
      width: 120,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.project.galleryImages.length,
        itemBuilder: (context, index) {
          final image = widget.project.galleryImages[index];
          final isSelected = index == _currentImageIndex;

          return GestureDetector(
            onTap: () => setState(() => _currentImageIndex = index),
            child: Container(
              height: 80,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF3584E4)
                      : Colors.white.withValues(alpha: 0.2),
                  width: isSelected ? 3 : 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  image.url,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.white.withValues(alpha: 0.1),
                      child: const Icon(Icons.image, color: Colors.white54),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.photo_library_outlined,
            size: 64,
            color: Colors.white.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No images available',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.5),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
