PARROT_DIR=/home/bacek/src/parrot
RAKUDO=$(PARROT_DIR)/parrot $(PARROT_DIR)/languages/perl6/perl6.pbc
PERL6=$(PARROT_DIR)/languages/perl6/perl6

SOURCES= \
		 XQuery/Parser/Grammar.pm \
		 XQuery/Parser.pm \
		 XQuery/Core/Nodes.pm \
		 XQuery/Core/Creator.pm \
		 XQuery/Core.pm \
		 XQuery.pm \
		 TestUtil.pm

PIRS=$(SOURCES:.pm=.pir)

all: $(PIRS)

%.pir: %.pm $(PERL6)
	$(PARROT_DIR)/parrot $(PARROT_DIR)/languages/perl6/perl6.pbc --target=pir $<  > $@

clean:
	rm -f $(PIRS)

test: all
	prove -e $(PERL6) -r --timer t/
	
