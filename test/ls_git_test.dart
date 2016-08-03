import 'package:test/test.dart';
import 'dart:async';
import 'package:sdk_version/src/ls_git.dart' as ls_git;

main() {
  List lines;
  List filteredLines;
  List tagList;

  setUp(() async {
    lines = await ls_git.getRemoteTags();
    filteredLines = ls_git.filterTags(lines);
    tagList = await ls_git.getTags();
    tagList.sort();
  });

  test("remote tags is not empty", () async {
    expect(lines.isNotEmpty, isTrue);
    expect(filteredLines.isNotEmpty, isTrue);
    expect(tagList.isNotEmpty, isTrue);
  });

  test("built tags rank", () {
    var f = tagList.first;
    print(f);
    var l = tagList.last;
    print(l);
    expect(true, isTrue);
  });
}
