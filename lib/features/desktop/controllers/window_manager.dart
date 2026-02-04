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

  List<WindowEntry> get windows => List.unmodifiable(_windows);

  void openWindow(WindowEntry window) {
    // Check if window is already open
    final existingIndex = _windows.indexWhere((w) => w.id == window.id);
    if (existingIndex != -1) {
      bringToFront(window.id);
    } else {
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
