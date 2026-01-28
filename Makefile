.PHONY: compile test clean

EMACS ?= emacs
BATCH = $(EMACS) -Q --batch -L .

compile:
	$(BATCH) -f batch-byte-compile bit-mage-theme.el

test:
	@echo "Tests will run after test/bit-mage-test.el is created"

clean:
	rm -f *.elc
