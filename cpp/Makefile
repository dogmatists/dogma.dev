prefix        = /usr/local
exec_prefix   = $(prefix)
libdir        = $(exec_prefix)/lib
includedir    = $(prefix)/include
datarootdir   = $(prefix)/share

CLANGFORMAT   = clang-format
RAKE          = rake

HEADERS      := dogma.hpp

# The default target:

all: $(HEADERS)

.PHONY: all

# Rules for verification:

test: test.cpp dogma.hpp
	$(CXX) -std=c++17 -Wall -Wextra -o $@ $< && ./$@

check: lint test

.PHONY: check

# Rules for installation:

install: installdirs $(HEADERS)
	install -c -m 0644 dogma.hpp $(DESTDIR)$(includedir)

installdirs:
	install -d $(DESTDIR)$(includedir)

installcheck:

.PHONY: install installdirs installcheck

# Rules for uninstallation:

uninstall:
	-rm -f $(DESTDIR)$(includedir)/dogma.hpp

.PHONY: uninstall

# Rules for development:

dogma.hpp: Rakefile dogma.hpp.in $(wildcard dogma/*.hpp)
	@$(RAKE) $@

lint: lint-hpp

lint-hpp:
	@printf '%s\n' $(HEADERS) | sort | xargs -n1 $(CXX) -x c++-header -std=c++17 -Wall -Wextra -fsyntax-only

format:
	find . -name '*.[ch]pp' | xargs $(CLANGFORMAT) -style=file -i

clean:
	@rm -Rf test *~

distclean: clean

mostlyclean: clean

maintainer-clean: clean

.PHONY: lint lint-hpp format clean distclean mostlyclean maintainer-clean

.SECONDARY:
.SUFFIXES:
