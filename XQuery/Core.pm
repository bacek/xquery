use v6;
use XQuery::Core::Nodes;

package XQuery::Core;

=begin pod

Classical Visitor to create Core from AST

=end pod

sub create($ast) {
    create_module($ast<Module>);
};

sub create_module($module) {
    create_expr($module<MainModule><QueryBody><Expr>);
};

sub create_expr($expr, $pos = 0) {
    return unless $expr<ExprSingle>[$pos];

    my $expr_single = $expr<ExprSingle>[$pos];
    
    # recursivly process ExprSingle.
    create_expr_single($expr_single, create_expr($expr, ++$pos));
};

sub create_expr_single($ast, $left) {
    XQuery::Core::FLWORExpr.new(
        left => $left
    );
};

# vim: ft=perl6
