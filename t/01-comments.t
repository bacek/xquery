use Test;
use XQuery::Parser::Grammar;

plan 1;

ok( '(: hello :)' ~~ XQuery::Parser::Grammar::Comment, 'Comment parsed');
