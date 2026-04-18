LATEX := xelatex
DOCLATEX := xelatex
STRIPLATEX := latex
INDEX := makeindex

.PHONY: all cls main graduate doc clean distclean

all: cls main doc graduate

cls: swuthesis.cls swuthesis-main.tex swuthesis-graduate-main.tex

swuthesis.cls swuthesis-main.tex swuthesis-graduate-main.tex: swuthesis.dtx swuthesis.ins
	$(STRIPLATEX) swuthesis.ins

main: cls
	$(LATEX) swuthesis-main.tex
	biber swuthesis-main
	$(LATEX) swuthesis-main.tex
	$(LATEX) swuthesis-main.tex

graduate: cls
	$(LATEX) swuthesis-graduate-main.tex
	biber swuthesis-graduate-main
	$(LATEX) swuthesis-graduate-main.tex
	$(LATEX) swuthesis-graduate-main.tex

doc: swuthesis.dtx
	$(DOCLATEX) -jobname=swuthesis-doc swuthesis.dtx
	$(INDEX) -s gind.ist swuthesis-doc.idx
	$(INDEX) -s gglo.ist -o swuthesis-doc.gls swuthesis-doc.glo
	$(DOCLATEX) -jobname=swuthesis-doc swuthesis.dtx
	$(DOCLATEX) -jobname=swuthesis-doc swuthesis.dtx

clean:
	rm -f *.aux *.idx *.ilg *.ind *.log *.out *.toc *.glo *.gls *.tmp *.xref *.bbl *.bcf *.blg *.run.xml *.hd

distclean: clean
	rm -f *main.pdf *doc.pdf *-main.tex *-blx.bib *-main.bib