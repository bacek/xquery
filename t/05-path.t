use v6;
use Test;
use XQuery::Parser::Grammar;

plan 16;

ok( '..' ~~ / ^ <XQueryGrammar::AbbrevReverseStep> $ / );
ok( '..' ~~ / ^ <XQueryGrammar::ReverseStep> $ / );
ok( '..' ~~ / ^ <XQueryGrammar::StepExpr> $ / );
ok( '..' ~~ / ^ <XQueryGrammar::PathExpr> $ / );

ok( '/..' ~~ / ^ <XQueryGrammar::PathExpr> $ / );
ok( 'foo/..' ~~ / ^ <XQueryGrammar::PathExpr> $ / );
ok( '//..' ~~ / ^ <XQueryGrammar::PathExpr> $ / );
ok( 'foo//..' ~~ / ^ <XQueryGrammar::PathExpr> $ / );

ok( '$blah/foo//..' ~~ / ^ <XQueryGrammar::PathExpr> $ / );
ok( 'fn:count()' ~~ / ^ <XQueryGrammar::FunctionCall> $ / );
ok( 'fn:count(foo)' ~~ / ^ <XQueryGrammar::FunctionCall> $ / );
ok( 'fn:count(foo/bar)' ~~ / ^ <XQueryGrammar::FunctionCall> $ / );
ok( 'fn:count($foo)' ~~ / ^ <XQueryGrammar::FunctionCall> $ / );
ok( 'fn:count($foo/bar)' ~~ / ^ <XQueryGrammar::FunctionCall> $ / );
ok( 'fn:count($foo/bar//baz)' ~~ / ^ <XQueryGrammar::FunctionCall> $ / );
ok( ('fn:count($blah/foo//..)' ~~ / ^ <XQueryGrammar::FunctionCall> $ /), 'Final function call with path' );

# vim: ft=perl6
