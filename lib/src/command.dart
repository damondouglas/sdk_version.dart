library sdk_version.command;

import 'package:args/command_runner.dart' as args;
import 'dart:async';
import 'ls_git.dart' as ls_git;

class ListCommand extends args.Command {
  final name = "list";
  final description = "Lists tags.";

  Future run() async {
    var tagList = await ls_git.getTags();
    tagList.sort();
    tagList.forEach((tag) => print(tag));
  }
}

class LatestCommand extends args.Command {
  final name = "latest";
  final description = "Lists latest version.";

  Future run() async {
    var tagList = await ls_git.getTags();
    tagList.sort();
    print(tagList.last);
  }
}
