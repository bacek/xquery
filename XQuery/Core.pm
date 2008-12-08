use v6;
use XQuery::Core::Creator;

package XQuery::Core;

sub create($ast) {
    XQuery::Core::Creator.new().create_module($ast<Module>);
};



# vim: ft=perl6
