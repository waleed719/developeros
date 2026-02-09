import 'package:flutter/material.dart';

class WindowEntry {
  final String id;
  final String title;
  final Widget content;
  final IconData icon;
  Offset position;
  Size size;

  WindowEntry({
    required this.id,
    required this.title,
    required this.content,
    required this.icon,
    this.position = const Offset(100, 100),
    this.size = const Size(800, 600),
  });
}

class WindowManager extends ChangeNotifier {
  final List<WindowEntry> _windows = [];

  // Cascading offset constants
  static const double _offsetX = 40.0;
  static const double _offsetY = 40.0;
  static const double _baseX = 100.0;
  static const double _baseY = 100.0;

  List<WindowEntry> get windows => List.unmodifiable(_windows);

  void openWindow(WindowEntry window) {
    // Check if window is already open
    final existingIndex = _windows.indexWhere((w) => w.id == window.id);
    if (existingIndex != -1) {
      // Window already exists, bring it to front
      bringToFront(window.id);
    } else {
      // New window: calculate cascading position based on current window count
      final windowCount = _windows.length;
      final newPosition = Offset(
        _baseX + (windowCount * _offsetX),
        _baseY + (windowCount * _offsetY),
      );

      // Update window position before adding
      window.position = newPosition;

      _windows.add(window);
      notifyListeners();
    }
  }

  void closeWindow(String id) {
    _windows.removeWhere((w) => w.id == id);
    notifyListeners();
  }

  void bringToFront(String id) {
    final index = _windows.indexWhere((w) => w.id == id);
    if (index != -1) {
      final window = _windows.removeAt(index);
      _windows.add(window);
      notifyListeners();
    }
  }

  void updateWindowPosition(String id, Offset newPosition) {
    final index = _windows.indexWhere((w) => w.id == id);
    if (index != -1) {
      _windows[index].position = newPosition;
      notifyListeners();
    }
  }
}
