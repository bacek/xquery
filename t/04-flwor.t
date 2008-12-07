use Test;
use XQuery::Parser::Grammar;

plan 17;

my $q = 'for $a in ("foo") return $a';

ok ($q ~~ / <XQueryGrammar::ForClause> /), 'Simple ForClause';
ok ('for $a in ("foo") ' eq ~$/), '..parsed';
ok ( $q ~~ / <XQueryGrammar::FLWORExpr> /), 'Simple FLWORExpr';
ok ( $q eq ~$/), 'Parsed';

# Tests for order by.
ok ( '(1)' ~~ / <XQueryGrammar::OrderSpec> $ /), 'OrderSpec parsed';
ok ( '(1)' eq ~$/), '..correctly';
ok ( '(1)' ~~ / <XQueryGrammar::OrderSpecList> $ /), 'OrderSpecList parsed';
ok ( '(1)' eq ~$/ ), '..correctly';
ok ( 'order by (1)' ~~ / <XQueryGrammar::OrderByClause> $ /), 'OrderByClause parsed';
ok ( 'order by (1)' eq ~$/), '..correctly';

$q = 'for $a in ("foo") order by (1) return $a';
ok ( $q ~~ / <XQueryGrammar::ForClause> / ), 'ForClause in ordered FLWOR parsed';
ok ('for $a in ("foo") ' eq ~$/), '..correctly';
say ~$/;
ok ($q ~~ / <XQueryGrammar::OrderByClause> /), 'OrderByClause in ordered FLWOR parsed';
ok ( $q ~~ / <XQueryGrammar::FLWORExpr> $ /), 'Ordered FLWOR parsed';
my $p = ~$/;
ok ( $q eq $p), '..correctly';

$q = 'for $a in ("foo") order by ($a) return $a';
ok ( $q ~~ / <XQueryGrammar::FLWORExpr> $ /);
ok ( $q eq ~$/);
