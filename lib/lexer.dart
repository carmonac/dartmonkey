import 'token.dart';

class Lexer {
  final String input;
  int position = 0;
  int readPosition = 0;
  String ch = '';

  Lexer(this.input) {
    readChar();
  }

  void readChar() {
    if (readPosition >= input.length) {
      ch = '0';
    } else {
      ch = input[readPosition];
    }
    position = readPosition;
    readPosition++;
  }

  Token nextToken() {
    Token token;
    skipWhitespace();

    switch (ch) {
      case '=':
        if (peekChar() == '=') {
          var ch = this.ch;
          readChar();
          token = Token(TokenType.eq, '$ch$ch');
        } else {
          token = Token(TokenType.assign, ch);
        }
        break;
      case '+':
        token = Token(TokenType.plus, ch);
        break;
      case '-':
        token = Token(TokenType.minus, ch);
        break;
      case '!':
        if (peekChar() == '=') {
          var ch = this.ch;
          readChar();
          token = Token(TokenType.notEq, '$ch$ch');
        } else {
          token = Token(TokenType.bang, ch);
        }
        break;
      case '/':
        token = Token(TokenType.slash, ch);
        break;
      case '*':
        token = Token(TokenType.asterisk, ch);
        break;
      case '<':
        token = Token(TokenType.lt, ch);
        break;
      case '>':
        token = Token(TokenType.gt, ch);
        break;
      case ';':
        token = Token(TokenType.semicolon, ch);
        break;
      case ',':
        token = Token(TokenType.comma, ch);
        break;
      case '(':
        token = Token(TokenType.lparen, ch);
        break;
      case ')':
        token = Token(TokenType.rparen, ch);
        break;
      case '{':
        token = Token(TokenType.lbrace, ch);
        break;
      case '}':
        token = Token(TokenType.rbrace, ch);
        break;
      case '"':
        token = Token(TokenType.stringType, readString());
        break;
      case '0':
        token = Token(TokenType.eof, '');
        break;
      default:
        if (isLetter(ch)) {
          var literal = readIdentifier();
          var type = lookupIdent(literal);
          return Token(type, literal);
        } else if (isDigit(ch)) {
          return Token(TokenType.intType, readNumber());
        } else {
          token = Token(TokenType.illegal, ch);
        }
    }

    readChar();
    return token;
  }

  String readIdentifier() {
    var position = this.position;
    while (isLetter(ch)) {
      readChar();
    }

    return input.substring(position, this.position);
  }

  String readNumber() {
    var position = this.position;
    while (isDigit(ch)) {
      readChar();
    }
    return input.substring(position, this.position);
  }

  String readString() {
    var position = this.position + 1;
    readChar();
    while (ch != '"' && ch != '0') {
      readChar();
    }
    return input.substring(position, this.position);
  }

  bool isLetter(String ch) {
    final RegExp letterExpression = RegExp(r'^[a-zA-Z_]$');
    return letterExpression.hasMatch(ch);
  }

  bool isDigit(String ch) {
    final RegExp digitExpression = RegExp(r'^\d$');
    return digitExpression.hasMatch(ch);
  }

  String peekChar() {
    if (readPosition >= input.length) {
      return '0';
    } else {
      return input[readPosition];
    }
  }

  void skipWhitespace() {
    while (ch == ' ' || ch == '\t' || ch == '\n' || ch == '\r') {
      readChar();
    }
  }
}
