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

    method process_module($module) {
        self.trace('create module');
        self.process_expr($module<MainModule><QueryBody><Expr>);
    };

    method process_expr($expr, $pos = 0) {
        return unless $expr<ExprSingle>[$pos];
        self.trace('create expr');

        my $expr_single = $expr<ExprSingle>[$pos];

        # recursivly process ExprSingle.
        my $res = self.process_expr_single($expr_single);
        $res.left = self.process_expr($expr, ++$pos);
        $res;
    };

    method process_expr_single($ast) {
        self.trace('create expr_single');
=begin cut
    # it doesn't work in Rakudo.
        given $ast {
            when .<FLWORExpr>      { process_flwor_expr($_, $left) }
            when .<QuantifiedExpr> { process_quantified_expr($_, $left) }
            when .<TypeswitchExpr> { process_typeswitch_expr($_, $left) }
            when .<IfExpr>         { process_if_expr($_, $left) }
            when .<OrExpr>         { process_or_expr($_, $left) }
        }
=end cut
        my &sub;
        if ($ast<FLWORExpr>) {
            return self.process_flwor_expr($ast<FLWORExpr>);
        }
        elsif ( $ast<QuantifiedExpr>) {
            return self.process_quantified_expr($ast<QuantifiedExpr>);
        }
        elsif ( $ast<TypeswitchExpr>) {
            return self.process_typeswitch_expr($ast<TypeswitchExpr>);
        }
        elsif ( $ast<IfExpr>) {
            return self.process_if_expr($ast<IfExpr>);
        }
        elsif ( $ast<OrExpr> ) {
            return self.process_or_expr($ast<OrExpr>);
        }

        die('holy shit');
    };




    method process_or_expr($or, $pos = 0) {
        return unless $or<AndExpr>[$pos];
        self.trace('create or_expr');
        my $res;
        my $and = self.process_and_expr($or<AndExpr>[$pos]);
        if 1 < +$or<AndExpr> && $pos == 0 {
            $res = XQuery::Core::OrExpr.new();
            $res.expr.push($and);
            $and.left = self.process_or_expr($or, ++$pos);
        }
        else {
            self.trace('shortcut OrExpr');
            # Shortcut for single AndExpr
            $res = $and;
        };
        $res;
    };

    method process_and_expr ($node, $pos = 0) {
        return unless $node<ComparisonExpr>[$pos];
        self.trace('create AndExpr');
        my $res;
        my $c = self.process_comparision_expr($node<ComparisonExpr>[$pos]);
        if 1 < +$node<ComparisonExpr> && $pos == 0 {
            $res = XQuery::Core::AndExpr.new();
            $res.expr.push($c);
            $c.left = self.process_and_expr($node, ++$pos);
        }
        else {
            self.trace('shortcut AndExpr');
            # Shortcut for single CastableExpr
            $res = $c;
        };
        $res;
    };

    # There is no 'ComparisionExpr'. It normalized to function calls.
    # TODO Implement it
    method process_comparision_expr($node) {
        self.trace('process_comparision_expr');
        self.process_range_expr($node<RangeExpr>[0]);
    };

    method process_range_expr($node) {
        self.trace('process_range_expr');
        self.process_additive_expr($node<AdditiveExpr>[0]);
    };

    method process_additive_expr($node) {
        self.trace('process_additive_expr');
        self.process_multiplicative_expr($node<MultiplicativeExpr>[0]);
    };

    method process_multiplicative_expr($node) {
        self.trace('process_multiplicative_expr');
        self.process_union_expr($node<UnionExpr>[0]);
    };

    method process_union_expr($node) {
        self.trace('process_union_expr');
        self.process_intersect_expr($node<IntersectExceptExpr>[0]);
    };

    method process_intersect_expr($node) {
        self.trace('process_intersect_expr');
        self.process_instanceof_expr($node<InstanceofExpr>[0]);
    };

    method process_instanceof_expr($node) {
        self.trace('process_instanceof_expr ');
        self.process_treat_expr($node<TreatExpr>);
    };

    method process_treat_expr($node) {
        self.trace('process_treat_expr ');
        self.process_castable_expr($node<CastableExpr>);
    };

    method process_castable_expr($node) {
        self.trace('process_castable_expr ');
        self.process_cast_expr($node<Cast>);
    };

    method process_cast_expr($node) {
        XQuery::Core::Literal.new(
            value => ~$node
        );
    };

    method process_literal($node) {
        XQuery::Core::Literal.new(
            value => ~$node
        );
    };
}

# vim: ft=perl6
