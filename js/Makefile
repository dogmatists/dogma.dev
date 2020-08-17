RAKE = rake
TSC  = tsc

# The default target:

all: dogma.js

.PHONY: all

# Rules for development:

dogma.js: dogma.ts
	$(TSC)

dogma.d.ts: dogma.js

dogma.ts: Rakefile dogma.ts.in $(wildcard src/*.ts)
	$(RAKE) $@

clean:
	@rm -Rf dogma.js dogma.d.ts *~

distclean: clean

mostlyclean: clean

maintainer-clean: clean

.PHONY: clean distclean mostlyclean maintainer-clean

.SECONDARY:
.SUFFIXES:
