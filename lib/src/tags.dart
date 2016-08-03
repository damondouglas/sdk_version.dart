library sdk_version.tags;

final VERSION_EXTRACT_PATTERN = "tags\/.*\$";

String extractGitTagRow(String row) {
  var r = new RegExp(VERSION_EXTRACT_PATTERN);
  var matchGroup = r.firstMatch(row).group(0);
  return matchGroup.replaceAll("tags\/", "");
}

class Tag extends Object with Comparable {
  int major;
  int minor;
  int patch;

  Tag.from(String gitTagRow) {
    var versionString = extractGitTagRow(gitTagRow);
    assert(!gitTagRow.contains("dev"));
    var versionSplit = versionString.split(".");
    assert(versionSplit.length > 2);
    major = int.parse(versionSplit[0]);
    minor = int.parse(versionSplit[1]);
    patch = int.parse(versionSplit[2]);
  }

  int compareTo(Tag other) {
    var diff = 1000 * (major - other.major) +
        10 * (minor - other.minor) +
        (patch - other.patch);

    if (diff != 0)
      return diff ~/ diff.abs();
    else
      return 0;
  }

  String toString() {
    return "$major.$minor.$patch";
  }
}
