use v6;
use Data::Dumper;
use XQuery::Parser::Grammar;
use XQuery::DynamicContext;
use XQuery;

say @*ARGS[0];
my $filename = @*ARGS[0];
my $content = slurp $filename;
my $core = XQuery::parse($content);
$core.dump;

my $dc = XQuery::DynamicContext.new();

my @res = $core.evaluate($dc);

say "result: " ~@res;

