use Test;
use XQuery::Parser::Grammar;

plan 3;

ok( 'foo' ~~ / <XQueryGrammar::QName> /, 'Simple qname parsed');
ok( 'foo-bar' ~~ / <XQueryGrammar::QName> /, 'QName with dash parsed');
is( 'foo-bar', ~$/, '..correctly');
