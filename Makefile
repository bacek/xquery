all: XQuery/Parser/Grammar.pir TestUtil.pir

XQuery/Parser/Grammar.pir: XQuery/Parser/Grammar.pm
	perl6 --target=pir --output=XQuery/Parser/Grammar.pir XQuery/Parser/Grammar.pm

TestUtil.pir: TestUtil.pm
	perl6 --target=pir --output=TestUtil.pir TestUtil.pm

test: all
	prove -e perl6 --timer -r t
	
