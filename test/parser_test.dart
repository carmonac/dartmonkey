import 'package:dartmonkey/ast.dart';
import 'package:dartmonkey/lexer.dart';
import 'package:dartmonkey/parser.dart';
import 'package:test/test.dart';

void main() {
  test("let statements", () {
    final String input = '''
      let x = 5;
      let y = 10;
      let foobar = 838383;
    ''';

    final lexer = Lexer(input);
    final parser = Parser(lexer);
    final program = parser.parseProgram();

    expect(program.statements.length, 3);

    final tests = [
      'x',
      'y',
      'foobar',
    ];

    for (var i = 0; i < tests.length; i++) {
      final stmt = program.statements[i];
      expect(stmt, isA<LetStatement>());
      final letStmt = stmt as LetStatement;
      expect(letStmt.name.value, tests[i]);
      expect(letStmt.name.tokenLiteral, tests[i]);
    }
  });

  test("return statements", () {
    final String input = '''
      return 5;
      return 10;
      return 993322;
    ''';

    final lexer = Lexer(input);
    final parser = Parser(lexer);
    final program = parser.parseProgram();

    expect(program.statements.length, 3);

    for (final stmt in program.statements) {
      expect(stmt, isA<ReturnStatement>());
      final returnStmt = stmt as ReturnStatement;
      expect(returnStmt.tokenLiteral, 'return');
    }
  });
}
