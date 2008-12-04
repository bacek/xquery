use Test;
use XQuery::Parser::Grammar;

plan 3;

ok('declare variable $foo external' ~~ XQuery::Parser::Grammar::VarDecl, 'VarDecl parsed');
ok($/<QName> eq 'foo', '.. correctly');

ok('declare variable $foo external;' ~~ XQuery::Parser::Grammar::Prolog, 'VarDecl parsed as Prolog');

