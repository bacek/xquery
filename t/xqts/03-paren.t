use Test;
use XQuery::Parser::Grammar;

plan 20;


for (1..20) -> $test {
    my $filename = "XQTS/Queries/XQuery/Expressions/PrimaryExpr/ParenExpr/Parenexpr-" ~$test ~".xq";
    my $content = slurp $filename;
    my $res = $content ~~ XQuery::Parser::Grammar::TOP;
    ok(?$res, "Test " ~ $test);
}

# vim: ft=perl6
