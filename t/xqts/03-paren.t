use Test;
use TestUtil;
use XQuery::Parser::Grammar;

plan 20;

xqts(
    count    => 20,
    dirname  => "XQTS/Queries/XQuery/Expressions/PrimaryExpr/ParenExpr/",
    filemask => "Parenexpr-%d.xq",
    todo     => (15..18, 20),
);

# vim: ft=perl6
