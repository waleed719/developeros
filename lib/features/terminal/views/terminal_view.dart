import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/di/di.dart';
import '../controllers/terminal_controller.dart';
import 'widgets/terminal_tabs.dart';

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
        TerminalTabs(controller: _controller),

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
}
