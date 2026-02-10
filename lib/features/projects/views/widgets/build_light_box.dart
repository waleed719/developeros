import 'package:developeros/features/projects/models/project_model.dart';
import 'package:flutter/material.dart';

class Buildlightbox extends StatefulWidget {
  final Project project;
  final int currentImageIndex;
  final VoidCallback onClose;
  final Function(int) onImageChanged;

  const Buildlightbox({
    super.key,
    required this.project,
    required this.currentImageIndex,
    required this.onClose,
    required this.onImageChanged,
  });

  @override
  State<Buildlightbox> createState() => _BuildlightboxState();
}

class _BuildlightboxState extends State<Buildlightbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClose,
      child: Container(
        color: Colors.black.withValues(alpha: 0.95),
        child: Stack(
          children: [
            // Main image
            Center(
              child: Image.asset(
                widget.project.galleryImages[widget.currentImageIndex].url,
                fit: BoxFit.contain,
              ),
            ),

            // Close button
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                onPressed: widget.onClose,
                icon: const Icon(Icons.close, color: Colors.white, size: 32),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withValues(alpha: 0.5),
                ),
              ),
            ),

            // Navigation arrows
            if (widget.project.galleryImages.length > 1) ...[
              Positioned(
                left: 16,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      final newIndex =
                          (widget.currentImageIndex -
                              1 +
                              widget.project.galleryImages.length) %
                          widget.project.galleryImages.length;
                      widget.onImageChanged(newIndex);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 32,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 16,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      final newIndex =
                          (widget.currentImageIndex + 1) %
                          widget.project.galleryImages.length;
                      widget.onImageChanged(newIndex);
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 32,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
            ],

            // Image counter
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${widget.currentImageIndex + 1} / ${widget.project.galleryImages.length}',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
