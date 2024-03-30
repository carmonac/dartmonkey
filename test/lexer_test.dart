import 'package:dartmonkey/token.dart';
import 'package:dartmonkey/lexer.dart';
import 'package:test/test.dart';

void main() {
  test('validate lexer', () {
    final input = '=+(){},;';
    final expectedTokens = [
      Token(TokenType.assign, '='),
      Token(TokenType.plus, '+'),
      Token(TokenType.lparen, '('),
      Token(TokenType.rparen, ')'),
      Token(TokenType.lbrace, '{'),
      Token(TokenType.rbrace, '}'),
      Token(TokenType.comma, ','),
      Token(TokenType.semicolon, ';'),
      Token(TokenType.eof, ''),
    ];

    final lexer = Lexer(input);

    for (final expectedToken in expectedTokens) {
      final token = lexer.nextToken();
      expect(token.type, expectedToken.type);
      expect(token.literal, expectedToken.literal);
    }
  });

  test('real example code', () {
    final input = '''
      let five = 5;
      let ten = 10;
      
      let add = fn(x, y) {
        x + y;
      };
      
      let result = add(five, ten);
      let example = "hello world";
    ''';

    final expectedTokens = [
      Token(TokenType.let, 'let'),
      Token(TokenType.ident, 'five'),
      Token(TokenType.assign, '='),
      Token(TokenType.intType, '5'),
      Token(TokenType.semicolon, ';'),
      Token(TokenType.let, 'let'),
      Token(TokenType.ident, 'ten'),
      Token(TokenType.assign, '='),
      Token(TokenType.intType, '10'),
      Token(TokenType.semicolon, ';'),
      Token(TokenType.let, 'let'),
      Token(TokenType.ident, 'add'),
      Token(TokenType.assign, '='),
      Token(TokenType.function, 'fn'),
      Token(TokenType.lparen, '('),
      Token(TokenType.ident, 'x'),
      Token(TokenType.comma, ','),
      Token(TokenType.ident, 'y'),
      Token(TokenType.rparen, ')'),
      Token(TokenType.lbrace, '{'),
      Token(TokenType.ident, 'x'),
      Token(TokenType.plus, '+'),
      Token(TokenType.ident, 'y'),
      Token(TokenType.semicolon, ';'),
      Token(TokenType.rbrace, '}'),
      Token(TokenType.semicolon, ';'),
      Token(TokenType.let, 'let'),
      Token(TokenType.ident, 'result'),
      Token(TokenType.assign, '='),
      Token(TokenType.ident, 'add'),
      Token(TokenType.lparen, '('),
      Token(TokenType.ident, 'five'),
      Token(TokenType.comma, ','),
      Token(TokenType.ident, 'ten'),
      Token(TokenType.rparen, ')'),
      Token(TokenType.semicolon, ';'),
      Token(TokenType.let, 'let'),
      Token(TokenType.ident, 'example'),
      Token(TokenType.assign, '='),
      Token(TokenType.stringType, 'hello world'),
      Token(TokenType.semicolon, ';'),
      Token(TokenType.eof, ''),
    ];

    final lexer = Lexer(input);

    for (final expectedToken in expectedTokens) {
      final token = lexer.nextToken();
      expect(token.type, expectedToken.type);
      expect(token.literal, expectedToken.literal);
    }
  });
}
