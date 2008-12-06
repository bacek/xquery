use Test;
use XQuery::Parser::Grammar;

plan 4;

my $q = '{foo}'; # Enclosed expression with single step.

ok( $q ~~ / <XQueryGrammar::EnclosedExpr> /, 'Enclosed parsed directly');
ok( $q ~~ / <XQueryGrammar::CommonContent> /, 'Enclosed parsed as CommonContent');
ok( $q ~~ / <XQueryGrammar::QuotAttrValueContent> /, 'Enclosed parsed as QuotAttrValueContent');
ok( $q ~~ / <XQueryGrammar::DirAttributeValue> /, 'Enclosed parsed as DirAttributeValue');
