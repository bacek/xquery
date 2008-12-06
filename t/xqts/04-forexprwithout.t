use Test;
use XQuery::Parser::Grammar;

plan 31;


for (1..31) -> $test {
    my $filename = sprintf("XQTS/Queries/XQuery/Expressions/FLWORExpr/ForExpr/ForExpr%03d.xq", $test);
    my $content = slurp $filename;
    my $res = $content ~~ / <XQueryGrammar::FLWORExpr> /;
    ok(?$res, "Test " ~ $test);
}

# vim: ft=perl6
