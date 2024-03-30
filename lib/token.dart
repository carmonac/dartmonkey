enum TokenType {
  illegal,
  eof,
  // Identifiers + literals
  ident, // add, foobar, x, y, ...

  // Operators
  assign,
  eq,
  notEq,
  plus,
  minus,
  bang,
  asterisk,
  slash,
  lt,
  gt,

  // Delimiters
  comma,
  semicolon,
  lparen,
  rparen,
  lbrace,
  rbrace,
  // Keywords
  function,
  let,
  trueType,
  falseType,
  ifType,
  elseType,
  returnKeyword,
  stringType,
  intType, // 1343456
}

TokenType lookupIdent(String ident) {
  switch (ident) {
    case 'fn':
      return TokenType.function;
    case 'let':
      return TokenType.let;
    case 'true':
      return TokenType.trueType;
    case 'false':
      return TokenType.falseType;
    case 'if':
      return TokenType.ifType;
    case 'else':
      return TokenType.elseType;
    case 'return':
      return TokenType.returnKeyword;
    case 'int':
      return TokenType.intType;
    case 'string':
      return TokenType.stringType;
    default:
      return TokenType.ident;
  }
}

class Token {
  final TokenType type;
  final String literal;

  Token(this.type, this.literal);

  @override
  String toString() {
    return 'Token{type: $type, literal: $literal}';
  }
}
