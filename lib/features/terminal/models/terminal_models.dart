sealed class TerminalCommand {
  final String raw;
  TerminalCommand(this.raw);
}

class WhoAmICommand extends TerminalCommand {
  WhoAmICommand(super.raw);
}

class SkillsCommand extends TerminalCommand {
  SkillsCommand(super.raw);
}

class ProjectsCommand extends TerminalCommand {
  ProjectsCommand(super.raw);
}

class ContactCommand extends TerminalCommand {
  ContactCommand(super.raw);
}

class HelpCommand extends TerminalCommand {
  HelpCommand(super.raw);
}

class UnknownCommand extends TerminalCommand {
  UnknownCommand(super.raw);
}

class CommandResult {
  final String output;
  final bool isError;

  CommandResult(this.output, {this.isError = false});
}
