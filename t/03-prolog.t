use Test;
use XQuery::Parser::Grammar;

plan 24;

my $query = 'declare variable $foo external';
ok($query ~~ / <XQueryGrammar::VarDecl> /, 'VarDecl parsed');
ok($/<XQueryGrammar::VarDecl><QName> eq 'foo', '.. correctly');

$query ~= ';';
ok($query ~~ / <XQueryGrammar::Prolog> /, 'VarDecl parsed in Prolog');
ok($/<XQueryGrammar::Prolog><VarDecl>[0]<QName> eq 'foo', '.. correctly');

$query ~= "\n";
$query ~= '"foo"';
ok($query ~~ / <XQueryGrammar::MainModule> /, 'VarDecl parsed in MainModule');
is('declare variable $foo external;'~"\n", ~$/<XQueryGrammar::MainModule><Prolog>, '..correctly');

ok($query ~~ / <XQueryGrammar::TOP> /, 'VarDecl parsed in whole query');
is('declare variable $foo external;'~"\n", ~$/<XQueryGrammar::TOP><Module><MainModule><Prolog>, '..still correctly');

$query = '(: foo :)' ~ $query;
ok($query ~~ / <XQueryGrammar::TOP> /, 'VarDecl parsed in whole query with comments before');
is('declare variable $foo external;'~"\n", ~$/<XQueryGrammar::TOP><Module><MainModule><Prolog>, '..still correctly');

$query = $query ~ '(: foo :)';
ok($query ~~ / <XQueryGrammar::TOP> /, 'VarDecl parsed in whole query with comments after');
is('declare variable $foo external;'~"\n", ~$/<XQueryGrammar::TOP><Module><MainModule><Prolog>, '..still correctly');


$query = '(: foo :)' ~ $query;
ok($query ~~ / <XQueryGrammar::TOP> /, 'VarDecl parsed in whole query with comments before again');
is('declare variable $foo external;'~"\n", ~$/<XQueryGrammar::TOP><Module><MainModule><Prolog>, '..still correctly');

$query = $query ~ '(: foo :)';
ok($query ~~ / <XQueryGrammar::TOP> /, 'VarDecl parsed in whole query with comments after again');
is('declare variable $foo external;'~"\n", ~$/<XQueryGrammar::TOP><Module><MainModule><Prolog>, '..still correctly');

$query = '
(: insert-start :) declare variable $foo external; (: insert-end :)
"test"
';

ok($query ~~ / <XQueryGrammar::VarDecl> /, 'VarDecl parsed in mixed query with comments');
is("foo", ~$/<XQueryGrammar::VarDecl><QName>, '..still correctly');

ok($query ~~ / <XQueryGrammar::Prolog> /, 'VarDecl parsed in mixed query in Prolog');
is("foo", ~$/<XQueryGrammar::Prolog><VarDecl>[0]<QName>, '..still correctly');

ok($query ~~ / <XQueryGrammar::MainModule> /, 'VarDecl parsed in mixed query in MainModule');
is("foo", ~$/<XQueryGrammar::MainModule><Prolog><VarDecl>[0]<QName>, '..still correctly');

ok($query ~~ / <XQueryGrammar::Module> /, 'VarDecl parsed in mixed query with Module');
is("foo", ~$/<XQueryGrammar::Module><MainModule><Prolog><VarDecl>[0]<QName>, '..still correctly');

