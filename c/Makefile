prefix        = /usr/local
exec_prefix   = $(prefix)
libdir        = $(exec_prefix)/lib
includedir    = $(prefix)/include
datarootdir   = $(prefix)/share

CLANGFORMAT   = clang-format
RAKE          = rake

HEADERS      := dogma.h

# The default target:

all: $(HEADERS)

.PHONY: all

# Rules for verification:

test: test.c dogma.h
	$(CC) -std=c11 -Wall -Wextra -Wno-unused-function -o $@ $< && ./$@

check: lint test

.PHONY: check

# Rules for installation:

install: installdirs $(HEADERS)
	install -c -m 0644 dogma.h $(DESTDIR)$(includedir)

installdirs:
	install -d $(DESTDIR)$(includedir)

installcheck:

.PHONY: install installdirs installcheck

# Rules for uninstallation:

uninstall:
	-rm -f $(DESTDIR)$(includedir)/dogma.h

.PHONY: uninstall

# Rules for development:

dogma.h: Rakefile dogma.h.in $(wildcard dogma/*.h)
	@$(RAKE) $@

lint: lint-h

lint-h:
	@printf '%s\n' $(HEADERS) | sort | xargs -n1 $(CC) -x c-header -std=c11 -Wall -Wextra -Wno-unused-function -fsyntax-only

format:
	find . -name '*.[ch]' | xargs $(CLANGFORMAT) -style=file -i

clean:
	@rm -Rf test *~

distclean: clean

mostlyclean: clean

maintainer-clean: clean

.PHONY: lint lint-h format clean distclean mostlyclean maintainer-clean

.SECONDARY:
.SUFFIXES:
