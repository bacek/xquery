all: XQuery/Parser/Grammar.pir

XQuery/Parser/Grammar.pir: XQuery/Parser/Grammar.pm
	perl6 --target=pir --output=XQuery/Parser/Grammar.pir XQuery/Parser/Grammar.pm

test: all
	prove -e perl6 --timer -r t
	
