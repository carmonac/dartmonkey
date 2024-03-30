import 'repl.dart';
import 'utils.dart';

Future<void> main() async {
  var username = await getSystemUsername();
  print(
      'Hello $username! This is the Monkey programming language written in Dart!');

  start();
}
