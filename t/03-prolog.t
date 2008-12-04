use Test;
use XQuery::Parser::Grammar;

plan 5;

my $query = 'declare variable $foo external';
ok($query ~~ XQuery::Parser::Grammar::VarDecl, 'VarDecl parsed');
ok($/<QName> eq 'foo', '.. correctly');

$query ~= ';';
ok($query ~~ XQuery::Parser::Grammar::Prolog, 'VarDecl parsed in Prolog');

$query ~= '"foo"';
ok($query ~~ XQuery::Parser::Grammar::MainModule, 'VarDecl parsed in MainModule');
is('declare variable $foo external;', ~$/<Prolog>, '..correctly');

