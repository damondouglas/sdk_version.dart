library sdk_version.command;

import 'package:args/command_runner.dart' as args;
import 'dart:async';
import 'dart:io';
import 'ls_git.dart' as ls_git;
import 'tags.dart' as tags;
import 'package:path/path.dart' as path;

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

class LocalCommand extends args.Command {
  final name = "local";
  final description = "Compares local dart version against latest.";

  Future run() async {
    var sdkHome = Platform.environment['DART_SDK'];
    if (sdkHome == null || sdkHome == "") {
      print("Set DART_SDK environment variable before running this command.");
      exit(1);
    }

    var versionFilePath = path.join(sdkHome, 'version');
    var versionFile = new File(versionFilePath);
    if (versionFile.existsSync()) {
      var versionData = await versionFile.readAsStringSync();
      print(versionData.trim());
    } else {
      print("Could not find $versionFilePath");
      exit(1);
    }
  }
}
