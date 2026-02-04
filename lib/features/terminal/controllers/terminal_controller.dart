import 'package:flutter/material.dart';
import '../models/terminal_models.dart';
import '../../skills/controllers/skills_controller.dart';
import '../../projects/controllers/projects_controller.dart';
import '../../about/controllers/about_controller.dart';
import '../../../core/di/di.dart';

class TerminalController extends ChangeNotifier {
  final SkillsController _skillsController = sl<SkillsController>();
  final ProjectsController _projectsController = sl<ProjectsController>();
  final AboutController _aboutController = sl<AboutController>();

  final List<TerminalTab> _tabs = [TerminalTab(name: 'waleedqamar@flutterdev')];
  int _activeTabIndex = 0;

  List<TerminalTab> get tabs => List.unmodifiable(_tabs);
  int get activeTabIndex => _activeTabIndex;
  TerminalTab get activeTab => _tabs[_activeTabIndex];

  void setActiveTab(int index) {
    _activeTabIndex = index;
    notifyListeners();
  }

  void addTab() {
    _tabs.add(TerminalTab(name: 'waleedqamar@flutterdev'));
    _activeTabIndex = _tabs.length - 1;
    notifyListeners();
  }

  void closeTab(int index) {
    if (_tabs.length > 1) {
      _tabs.removeAt(index);
      if (_activeTabIndex >= _tabs.length) {
        _activeTabIndex = _tabs.length - 1;
      }
      notifyListeners();
    }
  }

  void executeCommand(String rawInput) {
    final input = rawInput.trim().toLowerCase();
    final command = _parseCommand(input);
    final result = _processCommand(command);

    activeTab.history.add(
      TerminalLine(text: 'waleedqamar@flutterdev: $rawInput', isInput: true),
    );
    activeTab.history.add(
      TerminalLine(text: result.output, isError: result.isError),
    );
    notifyListeners();
  }

  TerminalCommand _parseCommand(String input) {
    return switch (input) {
      'whoami' => WhoAmICommand(input),
      'skills' => SkillsCommand(input),
      'projects' => ProjectsCommand(input),
      'contact' => ContactCommand(input),
      'help' => HelpCommand(input),
      _ => UnknownCommand(input),
    };
  }

  CommandResult _processCommand(TerminalCommand command) {
    return switch (command) {
      WhoAmICommand() => CommandResult(
        '${_aboutController.profile.name} - ${_aboutController.profile.title}',
      ),
      SkillsCommand() => CommandResult(_formatSkills()),
      ProjectsCommand() => CommandResult(_formatProjects()),
      ContactCommand() => CommandResult(
        'Email: ${_aboutController.profile.email} | GitHub: ${_aboutController.profile.githubUrl}',
      ),
      HelpCommand() => CommandResult(
        'Available commands:\n'
        '  whoami   - Display current user\n'
        '  skills   - List technical skills\n'
        '  projects - List portfolio projects\n'
        '  contact  - Show contact info\n'
        '  help     - Show this help message',
      ),
      UnknownCommand(raw: var r) => CommandResult(
        'Command not found: $r',
        isError: true,
      ),
    };
  }

  String _formatSkills() {
    final skills = _skillsController.currentSkills;
    if (skills.isEmpty) return 'No skills listed currently.';
    return 'Skills: ${skills.map((s) => s.name).join(', ')}';
  }

  String _formatProjects() {
    final projects = _projectsController.projects;
    if (projects.isEmpty) return 'No projects listed currently.';
    return 'Projects: ${projects.map((p) => p.title).join(', ')}';
  }
}

class TerminalTab {
  final String name;
  final List<TerminalLine> history = [];
  TerminalTab({required this.name});
}

class TerminalLine {
  final String text;
  final bool isInput;
  final bool isError;
  TerminalLine({
    required this.text,
    this.isInput = false,
    this.isError = false,
  });
}
