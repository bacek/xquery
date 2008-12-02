use v6;
use Test;
use XQuery::Parser::Grammar;

plan 69;
for (1..69) -> $test {
    my $filename = sprintf("docs/Queries/XQuery/Expressions/PrimaryExpr/Literals/Literals%03d.xq", $test);
    my $content = slurp $filename;
    ok($content ~~ XQuery::Parser::Grammar::TOP, "Test " ~ $test);
}
