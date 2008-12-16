use v6;

=begin pod

StaticContext of XQuery

=end pod

class XQuery::StaticContext {
    has $!parent is rw; # Parent context. 'is rw' for rewriting Core tree during optimization
};

# vim: ft=perl6
