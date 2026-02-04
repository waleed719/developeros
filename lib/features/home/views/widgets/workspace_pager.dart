import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WorkspacePager extends StatefulWidget {
  const WorkspacePager({super.key});

  @override
  State<WorkspacePager> createState() => _WorkspacePagerState();
}

class _WorkspacePagerState extends State<WorkspacePager> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (pointerSignal) {
        if (pointerSignal is PointerScrollEvent) {
          if (pointerSignal.scrollDelta.dy > 0) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
            );
          } else if (pointerSignal.scrollDelta.dy < 0) {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
            );
          }
        }
      },
      child: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        children: const [
          // Workspace 1: Empty Desktop
          SizedBox.expand(),
          // Workspace 2: Another virtual desktop
          SizedBox.expand(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
