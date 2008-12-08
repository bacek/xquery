use v6;
use XQuery::Core::Nodes;

=begin pod

Classical Visitor to create Core from AST

=end pod


class XQuery::Core::Creator {

    method create_module($module) {
        self.create_expr($module<MainModule><QueryBody><Expr>);
    };

    method create_expr($expr, $pos = 0) {
        return unless $expr<ExprSingle>[$pos];

        my $expr_single = $expr<ExprSingle>[$pos];

        # recursivly process ExprSingle.
        self.create_expr_single($expr_single, self.create_expr($expr, ++$pos));
    };

    method create_expr_single($ast, $left) {
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
            return self.create_flwor_expr($ast<FLWORExpr>, $left);
        }
        elsif ( $ast<QuantifiedExpr>) {
            return self.create_quantified_expr($ast<QuantifiedExpr>, $left);
        }
        elsif ( $ast<TypeswitchExpr>) {
            return self.create_typeswitch_expr($ast<TypeswitchExpr>, $left);
        }
        elsif ( $ast<IfExpr>) {
            return self.create_if_expr($ast<IfExpr>, $left);
        }
        elsif ( $ast<OrExpr> ) {
            return self.create_or_expr($ast<OrExpr>, $left);
        }

        die('holy shit');
    };




    method create_or_expr($or, $left) {
        XQuery::Core::Literal.new(
            value => ~$or
        );
    };

}

# vim: ft=perl6
