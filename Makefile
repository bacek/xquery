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
	$(PERL6) --target=pir $<  > $@

clean:
	rm -f $(PIRS)

test: all xqts
	prove -e $(PERL6) -r --timer t/
	
xqts: XQTS/.unpacked

XQTS/.unpacked: XQTS/XQTS.zip
	cd XQTS && unzip XQTS.zip && touch .unpacked

XQTS/XQTS.zip:
	wget -c -O XQTS/XQTS.zip http://www.w3.org/XML/Query/test-suite/XQTS_1_0_2.zip

