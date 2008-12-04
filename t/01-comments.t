use Test;
use XQuery::Parser::Grammar;

plan 8;

ok( '(: hello :)' ~~ XQueryGrammar::Comment, 'Comment parsed');
ok( '(: hello :)' ~~ / <XQueryGrammar::ws> /, 'Comment parsed as ws');
ok( '"foo"' ~~ / <XQueryGrammar::StringLiteral> /, 'StringLiteral');
ok( '"foo"' ~~ / <XQueryGrammar::Literal> /, 'Literal');
ok( '(: hello :)"foo"' ~~ / <XQueryGrammar::Expr> /, 'Comment parsed as ws');
ok( '"foo","bar"' ~~ / <XQueryGrammar::Expr> /, 'Two single expressions');
ok( '"foo",(: blah :)"bar"' ~~ / <XQueryGrammar::Expr> /, 'Separated by comment');
ok( '(: blah:),"foo",(: blah :)"bar",(: blah:)' ~~ / <XQueryGrammar::TOP> /, 'As TOP');
