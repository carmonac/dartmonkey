import 'dart:io';

Future<String> getSystemUsername() async {
  try {
    var result = await Process.run('whoami', []);

    // windows users can use this command
    // var result = await Process.run('echo', ['%USERNAME%'], runInShell: true);

    if (result.exitCode == 0) {
      return result.stdout.trim();
    } else {
      return 'unknown user';
    }
  } catch (e) {
    return 'unknown user';
  }
}
