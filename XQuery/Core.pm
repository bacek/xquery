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
=begin cut
# it doesn't work in Rakudo.
    given $ast {
        when .<FLWORExpr>      { create_flwor_expr($_, $left) }
        when .<QuantifiedExpr> { create_quantified_expr($_, $left) }
        when .<TypeswitchExpr> { create_typeswitch_expr($_, $left) }
        when .<IfExpr>         { create_if_expr($_, $left) }
        when .<OrExpr>         { create_or_expr($_, $left) }
    }
=end cut
    my &sub;
    if ($ast<FLWORExpr>) {
        return create_flwor_expr($ast<FLWORExpr>, $left);
    }
    elsif ( $ast<QuantifiedExpr>) {
        return create_quantified_expr($ast<QuantifiedExpr>, $left);
    }
    elsif ( $ast<TypeswitchExpr>) {
        return create_typeswitch_expr($ast<TypeswitchExpr>, $left);
    }
    elsif ( $ast<IfExpr>) {
        return create_if_expr($ast<IfExpr>, $left);
    }
    elsif ( $ast<OrExpr> ) {
        return create_or_expr($ast<OrExpr>, $left);
    }

    die('holy shit');
};




sub create_or_expr($or, $left) {
    XQuery::Core::Literal.new(
        value => ~$or
    );
};

# vim: ft=perl6
