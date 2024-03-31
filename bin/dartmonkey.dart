import 'package:dartmonkey/repl.dart' as repl;
import 'package:dartmonkey/utils.dart' as utils;

Future<void> main() async {
  var username = await utils.getSystemUsername();
  print(
      'Hello $username! This is the Monkey programming language written in Dart!');

  repl.start();
}
