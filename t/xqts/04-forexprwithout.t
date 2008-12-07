use Test;
use TestUtil;
use XQuery::Parser::Grammar;

plan 31;

xqts(
    count     => 31,
    dirname   => 'XQTS/Queries/XQuery/Expressions/FLWORExpr/ForExpr/',
    filemask  => 'ForExpr%03d.xq',

#    expect_fail => ( 12, ),
#    todo      => ( 19, 85..88 ), # 19 is failing...
#    skip      => ( 22, 24, 25, 26, 28, 29, 38, 39, 40, 42, 50..54, ),
);

# vim: ft=perl6
