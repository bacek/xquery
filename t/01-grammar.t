use v6;
use XQuery::Parser::Grammar;
use Test;

plan 9;

ok('"foo"'  ~~ XQuery::Parser::Grammar::TOP, "StringLiteral");
ok('42'     ~~ XQuery::Parser::Grammar::TOP, "IntegerLiteral");
ok('42.2'   ~~ XQuery::Parser::Grammar::TOP, "DecimalLiteral");
ok('42.2E6' ~~ XQuery::Parser::Grammar::TOP, "DoubleLiteral");

ok('(: Huston, we have a problem :)' ~~ XQuery::Parser::Grammar::Comment, 'Comments parsed');
ok('(: Huston, we have a problem :)' ~~ XQuery::Parser::Grammar::ws, 'Comments parsed as ws');
ok('   (: Huston, we have a problem :)  ' ~~ XQuery::Parser::Grammar::ws, 'Comments parsed as ws with spaces');
ok(' "foo" ' ~~ XQuery::Parser::Grammar::TOP, 'StringLiteral surraunded by spaces');
ok('(: Huston, we have a problem :) "foo"' ~~ XQuery::Parser::Grammar::TOP, 'Comments parsed');
