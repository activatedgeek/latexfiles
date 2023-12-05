PDFLATEX := pdflatex
PDFLATEXARGS := -interaction=nonstopmode -halt-on-error -shell-escape
BIBTEX := bibtex
DIST := public

# all:
# 	@find . -type f -name "*.tex" -exec echo {} \; | sed -e s/tex/pdf/ | xargs -P 4 make
# 	@mkdir -p $(DIST)
# 	@find . -type f -name "*.pdf" -exec mv {} $(DIST) \;

%.pdf: %.tex
	@$(PDFLATEX) $(PDFLATEXARGS) $(shell basename $^)
	@$(BIBTEX) $(shell basename $^ | sed -e s/tex/aux/)
	@$(PDFLATEX) $(PDFLATEXARGS) $(shell basename $^)
	@$(PDFLATEX) $(PDFLATEXARGS) $(shell basename $^)
	@mkdir -p $(DIST) && mv $(shell basename $^ | sed -e s/tex/pdf/) $(DIST)
	@make clean

clean:
	@find . -type f \( -name "*.aux" \
		-or -name "*.bbl" -or -name "*.blg" -or -name "*.brf" \
		-or -name "*.log" -or -name "*.nav" -or -name "*.out" \
		-or -name "*.snm" -or -name "*.toc" -or -name "*.vrb" \
		-or -name "*.fdb_latexmk" -or -name "*.fls" -or -name "*.bcf" \
		-or -name "*.lof" \) \
		-delete

.PHONY: clean
