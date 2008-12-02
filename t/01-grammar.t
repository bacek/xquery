use v6;
use XQuery::Parser::Grammar;
use Test;

plan 4;

ok('"foo"'  ~~ XQuery::Parser::Grammar::TOP, "StringLiteral");
ok('42'     ~~ XQuery::Parser::Grammar::TOP, "IntegerLiteral");
ok('42.2'   ~~ XQuery::Parser::Grammar::TOP, "DecimalLiteral");
ok('42.2E6' ~~ XQuery::Parser::Grammar::TOP, "DoubleLiteral");
