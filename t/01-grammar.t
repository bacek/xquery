use v6;
use XQuery::Parser::Grammar;
use Test;

plan 9;

ok('"foo"'  ~~ XQueryGrammar::TOP, "StringLiteral");
ok('42'     ~~ XQueryGrammar::TOP, "IntegerLiteral");
ok('42.2'   ~~ XQueryGrammar::TOP, "DecimalLiteral");
ok('42.2E6' ~~ XQueryGrammar::TOP, "DoubleLiteral");

ok('(: Huston, we have a problem :)' ~~ XQueryGrammar::Comment, 'Comments parsed');
ok('(: Huston, we have a problem :)' ~~ XQueryGrammar::ws, 'Comments parsed as ws');
ok('   (: Huston, we have a problem :)  ' ~~ XQueryGrammar::ws, 'Comments parsed as ws with spaces');
ok(' "foo" ' ~~ XQueryGrammar::TOP, 'StringLiteral surraunded by spaces');
ok('(: Huston, we have a problem :) "foo"' ~~ XQueryGrammar::TOP, 'Comments parsed');
