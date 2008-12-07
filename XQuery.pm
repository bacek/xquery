package XQuery;
use v6;
use XQuery::Parser::Grammar;
use XQuery::Core;


sub parse($query) {
    die('Syntax error') unless($query ~~ XQueryGrammar);
    my $ast = $/; 
    my $core = XQuery::Core::create($ast);
};



# vim: ft=perl6
