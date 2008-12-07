use v6;
use Test;
use TestUtil;
use XQuery::Parser::Grammar;

plan 69; #+ 50;

xqts(
    count   => 69,
    dirname => 'XQTS/Queries/XQuery/Expressions/PrimaryExpr/Literals/',
    filemask => 'Literals%03d.xq',
    expect_fail => (6..9, 36..55),
    todo        => (68..69)
);

=begin
$dirname = 'XQTS/Queries/XQuery/Expressions/PrimaryExpr/Literals/';
for (1..50) -> $test {
    my $filename = 'K-Literals-' ~$test ~".xq";
    my $content = slurp $dirname ~ $filename;
    my $res = $content ~~ / <XQueryGrammar::TOP> /;
    my $expect_fail = 0; #%expect_fail.exists($test);
    ok(?$res, $filename);
}
=end
