use v6;
use XQuery::Parser::Grammar;

say @*ARGS[0];
my $filename = @*ARGS[0];
my $content = slurp $filename;
say ($content ~~ XQuery::Parser::Grammar::TOP).perl;
