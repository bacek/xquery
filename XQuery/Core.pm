use v6;
use XQuery::Core::Creator;

package XQuery::Core;

=begin pod

Core is tree, almost identical to XQuery Formal Semantics Core tree.
Each Node has attached StaticType and optional StaticContext.
StaticContext used during compilation/validation/execution phase.
StaticType used during optimization phase.

=end pod

sub create($ast) {
    XQuery::Core::Creator.new().create_module($ast<Module>);
};



# vim: ft=perl6
