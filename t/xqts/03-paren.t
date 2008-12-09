use Test;
use TestUtil;
use XQuery::Parser::Grammar;

plan 20;

xqts(
    count    => 20,
    dirname  => "XQTS/Queries/XQuery/Expressions/PrimaryExpr/ParenExpr/",
    filemask => "Parenexpr-%d.xq",
    todo     => (10, 20), # 10 is failing
);

# vim: ft=perl6
