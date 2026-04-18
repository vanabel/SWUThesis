LATEX := xelatex
DOCLATEX := xelatex
STRIPLATEX := latex
INDEX := makeindex

.PHONY: all cls main doctor doc clean distclean

all: cls main doc doctor

cls: swuthesis.cls swuthesis-main.tex swuthesis-doctor-main.tex

swuthesis.cls swuthesis-main.tex swuthesis-doctor-main.tex: swuthesis.dtx swuthesis.ins
	$(STRIPLATEX) swuthesis.ins

main: cls
	$(LATEX) swuthesis-main.tex
	biber swuthesis-main
	$(LATEX) swuthesis-main.tex
	$(LATEX) swuthesis-main.tex

doctor: cls
	$(LATEX) swuthesis-doctor-main.tex
	biber swuthesis-doctor-main
	$(LATEX) swuthesis-doctor-main.tex
	$(LATEX) swuthesis-doctor-main.tex

doc: swuthesis.dtx
	$(DOCLATEX) -jobname=swuthesis-doc swuthesis.dtx
	$(INDEX) -s gind.ist swuthesis-doc.idx
	$(INDEX) -s gglo.ist -o swuthesis-doc.gls swuthesis-doc.glo
	$(DOCLATEX) -jobname=swuthesis-doc swuthesis.dtx
	$(DOCLATEX) -jobname=swuthesis-doc swuthesis.dtx

clean:
	rm -f *.aux *.idx *.ilg *.ind *.log *.out *.toc *.glo *.gls *.tmp *.xref *.bbl *.bcf *.blg *.run.xml *.hd

distclean: clean
	rm -f *main.pdf *doc.pdf *-blx.bib *-main.bib