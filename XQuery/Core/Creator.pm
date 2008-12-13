use v6;
use XQuery::Core::Nodes;

=begin pod

Classical Visitor to create Core from AST

=end pod


class XQuery::Core::Creator {
    has $.do_trace is rw;

    method BUILD {
        $.do_trace = Bool::True;
    }

    method trace(@args) {
        say ~@args if $.do_trace;
    };

    method create_module($module) {
        self.trace('create module');
        self.create_expr($module<MainModule><QueryBody><Expr>);
    };

    method create_expr($expr, $pos = 0) {
        return unless $expr<ExprSingle>[$pos];
        self.trace('create expr');

        my $expr_single = $expr<ExprSingle>[$pos];

        # recursivly process ExprSingle.
        my $res = self.create_expr_single($expr_single);
        $res.left = self.create_expr($expr, ++$pos);
        $res;
    };

    method create_expr_single($ast) {
        self.trace('create expr_single');
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
            return self.create_flwor_expr($ast<FLWORExpr>);
        }
        elsif ( $ast<QuantifiedExpr>) {
            return self.create_quantified_expr($ast<QuantifiedExpr>);
        }
        elsif ( $ast<TypeswitchExpr>) {
            return self.create_typeswitch_expr($ast<TypeswitchExpr>);
        }
        elsif ( $ast<IfExpr>) {
            return self.create_if_expr($ast<IfExpr>);
        }
        elsif ( $ast<OrExpr> ) {
            return self.create_or_expr($ast<OrExpr>);
        }

        die('holy shit');
    };




    method create_or_expr($or, $pos = 0) {
        return unless $or<AndExpr>[$pos];
        self.trace('create or_expr');
        my $res;
        my $and = self.create_and_expr($or<AndExpr>[$pos]);
        if 1 < +$or<AndExpr> && $pos == 0 {
            $res = XQuery::Core::OrExpr.new();
            $res.expr.push($and);
            $and.left = self.create_or_expr($or, ++$pos);
        }
        else {
            self.trace('shortcut OrExpr');
            # Shortcut for single AndExpr
            $res = $and;
        };
        $res;
    };

    method create_and_expr ($and) {
        XQuery::Core::Literal.new(
            value => ~$and
        );
    }

    method create_literal($node) {
        XQuery::Core::Literal.new(
            value => ~$node
        );
    };
}

# vim: ft=perl6
