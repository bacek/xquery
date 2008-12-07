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

sub create_expr($expr) {
    XQuery::Core::Node.new();
};

# vim: ft=perl6
