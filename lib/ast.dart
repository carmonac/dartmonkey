import 'token.dart';

abstract class Node {
  String get tokenLiteral;
}

abstract class Statement extends Node {}

abstract class Expression extends Node {}

class Identifier extends Expression {
  final Token token;
  final String value;

  Identifier(this.token, this.value);

  @override
  String get tokenLiteral => token.literal;
}

class Program {
  final List<Statement> statements = [];

  String get tokenLiteral =>
      statements.isNotEmpty ? statements.first.tokenLiteral : '';
}

class LetStatement extends Statement {
  final Identifier name;
  final Expression value;
  final Token token;

  LetStatement(this.name, this.value, this.token);

  @override
  String get tokenLiteral => token.literal;
}

class ReturnStatement extends Statement {
  final Expression returnValue;
  final Token token;

  ReturnStatement(this.returnValue, this.token);

  @override
  String get tokenLiteral => token.literal;
}
