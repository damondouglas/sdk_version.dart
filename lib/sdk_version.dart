library sdk_version;

import 'package:args/command_runner.dart';
import 'src/command.dart';

void run(List<String> args) {
  var runner = new CommandRunner("sdk_version", "")
    ..addCommand(new ListCommand())
    ..addCommand(new LatestCommand())
    ..run(args);
}
