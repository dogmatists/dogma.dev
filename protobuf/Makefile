RAKE = rake

# The default target:

all: dogma.proto

.PHONY: all

# Rules for development:

dogma.proto: Rakefile dogma.proto.in $(wildcard src/*.proto)
	@$(RAKE) $@

clean:
	@rm -Rf dogma.proto *~

distclean: clean

mostlyclean: clean

maintainer-clean: clean

.PHONY: clean distclean mostlyclean maintainer-clean

.SECONDARY:
.SUFFIXES:
