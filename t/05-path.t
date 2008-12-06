use v6;
use Test;
use XQuery::Parser::Grammar;

plan 8;

ok( '..' ~~ / <XQueryGrammar::AbbrevReverseStep> / );
ok( '..' ~~ / <XQueryGrammar::ReverseStep> / );
ok( '..' ~~ / <XQueryGrammar::StepExpr> / );
ok( '..' ~~ / <XQueryGrammar::PathExpr> / );

ok( '/..' ~~ / <XQueryGrammar::PathExpr> / );
ok( 'foo/..' ~~ / <XQueryGrammar::PathExpr> / );
ok( '//..' ~~ / <XQueryGrammar::PathExpr> / );
ok( 'foo//..' ~~ / <XQueryGrammar::PathExpr> / );

# vim: ft=perl6
