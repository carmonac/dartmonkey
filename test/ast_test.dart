import 'package:test/test.dart';
import 'package:dartmonkey/ast.dart';
import 'package:dartmonkey/token.dart';

void main() {
  test("LetStatement toString", () {
    final program = Program();
    program.statements.add(LetStatement(
      Identifier(Token(TokenType.ident, 'myVar'), 'myVar'),
      Identifier(Token(TokenType.ident, 'anotherVar'), 'anotherVar'),
      Token(TokenType.let, 'let'),
    ));

    expect(program.toString(), 'let myVar = anotherVar;');
  });

  test("ReturnStatement toString", () {
    final program = Program();
    program.statements.add(ReturnStatement(
      Identifier(Token(TokenType.ident, 'myVar'), 'myVar'),
      Token(TokenType.returnKeyword, 'return'),
    ));

    expect(program.toString(), 'return myVar;');
  });
}
