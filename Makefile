LATEX := xelatex
DOCLATEX := xelatex
STRIPLATEX := latex
INDEX := makeindex

# 伪目标：无对应文件名（all / 各示例别名 / cls）及 clean。勿再把「带配方的 main」
# 做成伪目标——否则会每次重跑 xelatex；现已改为由 *.pdf 规则决定是否重编译。
#
# install / uninstall：需 POSIX shell 与 Unix 式命令（cp、mkdir、rm）。在 Windows 上请用
# Git Bash、MSYS2 或 WSL，并确保 TeX 的 bin（含 kpsewhich、mktexlsr）在 PATH 中。
# TeX Live / MacTeX / Linux：通常 kpsewhich 可解析 TEXMFHOME。
# MiKTeX：请使用同一终端环境，使 kpsewhich 指向用户 texmf；数据库刷新优先 mktexlsr，否则 initexmf --update-fndb。
.PHONY: all clean distclean cls main graduate postdoc doc install uninstall

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

# 安装到用户 TEX 树（TDS 式布局，对应「运行时 / 源码 / 手册 / 示例」）：
#   $(TEXMFHOME)/tex/latex/swuthesis/     — .cls、.sty
#   $(TEXMFHOME)/source/latex/swuthesis/ — .dtx、.ins（TeX 目录标准名为 source/，即常见的 sources）
#   $(TEXMFHOME)/doc/latex/swuthesis/    — swuthesis-doc.pdf（若已 make doc）
#   $(TEXMFHOME)/doc/latex/swuthesis/examples/ — examples/*.tex 与抽取的 *-main.tex
# 覆盖：make install TEXMFHOME=$HOME/texmf
install: cls
	@set -e; \
	TEXMFHOME="$(TEXMFHOME)"; \
	if [ -z "$$TEXMFHOME" ]; then TEXMFHOME=$$(kpsewhich -var-value=TEXMFHOME 2>/dev/null || true); fi; \
	if [ -z "$$TEXMFHOME" ]; then TEXMFHOME="$$HOME/texmf"; \
	  echo "==> Note: TEXMFHOME unset; using $$TEXMFHOME (override: make install TEXMFHOME=...)"; \
	fi; \
	TEXDIR="$$TEXMFHOME/tex/latex/swuthesis"; \
	SRCDIR="$$TEXMFHOME/source/latex/swuthesis"; \
	DOCDIR="$$TEXMFHOME/doc/latex/swuthesis"; \
	EXDIR="$$DOCDIR/examples"; \
	echo "==> Installing under $$TEXMFHOME (TDS layout)"; \
	echo "    tex/latex/swuthesis -> cls, sty"; \
	echo "    source/latex/swuthesis -> dtx, ins"; \
	echo "    doc/latex/swuthesis -> doc pdf (if present)"; \
	echo "    doc/latex/swuthesis/examples -> example tex"; \
	mkdir -p "$$TEXDIR" "$$SRCDIR" "$$DOCDIR" "$$EXDIR"; \
	cp -f swuthesis.cls swuthesis-doc-patch.sty "$$TEXDIR/"; \
	cp -f swuthesis.dtx swuthesis.ins "$$SRCDIR/"; \
	if [ -f swuthesis-doc.pdf ]; then cp -f swuthesis-doc.pdf "$$DOCDIR/"; \
	else echo "==> Skip swuthesis-doc.pdf (run: make doc)"; fi; \
	for f in examples/*.tex; do \
	  if [ -f "$$f" ]; then cp -f "$$f" "$$EXDIR/"; fi; \
	done; \
	for f in swuthesis-main.tex swuthesis-graduate-main.tex swuthesis-postdoc-main.tex; do \
	  if [ -f "$$f" ]; then cp -f "$$f" "$$EXDIR/"; fi; \
	done; \
	if command -v mktexlsr >/dev/null 2>&1; then \
	  mktexlsr "$$TEXMFHOME" 2>/dev/null || mktexlsr || true; \
	elif command -v texhash >/dev/null 2>&1; then \
	  texhash "$$TEXMFHOME" 2>/dev/null || texhash || true; \
	elif command -v initexmf >/dev/null 2>&1; then \
	  initexmf --update-fndb || true; \
	else \
	  echo "==> Warning: no mktexlsr/texhash/initexmf found; refresh filename database manually."; \
	fi; \
	echo "==> Installed. Verify from a neutral directory:"; \
	( cd /tmp && kpsewhich swuthesis.cls ) || echo "    (empty until FNDB refreshes; open a new shell or run mktexlsr again)"

uninstall:
	@set -e; \
	TEXMFHOME="$(TEXMFHOME)"; \
	if [ -z "$$TEXMFHOME" ]; then TEXMFHOME=$$(kpsewhich -var-value=TEXMFHOME 2>/dev/null || true); fi; \
	if [ -z "$$TEXMFHOME" ]; then TEXMFHOME="$$HOME/texmf"; fi; \
	TEXDIR="$$TEXMFHOME/tex/latex/swuthesis"; \
	SRCDIR="$$TEXMFHOME/source/latex/swuthesis"; \
	DOCDIR="$$TEXMFHOME/doc/latex/swuthesis"; \
	EXDIR="$$DOCDIR/examples"; \
	echo "==> Removing installed swuthesis files under $$TEXMFHOME"; \
	rm -f "$$TEXDIR/swuthesis.cls" "$$TEXDIR/swuthesis-doc-patch.sty"; \
	rmdir "$$TEXDIR" 2>/dev/null || true; \
	rm -f "$$SRCDIR/swuthesis.dtx" "$$SRCDIR/swuthesis.ins"; \
	rmdir "$$SRCDIR" 2>/dev/null || true; \
	rm -f "$$EXDIR/swusetup-bachelor.tex" "$$EXDIR/swusetup-master.tex" \
	  "$$EXDIR/swusetup-doctor.tex" "$$EXDIR/swusetup-postdoc.tex" \
	  "$$EXDIR/swuthesis-main.tex" "$$EXDIR/swuthesis-graduate-main.tex" \
	  "$$EXDIR/swuthesis-postdoc-main.tex"; \
	rmdir "$$EXDIR" 2>/dev/null || true; \
	rm -f "$$DOCDIR/swuthesis-doc.pdf"; \
	rmdir "$$DOCDIR" 2>/dev/null || true; \
	if command -v mktexlsr >/dev/null 2>&1; then \
	  mktexlsr "$$TEXMFHOME" 2>/dev/null || mktexlsr || true; \
	elif command -v texhash >/dev/null 2>&1; then \
	  texhash "$$TEXMFHOME" 2>/dev/null || texhash || true; \
	elif command -v initexmf >/dev/null 2>&1; then \
	  initexmf --update-fndb || true; \
	fi
