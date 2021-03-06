use v6;

=begin

Helper function for running XQTS based tests.

=end
=cut

sub xqts(:$count, :$dirname, :$filemask, :@expect_fail = (), :@todo = (), :@skip = ()) {
    my %expect_fail = map { $^a => 1 }, @expect_fail;
    my %todo = map { $^a => 1 }, @todo;
    my %skip = map { $^a => 1 }, @skip;
    for (1..$count) -> $test {
        next if %skip.exists($test);

        my $filename = sprintf($filemask, $test);
        my $content = slurp $dirname ~ $filename;
        my $res = $content ~~ / <XQueryGrammar::TOP> /;
        my $expect_fail = %expect_fail.exists($test);
        ok(($expect_fail xor ?$res), $filename ~ (%todo.exists($test) ?? ' #TODO' !! ''));
    }
}

