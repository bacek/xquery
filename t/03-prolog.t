use Test;
use XQuery::Parser::Grammar;

plan 11;

my $query = 'declare variable $foo external';
ok($query ~~ XQuery::Parser::Grammar::VarDecl, 'VarDecl parsed');
ok($/<QName> eq 'foo', '.. correctly');

$query ~= ';';
ok($query ~~ XQuery::Parser::Grammar::Prolog, 'VarDecl parsed in Prolog');

$query ~= "\n";
$query ~= '"foo"';
ok($query ~~ XQuery::Parser::Grammar::MainModule, 'VarDecl parsed in MainModule');
# Something bad in Rakudo. Without asking for .perl it produces incorrect result...
$/<Prolog>.perl;
is('declare variable $foo external;'~"\n", ~$/<Prolog>, '..correctly');

ok($query ~~ XQuery::Parser::Grammar::TOP, 'VarDecl parsed in whole query');
$/.perl;
is('declare variable $foo external;'~"\n", ~$/<Module><MainModule><Prolog>, '..still correctly');

$query = '(: foo :)' ~ $query;
ok($query ~~ XQuery::Parser::Grammar::TOP, 'VarDecl parsed in whole query with comments before');
$/.perl;
is('declare variable $foo external;'~"\n", ~$/<Module><MainModule><Prolog>, '..still correctly');

$query = $query ~ '(: foo :)';
ok($query ~~ XQuery::Parser::Grammar::TOP, 'VarDecl parsed in whole query with comments after');
$/.perl;
is('declare variable $foo external;'~"\n", ~$/<Module><MainModule><Prolog>, '..still correctly');

