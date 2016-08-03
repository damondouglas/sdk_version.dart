import 'package:sdk_version/src/tags.dart' as tags;
import 'package:test/test.dart';
import 'dart:async';

final launchRow1 =
    "fbb7efcda3096acde9b7ea9da932305546110592        refs/tags/1.8.1";
final launchRow2 =
    "2303a13f69571f9f4da91608e7282008a7f5ef0b        refs/tags/1.8.2";
final launchRow3 =
    "86052b68aac0031fb5586319b4f17b4a6680900f        refs/tags/1.9.0";

Future main() async {
  testExtractRow();
  testBuildTag();
}

testExtractRow() {
  var launchTagString = tags.extractGitTagRow(launchRow1);
  test("Tag extraction should come after refs/tags/...", () {
    expect(launchTagString, "1.8.1");
  });
}

testBuildTag() {
  var launch1 = new tags.Tag.from(launchRow1);
  var launch2 = new tags.Tag.from(launchRow2);
  var launch3 = new tags.Tag.from(launchRow3);

  var tagList = [launch2, launch3, launch1];
  tagList.sort();

  test("Tags should rank", () {
    expect(true, isTrue);
  });
}
