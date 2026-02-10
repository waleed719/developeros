import 'package:flutter/material.dart';
import '../../controllers/terminal_controller.dart';

class TerminalTabs extends StatelessWidget {
  final TerminalController controller;

  const TerminalTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        color: Color(0xFF2D2D2D),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.tabs.length,
              itemBuilder: (context, index) {
                final isActive = index == controller.activeTabIndex;
                return GestureDetector(
                  onTap: () => controller.setActiveTab(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: isActive
                          ? const Color(0xFF1E1E1E)
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            controller.tabs[index].name,
                            style: TextStyle(
                              color: isActive ? Colors.white : Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () => controller.closeTab(index),
                            child: Icon(
                              Icons.close,
                              size: 14,
                              color: isActive ? Colors.white : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add, size: 18, color: Colors.grey),
            onPressed: () => controller.addTab(),
          ),
        ],
      ),
    );
  }
}
