LATEX := xelatex
DOCLATEX := xelatex
STRIPLATEX := latex
INDEX := makeindex

# 伪目标：无对应文件名（all / 各示例别名 / cls）及 clean。勿再把「带配方的 main」
# 做成伪目标——否则会每次重跑 xelatex；现已改为由 *.pdf 规则决定是否重编译。
.PHONY: all clean distclean cls main graduate postdoc doc

all: swuthesis-main.pdf swuthesis-graduate-main.pdf swuthesis-postdoc-main.pdf swuthesis-doc.pdf

# DocStrip 一次生成下列文件；任一出库早于 dtx/ins 时重抽
swuthesis.cls swuthesis-doc-patch.sty swuthesis-main.tex swuthesis-graduate-main.tex swuthesis-postdoc-main.tex: swuthesis.dtx swuthesis.ins
	$(STRIPLATEX) swuthesis.ins

# 兼容：只抽类与示例主文件（无配方；依赖已最新时不执行任何命令）
cls: swuthesis.cls swuthesis-doc-patch.sty swuthesis-main.tex swuthesis-graduate-main.tex swuthesis-postdoc-main.tex

# 与 \addbibresource{…} 一致；$(wildcard *.bib) 在文件尚不存在（首次克隆未编译）时不加入依赖，避免 Make 报错
swuthesis-main.pdf: swuthesis-main.tex swuthesis.cls $(wildcard swuthesis-main.bib)
	$(LATEX) swuthesis-main.tex
	biber swuthesis-main
	$(LATEX) swuthesis-main.tex
	$(LATEX) swuthesis-main.tex

swuthesis-graduate-main.pdf: swuthesis-graduate-main.tex swuthesis.cls $(wildcard swuthesis-graduate-main.bib)
	$(LATEX) swuthesis-graduate-main.tex
	biber swuthesis-graduate-main
	$(LATEX) swuthesis-graduate-main.tex
	$(LATEX) swuthesis-graduate-main.tex

swuthesis-postdoc-main.pdf: swuthesis-postdoc-main.tex swuthesis.cls $(wildcard swuthesis-postdoc-main.bib)
	$(LATEX) swuthesis-postdoc-main.tex
	biber swuthesis-postdoc-main
	$(LATEX) swuthesis-postdoc-main.tex
	$(LATEX) swuthesis-postdoc-main.tex

swuthesis-doc.pdf: swuthesis.dtx swuthesis.cls swuthesis-doc-patch.sty
	$(DOCLATEX) -jobname=swuthesis-doc swuthesis.dtx
	$(INDEX) -s gind.ist swuthesis-doc.idx
	$(INDEX) -s gglo.ist -o swuthesis-doc.gls swuthesis-doc.glo
	$(DOCLATEX) -jobname=swuthesis-doc swuthesis.dtx
	$(DOCLATEX) -jobname=swuthesis-doc swuthesis.dtx

# 保留旧命令名：作为伪目标仅依赖对应 PDF，由 PDF 规则决定是否重编译
main: swuthesis-main.pdf
graduate: swuthesis-graduate-main.pdf
postdoc: swuthesis-postdoc-main.pdf
doc: swuthesis-doc.pdf

clean:
	rm -f *.aux *.idx *.ilg *.ind *.log *.out *.toc *.glo *.gls *.tmp *.xref *.bbl *.bcf *.blg *.run.xml *.hd

distclean: clean
	rm -f *main.pdf *doc.pdf *-main.tex *-blx.bib *-main.bib *-patch.sty
