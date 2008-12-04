use Test;
use XQuery::Parser::Grammar;

plan 23;

my $query = 'declare variable $foo external';
ok($query ~~ XQueryGrammar::VarDecl, 'VarDecl parsed');
ok($/<QName> eq 'foo', '.. correctly');

$query ~= ';';
ok($query ~~ XQueryGrammar::Prolog, 'VarDecl parsed in Prolog');

$query ~= "\n";
$query ~= '"foo"';
ok($query ~~ XQueryGrammar::MainModule, 'VarDecl parsed in MainModule');
# Something bad in Rakudo. Without asking for .perl it produces incorrect result...
is('declare variable $foo external;'~"\n", ~$/<Prolog>, '..correctly');

ok($query ~~ XQueryGrammar::TOP, 'VarDecl parsed in whole query');
is('declare variable $foo external;'~"\n", ~$/<Module><MainModule><Prolog>, '..still correctly');

$query = '(: foo :)' ~ $query;
ok($query ~~ XQueryGrammar::TOP, 'VarDecl parsed in whole query with comments before');
is('declare variable $foo external;'~"\n", ~$/<Module><MainModule><Prolog>, '..still correctly');

$query = $query ~ '(: foo :)';
ok($query ~~ XQueryGrammar::TOP, 'VarDecl parsed in whole query with comments after');
is('declare variable $foo external;'~"\n", ~$/<Module><MainModule><Prolog>, '..still correctly');


$query = '(: foo :)' ~ $query;
ok($query ~~ XQueryGrammar::TOP, 'VarDecl parsed in whole query with comments before again');
is('declare variable $foo external;'~"\n", ~$/<Module><MainModule><Prolog>, '..still correctly');

$query = $query ~ '(: foo :)';
ok($query ~~ XQueryGrammar::TOP, 'VarDecl parsed in whole query with comments after again');
is('declare variable $foo external;'~"\n", ~$/<Module><MainModule><Prolog>, '..still correctly');
say $query;
say $/.perl;

# EPIC FAIL test...
$query = '
(: insert-start :) declare variable $foo external; (: insert-end :)
"test"
';

ok($query ~~ XQueryGrammar::VarDecl, 'VarDecl parsed in mixed query with comments');
say $/.perl;
is(" declare variable \$foo external", ~$/, '..still correctly');

ok($query ~~ XQueryGrammar::Prolog, 'VarDecl parsed in mixed query in Prolog');
say $/.perl;
is("\ndeclare variable \$foo external;\n", ~$/, '..still correctly');

ok($query ~~ XQueryGrammar::MainModule, 'VarDecl parsed in mixed query in MainModule');
say $/.perl;
is('declare variable $foo external;'~"\n", ~$/<Prolog>, '..still correctly');

ok($query ~~ XQueryGrammar::Module, 'VarDecl parsed in mixed query with Module');
say $/.perl;
is('declare variable $foo external;'~"\n", ~$/<MainModule><Prolog>, '..still correctly');

