use Test;
use TestUtil;
use XQuery::Parser::Grammar;

plan 13;

xqts(
    count     => 13,
    dirname   => 'XQTS/Queries/XQuery/Expressions/PathExpr/Steps/NodeTest/',
    filemask  => 'NodeTest%03d.xq',

    #expect_fail => ( 12, 88 ),
    #skip      => ( 22, 24, 25, 26, 28, 29, 38, 39, 40, 42, 50..54, ),
);

