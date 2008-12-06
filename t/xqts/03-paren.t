use Test;
use TestUtil;
use XQuery::Parser::Grammar;

plan 20;

xqts(
    count    => 20,
    dirname  => "XQTS/Queries/XQuery/Expressions/PrimaryExpr/ParenExpr/",
    filemask => "Parenexpr-%d.xq",
    todo     => (11, 18, 20), # 11 is failing
);

# vim: ft=perl6
