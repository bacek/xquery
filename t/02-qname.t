use Test;
use XQuery::Parser::Grammar;

plan 6;

ok( 'foo' ~~ / <XQueryGrammar::QName> /, 'Simple qname parsed');
ok( 'foo-bar' ~~ / <XQueryGrammar::QName> /, 'QName with dash parsed');
is( 'foo-bar', ~$/, '..correctly');
ok( '1111' !~~ / <XQueryGrammar::QName> /, "Wrong qname wasn't parsed");

ok ( 'foo:bar' ~~ / <XQueryGrammar::QName> /);
ok ( 'foo:bar' eq ~$/);
