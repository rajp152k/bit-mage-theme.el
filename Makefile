.PHONY: compile test clean

EMACS ?= emacs
BATCH = $(EMACS) -Q --batch -L .

compile:
	$(BATCH) -f batch-byte-compile bit-mage-theme.el

test:
	$(BATCH) -l test/bit-mage-test.el -f ert-run-tests-batch-and-exit

clean:
	rm -f *.elc
