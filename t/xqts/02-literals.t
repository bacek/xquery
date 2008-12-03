use v6;
use Test;
use XQuery::Parser::Grammar;

plan 69 + 50;

my %expect_fail = map { $^a => 1 }, 6..9, 51..55;
my %todo = (55=>1);
for (1..69) -> $test {
    my $filename = sprintf("docs/Queries/XQuery/Expressions/PrimaryExpr/Literals/Literals%03d.xq", $test);
    my $content = slurp $filename;
    my $res = $content ~~ XQuery::Parser::Grammar::TOP;
    my $expect_fail = %expect_fail.exists($test);
    ok(($expect_fail xor ?$res), "Test " ~ $test ~ (%todo.exists($test) ?? ' #TODO' !! ''));
}

for (1..50) -> $test {
    my $filename = "docs/Queries/XQuery/Expressions/PrimaryExpr/Literals/K-Literals-" ~$test ~".xq";
    my $content = slurp $filename;
    my $res = $content ~~ XQuery::Parser::Grammar::TOP;
    my $expect_fail = 0; #%expect_fail.exists($test);
    ok(?$res, "Test " ~ $test);
}