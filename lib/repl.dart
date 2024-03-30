import 'dart:io';
import 'lexer.dart';
import 'token.dart';

void start() {
  while (true) {
    stdout.write('>> ');
    String? input = stdin.readLineSync();
    if (input == 'exit') {
      break;
    }
    try {
      dynamic result = evaluate(input);
      print(result);
    } catch (e) {
      print('Error: $e');
    }
  }
}

evaluate(String? input) {
  if (input == null) {
    return null;
  }
  var l = Lexer(input);
  var tok = l.nextToken();
  while (tok.type != TokenType.eof) {
    print(tok);
    tok = l.nextToken();
  }
}
