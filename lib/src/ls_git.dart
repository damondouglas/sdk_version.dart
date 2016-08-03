library sdk_version.ls_git;

import 'package:git/git.dart' as git;
import 'dart:io';
import 'dart:convert';
import 'tags.dart' as tags;
import 'dart:async';

final REMOTE_REPO_PATH = "git@github.com:dart-lang/sdk.git";

final BASE_ARGS = ['ls-remote', '--tags'];

Future<List<tags.Tag>> getTags() async {
  var list = await getRemoteTags();
  list = filterTags(list);
  return list.map((String line) => new tags.Tag.from(line)).toList();
}

Future<List<String>> getRemoteTags() async {
  var args = new List.from(BASE_ARGS);
  args.add(REMOTE_REPO_PATH);
  var result = await git.runGit(args);
  var lines = LineSplitter.split(result.stdout);
  return lines.toList();
}

List<String> filterTags(List<String> rawGitTags) {
  var r = new RegExp(r"\/[0-9]+\.[0-9]+\.[0-9]+$");
  var lines = new List.from(rawGitTags);
  return lines
      .where((String line) => !line.isEmpty)
      .where((String line) => !line.endsWith("\}"))
      .where((String line) => r.hasMatch(line))
      .where((String line) => !line.contains("dev"))
      .toList();
}
