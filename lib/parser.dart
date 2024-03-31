import 'ast.dart';
import 'lexer.dart';
import 'token.dart';

class Parser {
  late Lexer lexer;
  late Token currentToken;
  late Token peekToken;

  Parser(this.lexer) {
    currentToken = lexer.nextToken();
    peekToken = lexer.nextToken();
  }

  void nextToken() {
    currentToken = peekToken;
    peekToken = lexer.nextToken();
  }

  Program parseProgram() {
    final program = Program();
    while (currentToken.type != TokenType.eof) {
      final statement = parseStatement();
      if (statement != null) {
        program.statements.add(statement);
      }
      nextToken();
    }
    return program;
  }

  Statement? parseStatement() {
    switch (currentToken.type) {
      case TokenType.let:
        return parseLetStatement();
      case TokenType.returnKeyword:
        return parseReturnStatement();
      default:
        return null;
    }
  }

  LetStatement parseLetStatement() {
    final token = currentToken;
    if (!expectPeek(TokenType.ident)) {
      throw Exception('expectPeek failed');
    }

    final name = Identifier(currentToken, currentToken.literal);

    if (!expectPeek(TokenType.assign)) {
      throw Exception('expectPeek failed');
    }

    while (!currentTokenIs(TokenType.semicolon)) {
      nextToken();
    }

    return LetStatement(name, name, token);
  }

  ReturnStatement parseReturnStatement() {
    final token = currentToken;

    while (!currentTokenIs(TokenType.semicolon)) {
      nextToken();
    }

    return ReturnStatement(
        Identifier(currentToken, currentToken.literal), token);
  }

  bool currentTokenIs(TokenType type) {
    return currentToken.type == type;
  }

  bool peekTokenIs(TokenType type) {
    return peekToken.type == type;
  }

  bool expectPeek(TokenType type) {
    if (peekTokenIs(type)) {
      nextToken();
      return true;
    } else {
      return false;
    }
  }
}
