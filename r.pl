use v6;
use Data::Dumper;
use XQuery::Parser::Grammar;

say @*ARGS[0];
my $filename = @*ARGS[0];
my $content = slurp $filename;
say ($content ~~ XQueryGrammar);
#say '==== match.perl ======';
#say $d.dumper( $/ );
#my %h = $/;
#say $/<Module><MainModule><Prolog><VarDecl>[0]<external>;
