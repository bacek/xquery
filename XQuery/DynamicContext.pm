use v6;
use XQuery::StaticContext;

=begin pod

DynamicContext of XQuery

=end pod

class XQuery::DynamicContext {
    has XQuery::StaticContext $!static_context;
};

# vim: ft=perl6
