import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/di/di.dart';
import '../controllers/terminal_controller.dart';

class TerminalView extends StatefulWidget {
  const TerminalView({super.key});

  @override
  State<TerminalView> createState() => _TerminalViewState();
}

class _TerminalViewState extends State<TerminalView> {
  final TerminalController _controller = sl<TerminalController>();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onStateChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_onStateChange);
    _textController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onStateChange() {
    if (mounted) {
      setState(() {});
      // Scroll to bottom after output
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  void _handleSubmit(String value) {
    if (value.isNotEmpty) {
      _controller.executeCommand(value);
      _textController.clear();
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Terminal Tabs
        _buildTabs(),

        // Terminal Output & Input
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _controller.activeTab.history.length + 1,
              itemBuilder: (context, index) {
                // If it's the last item, render the Input Row
                if (index == _controller.activeTab.history.length) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 4.0,
                    ), // Gap before input
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'waleedqamar@flutterdev: ',
                          style: GoogleFonts.firaCode(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            focusNode: _focusNode,
                            autofocus: true,
                            style: GoogleFonts.firaCode(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                            onSubmitted: _handleSubmit,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                // Otherwise, render history line
                final line = _controller.activeTab.history[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(
                    line.text,
                    style: GoogleFonts.firaCode(
                      color: line.isError
                          ? Colors.red
                          : (line.isInput ? Colors.green : Colors.white),
                      fontSize: 14,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabs() {
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
              itemCount: _controller.tabs.length,
              itemBuilder: (context, index) {
                final isActive = index == _controller.activeTabIndex;
                return GestureDetector(
                  onTap: () => _controller.setActiveTab(index),
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
                            _controller.tabs[index].name,
                            style: TextStyle(
                              color: isActive ? Colors.white : Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () => _controller.closeTab(index),
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
            onPressed: () => _controller.addTab(),
          ),
        ],
      ),
    );
  }
}
