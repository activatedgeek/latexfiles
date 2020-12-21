PDFLATEX := pdflatex
PDFLATEXARGS := -interaction=nonstopmode -halt-on-error -shell-escape
BIBTEX := bibtex
DIST := public
PWD := $(shell pwd)

# all:
# 	@find . -type f -name "*.tex" -exec echo {} \; | sed -e s/tex/pdf/ | xargs -P 4 make
# 	@mkdir -p $(DIST)
# 	@find . -type f -name "*.pdf" -exec mv {} $(DIST) \;

all:
	@mkdir -p public
	@make main.pdf
	@mv main.pdf public/

%.pdf: %.tex
	@cd $(dir $@) && $(PDFLATEX) $(PDFLATEXARGS) $(shell basename $^)
	@cd $(dir $@) && $(BIBTEX) $(shell basename $^ | sed -e s/tex/aux/)
	@cd $(dir $@) && $(PDFLATEX) $(PDFLATEXARGS) $(shell basename $^)
	@cd $(dir $@) && $(PDFLATEX) $(PDFLATEXARGS) $(shell basename $^)

clean:
	@find . -type f \( -name "*.pdf" \
		-or -name "*.aux" -or -name "*.bbl" -or -name "*.blg" \
		-or -name "*.log" -or -name "*.nav" -or -name "*.out" \
		-or -name "*.snm" -or -name "*.toc" -or -name "*.vrb" \
		-or -name "*.fdb_latexmk" -or -name "*.fls" -or -name "*.bcf" \
		-or -name "*.lof" \) \
		-delete
	@rm -r $(DIST)

.PHONY: cv clean
