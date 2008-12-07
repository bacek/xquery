PARROT_DIR=/home/bacek/src/parrot
RAKUDO=$(PARROT_DIR)/parrot $(PARROT_DIR)/languages/perl6/perl6.pbc

SOURCES= \
		 XQuery/Parser/Grammar.pm \
		 XQuery/Parser.pm \
		 XQuery/Core/Nodes.pm \
		 XQuery/Core.pm \
		 XQuery.pm \
		 TestUtil.pm

PIRS=$(SOURCES:.pm=.pir)

all: $(PIRS)

%.pir: %.pm
	$(PARROT_DIR)/parrot $(PARROT_DIR)/languages/perl6/perl6.pbc --target=pir $<  > $@

clean:
	rm -f $(PIRS)

test: all
	prove -e $(PARROT_DIR)/languages/perl6/perl6 -r --timer t/
	
