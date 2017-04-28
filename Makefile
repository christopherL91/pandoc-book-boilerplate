ID = $(shell git rev-parse --short HEAD)
TARGET = $(shell date +%d.%m.%Y)-$(ID)-book
SRC = src/preface.md \
	  src/introduction.md \
	  src/other.md
TARGETDIR = build
PDFOPTIONS = --latex-engine=xelatex \
			 --filter pandoc-citeproc \
			 --bibliography citations.bib \
			 --variable version=$(ID) \
			 --toc \
			 --csl acm-sigchi-proceedings.csl \
			 --template template.tex
all: pdf
	@echo "Done!"

pdf: $(TARGETDIR)
	pandoc $(SRC) -o $(TARGETDIR)/$(TARGET).pdf $(PDFOPTIONS)

.PHONY: clean
clean:
	rm -f $(TARGETDIR)/*.pdf

rebuild: clean all
