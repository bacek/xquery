use v6;
use Test;
use XQuery::Parser::Grammar;

plan 69; #+ 50;

my %expect_fail = map { $^a => 1 }, 6..9, 36..55;
my %todo = map { $^a => 1 }, 5, 62..69;
my $dirname = 'XQTS/Queries/XQuery/Expressions/PrimaryExpr/Literals/';
for (1..69) -> $test {
    my $filename = sprintf('Literals%03d.xq', $test);
    my $content = slurp $dirname ~ $filename;
    #$content = $content.subst(/ <XQueryGrammar::Comment> /, ' ', :global);
    #say $content;
    my $res = $content ~~ / <XQueryGrammar::TOP> /;
    my $expect_fail = %expect_fail.exists($test);
    ok(($expect_fail xor ?$res), $filename ~ (%todo.exists($test) ?? ' #TODO' !! ''));
}
exit;

$dirname = 'XQTS/Queries/XQuery/Expressions/PrimaryExpr/Literals/';
for (1..50) -> $test {
    my $filename = 'K-Literals-' ~$test ~".xq";
    my $content = slurp $dirname ~ $filename;
    my $res = $content ~~ / <XQueryGrammar::TOP> /;
    my $expect_fail = 0; #%expect_fail.exists($test);
    ok(?$res, $filename);
}
