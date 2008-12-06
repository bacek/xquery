use Test;
use TestUtil;
use XQuery::Parser::Grammar;

plan 73;

xqts(
    count     => 88,
    dirname   => 'XQTS/Queries/XQuery/Expressions/PathExpr/Steps/Axes/',
    filemask  => 'Axes%03d.xq',

    expect_fail => ( 12, ),
    todo      => ( 19, 85..88 ), # 19 is failing...
    skip      => ( 22, 24, 25, 26, 28, 29, 38, 39, 40, 42, 50..54, ),
);

# vim: ft=perl6
