%%
%% This is file `swuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% swuthesis.dtx  (with options: `class')
%% This is a generated file.
%% 
%% It was extracted from swuthesis.dtx.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{swuthesis}[2026/04/19 v0.2 Southwest University thesis template]
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=swu,prefix=swu@}
\DeclareBoolOption[false]{postdoc}
\DeclareBoolOption[false]{doctor}
\DeclareBoolOption[false]{master}
\DeclareBoolOption[false]{bachelor}
\DeclareBoolOption[false]{print}
\newif\ifswu@twoside
\swu@twosidefalse
\DeclareVoidOption{oneside}{\swu@twosidefalse}
\DeclareVoidOption{twoside}{\swu@twosidetrue}
\ProcessKeyvalOptions*
\ifswu@twoside
  \LoadClass[12pt,a4paper,twoside]{book}
\else
  \LoadClass[12pt,a4paper,oneside]{book}
\fi
\newif\ifswu@gradthesis
\swu@gradthesisfalse
\ifswu@doctor
  \swu@gradthesistrue
\else\ifswu@master
  \swu@gradthesistrue
\fi\fi
\makeatletter
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage[heading=true,zihao=-4]{ctex}
\setmainfont{Times New Roman}
\RequirePackage{amsmath,amssymb}
\RequirePackage{amsthm}
\RequirePackage{aliascnt}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage[bookmarksnumbered=true]{hyperref}
\RequirePackage{bookmark}
\RequirePackage{hologo}% \hologo{XeLaTeX} 等引擎与格式名称的专业排版
\RequirePackage{xurl}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{tocloft}
\RequirePackage{caption}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{listings}
\RequirePackage[
  backend=biber,
  style=gb7714-2025,
  sorting=none,
  doi=false,
  url=false,
  eprint=true
]{biblatex}
\DeclareFieldFormat{eprint:arxiv}{%
  \mkbibacro{arXiv}\addcolon\space\href{https://arxiv.org/abs/#1}{#1}%
  \iffieldundef{eprintclass}{}{\space\mkbibbrackets{\thefield{eprintclass}}}%
}
\AtEveryBibitem{%
  \ifboolexpr{%
    test {\iffieldequalstr{eprinttype}{arxiv}} or
    test {\iffieldequalstr{eprinttype}{arXiv}}%
  }%
    {%
      \clearfield{url}%
      \clearfield{urlraw}%
      \clearfield{urldate}%
      \clearlist{institution}%
    }{}%
}
\renewbibmacro*{modifydate}{%
  \ifboolexpr{%
    test {\iffieldequalstr{eprinttype}{arxiv}} or
    test {\iffieldequalstr{eprinttype}{arXiv}}%
  }%
    {\usebibmacro{newsdate}}
    {%
      \iffieldundef{eventday}%
         {%
           \iffieldundef{endday}{%
               \iffieldundef{day}{%
               \iffieldundef{year}{}
                 {\printtext{\gbleftparen}\blx@gbdate{}{}\printtext{\gbrightparen}}%
               }%
               {\printtext{\gbleftparen}\blx@gbdate{}{}\printtext{\gbrightparen}}%
               }%
              {\printtext{\gbleftparen}\printenddate\printtext{\gbrightparen}}%
         }%
         {\printtext{\gbleftparen}\printeventdate\printtext{\gbrightparen}}%
    }%
}
\renewbibmacro*{urldate}{%
  \addthinspace
  \printtext{访问日期}%
  \printtext{：}\printurldate%
}
\let\cite\supercite
\newtheoremstyle{swuplain}%
  {3pt}{3pt}%
  {\normalfont\kaishu\zihao{-4}}%
  {}%
  {\normalfont\songti\bfseries\zihao{-4}}%
  {.}{1\ccwd}%
  {}
\newtheoremstyle{swudefinition}%
  {3pt}{3pt}%
  {\normalfont\kaishu\zihao{-4}}%
  {}%
  {\normalfont\songti\bfseries\zihao{-4}}%
  {.}{1\ccwd}%
  {}
\newtheoremstyle{swuremark}%
  {3pt}{3pt}%
  {\normalfont\kaishu\zihao{-4}}%
  {}%
  {\normalfont\songti\bfseries\zihao{-4}}%
  {.}{1\ccwd}%
  {}
\theoremstyle{swuplain}
\newtheorem{theorem}{定理}[chapter]
\newaliascnt{lemma}{theorem}
\newtheorem{lemma}[lemma]{引理}
\aliascntresetthe{lemma}
\newaliascnt{proposition}{theorem}
\newtheorem{proposition}[proposition]{命题}
\aliascntresetthe{proposition}
\newaliascnt{corollary}{theorem}
\newtheorem{corollary}[corollary]{推论}
\aliascntresetthe{corollary}
\newaliascnt{hypothesis}{theorem}
\newtheorem{hypothesis}[hypothesis]{假设}
\aliascntresetthe{hypothesis}
\theoremstyle{swudefinition}
\newaliascnt{definition}{theorem}
\newtheorem{definition}[definition]{定义}
\aliascntresetthe{definition}
\newaliascnt{example}{theorem}
\newtheorem{example}[example]{例}
\aliascntresetthe{example}
\theoremstyle{swuremark}
\newaliascnt{remark}{theorem}
\newtheorem{remark}[remark]{注}
\aliascntresetthe{remark}
\newtheorem{thm}[theorem]{定理}
\newtheorem{lem}[lemma]{引理}
\newtheorem{prop}[proposition]{命题}
\newtheorem{cor}[corollary]{推论}
\newtheorem{hyp}[hypothesis]{假设}
\newtheorem{defn}[definition]{定义}
\newtheorem{ex}[example]{例}
\newtheorem{rmk}[remark]{注}
\renewenvironment{proof}[1][\proofname]{%
  \par\pushQED{\qed}%
  \normalfont\topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep\normalfont\songti\bfseries\zihao{-4}#1\@addpunct{.}]%
  \ignorespaces\normalfont\songti\zihao{-4}%
}{%
  \popQED\endtrivlist\@endpefalse
}%
\RequirePackage[nameinlink]{cleveref}
\crefname{theorem}{定理}{定理}
\Crefname{theorem}{定理}{定理}
\crefname{lemma}{引理}{引理}
\Crefname{lemma}{引理}{引理}
\crefname{proposition}{命题}{命题}
\Crefname{proposition}{命题}{命题}
\crefname{corollary}{推论}{推论}
\Crefname{corollary}{推论}{推论}
\crefname{hypothesis}{假设}{假设}
\Crefname{hypothesis}{假设}{假设}
\crefname{definition}{定义}{定义}
\Crefname{definition}{定义}{定义}
\crefname{example}{例}{例}
\Crefname{example}{例}{例}
\crefname{remark}{注}{注}
\Crefname{remark}{注}{注}
\crefname{equation}{式}{式}
\Crefname{equation}{式}{式}
\crefname{figure}{图}{图}
\Crefname{figure}{图}{图}
\crefname{table}{表}{表}
\Crefname{table}{表}{表}
\AtBeginDocument{%
  \renewcommand{\crefpairconjunction}{ 和 }%
  \renewcommand{\crefmiddleconjunction}{、}%
  \renewcommand{\creflastconjunction}{ 与 }%
  \renewcommand{\crefpairgroupconjunction}{ 和 }%
  \renewcommand{\crefmiddlegroupconjunction}{、}%
  \renewcommand{\creflastgroupconjunction}{ 与 }%
  \renewcommand{\crefrangeconjunction}{至\nobreakspace}%
  % 「第…章/节」须用 \creflabelformat：|nameinlink| 只在标签层给编号加链接；
  % 若用 \crefformat 把「第」「章」写在外层，则超链接仅覆盖编号。
  % 类型名置空，避免与「第…章」重复；附录中的 |\chapter| 仍勿用 |\cref|。
  \crefname{chapter}{}{}%
  \Crefname{chapter}{}{}%
  \creflabelformat{chapter}{第#2#1#3章}%
  \crefrangelabelformat{chapter}{第#3#1#4章至第#5#2#6章}%
  \crefname{section}{}{}%
  \Crefname{section}{}{}%
  \creflabelformat{section}{第#2#1#3节}%
  \crefrangelabelformat{section}{第#3#1#4节至第#5#2#6节}%
  \crefname{subsection}{}{}%
  \Crefname{subsection}{}{}%
  \creflabelformat{subsection}{第#2#1#3小节}%
  \crefrangelabelformat{subsection}{第#3#1#4小节至第#5#2#6小节}%
  \crefname{subsubsection}{}{}%
  \Crefname{subsubsection}{}{}%
  \creflabelformat{subsubsection}{第#2#1#3目}%
  \crefrangelabelformat{subsubsection}{第#3#1#4目至第#5#2#6目}%
  \hypersetup{pdflang=zh-CN}%
  \def\chapterautorefname{章}%
  \def\sectionautorefname{节}%
  \def\subsectionautorefname{小节}%
  \def\subsubsectionautorefname{目}%
  \def\equationautorefname{式}%
  \def\figureautorefname{图}%
  \def\tableautorefname{表}%
  % cleveref 在 |\begin{document}| 之初已按当时定义生成 |\cref@…@format|；
  % 此后才执行的 |\creflabelformat| 不会自动重算外层引用格式，
  % 会导致 |\cref| 仅显示阿拉伯数字。
  \@crefdefineallformats{chapter}%
  \@crefdefineallformats{section}%
  \@crefdefineallformats{subsection}%
  \@crefdefineallformats{subsubsection}%
}
\ifswu@gradthesis
\DeclareCaptionFont{swucaptionfont}{\heiti\zihao{5}}
\else
\DeclareCaptionFont{swucaptionfont}{\songti\zihao{5}}
\fi
\captionsetup{
  font=swucaptionfont,
  labelfont=swucaptionfont
}
\lstdefinestyle{swucode}{
  backgroundcolor=\color{gray!8},
  basicstyle=\ttfamily\small,
  keywordstyle=\color{blue!70!black}\bfseries,
  commentstyle=\color{green!40!black},
  stringstyle=\color{orange!60!black},
  numbers=none,
  linewidth=\linewidth,
  xleftmargin=0pt,
  xrightmargin=0pt,
  columns=fullflexible,
  keepspaces=true,
  frame=single,
  rulecolor=\color{gray!40},
  frameround=tttt,
  breaklines=true,
  breakatwhitespace=false,
  breakindent=0pt,
  showstringspaces=false,
  tabsize=2
}
\lstdefinestyle{swucodeprint}{
  backgroundcolor=\color{white},
  basicstyle=\ttfamily\small,
  keywordstyle=\bfseries,
  commentstyle=\itshape,
  stringstyle=\ttfamily,
  numbers=none,
  linewidth=\linewidth,
  xleftmargin=0pt,
  xrightmargin=0pt,
  columns=fullflexible,
  keepspaces=true,
  frame=single,
  rulecolor=\color{black},
  frameround=tttt,
  breaklines=true,
  breakatwhitespace=false,
  breakindent=0pt,
  showstringspaces=false,
  tabsize=2
}
\renewcommand{\lstlistingname}{代码}
\renewcommand{\lstlistlistingname}{代码目录}
\geometry{
  a4paper,
  left=25mm,
  right=25mm,
  top=30mm,
  bottom=25mm,
  bindingoffset=10mm,
  headsep=23mm,
  footskip=18mm
}
\ifswu@print
  \lstset{style=swucodeprint}
\else
  \lstset{style=swucode}
\fi
\ifswu@gradthesis
  \setcounter{tocdepth}{2}
\else
  \setcounter{tocdepth}{3}
\fi
\renewcommand{\cfttoctitlefont}{\hfill\heiti\zihao{3}}
\renewcommand{\cftaftertoctitle}{\hfill}
\setlength{\cftbeforetoctitleskip}{\baselineskip}
\setlength{\cftaftertoctitleskip}{2\baselineskip}
\renewcommand{\cftchapfont}{\songti\zihao{-4}}
\renewcommand{\cftsecfont}{\songti\zihao{-4}}
\renewcommand{\cftsubsecfont}{\songti\zihao{-4}}
\renewcommand{\cftchappagefont}{\rmfamily\zihao{-4}}
\renewcommand{\cftsecpagefont}{\rmfamily\zihao{-4}}
\renewcommand{\cftsubsecpagefont}{\rmfamily\zihao{-4}}
\renewcommand{\cftdotsep}{1}
\setlength{\cftbeforechapskip}{0pt}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\pretocmd{\@cftmaketoctitle}{%
  \phantomsection
  \pdfbookmark[0]{目录}{swu-toc}%
}{}{%
  \PackageWarning{swuthesis}{tocloft:~@cftmaketoctitle~patch~failed~for~bookmark}%
}
\newcommand{\swu@thesisheadertext}{%
  \ifswu@doctor 西南大学博士学位论文\else
  \ifswu@master 西南大学硕士学位论文\else
  西南大学学位论文\fi\fi
}
\pagestyle{fancy}
\fancyhf{}
\ifswu@gradthesis
  \fancyfoot[C]{\songti\zihao{-5}\thepage}
\else
  \fancyfoot[C]{\thepage}
\fi
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{swugraduate}{%
  \fancyhf{}%
  \ifswu@twoside
    \fancyhead[EC]{\songti\zihao{5}\swu@thesisheadertext}%
    \fancyhead[OC]{\songti\zihao{5}\leftmark}%
  \else
    \fancyhead[L]{\songti\zihao{5}\swu@thesisheadertext}%
    \fancyhead[R]{\songti\zihao{5}\leftmark}%
  \fi
  \fancyfoot[C]{\songti\zihao{-5}\thepage}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\headrule}{%
    \hrule height 2.25pt width \headwidth
    \vskip 0.35pt
    \hrule height 0.4pt width \headwidth
  }%
}
\AtBeginDocument{%
  \ifswu@gradthesis
    \addtolength{\headheight}{8pt}%
  \fi
  \let\swu@oldtableofcontents\tableofcontents
  \renewcommand{\tableofcontents}{%
    \clearpage
    \ifswu@postdoc\else\pagenumbering{Roman}\fi
    \begingroup
    \ifswu@gradthesis
      \setstretch{1.67}%
    \else
      \setstretch{1.5}%
    \fi
    \swu@oldtableofcontents
    \endgroup
  }%
}%
\newcommand{\swutableofcontents}{\tableofcontents}
\ifswu@gradthesis
\ctexset{
  chapter = {
    name      = {第,章},
    number    = \arabic{chapter},
    aftername = \hspace{1em},
    format    = \centering\heiti\bfseries\zihao{3},
    beforeskip = 0.5\baselineskip,
    afterskip  = 0.5\baselineskip
  },
  appendix = {
    name      = {附录, },
    numbering = true
  },
  section = {
    format = \heiti\bfseries\zihao{4},
    beforeskip = 0.5\baselineskip,
    afterskip = 0.5\baselineskip
  },
  subsection = {
    format = \heiti\bfseries\zihao{-4},
    beforeskip = 0.5\baselineskip,
    afterskip = 0.5\baselineskip
  }
}
\else
\ctexset{
  chapter = {
    name      = {第,章},
    number    = \arabic{chapter},
    aftername = \hspace{1em},
    format    = \centering\heiti\bfseries\zihao{4},
    beforeskip = 0.5\baselineskip,
    afterskip  = 0.5\baselineskip
  },
  appendix = {
    name      = {附录, },
    numbering = true
  },
  section = {
    format = \heiti\bfseries\zihao{-4},
    beforeskip = 0.5\baselineskip,
    afterskip = 0.5\baselineskip
  },
  subsection = {
    format = \songti\bfseries\zihao{-4},
    beforeskip = 0.5\baselineskip,
    afterskip = 0.5\baselineskip
  }
}
\fi
\pretocmd{\appendix}{
  \@mainmattertrue
  \ctexset{
    chapter = {
      number    = \Alph{chapter},
      aftername = \hspace{0.6em},
      format    = \centering\heiti\bfseries\ifswu@gradthesis\zihao{3}\else\zihao{-3}\fi,
      beforeskip = 0.5\baselineskip,
      afterskip  = 0.5\baselineskip
    }
  }
}{}{}
\captionsetup[figure]{position=bottom}
\captionsetup[table]{position=top}
\numberwithin{equation}{chapter}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
\def\tagform@#1{\maketag@@@{\rmfamily\zihao{-4}(#1)}}
\newcommand{\swumainmatterstyle}{%
  \songti\zihao{-4}%
  \ifswu@gradthesis
    \setstretch{1.67}%
  \else
    \setstretch{1.5}%
  \fi
  \setlength{\parindent}{2\ccwd}%
}
\let\swuoldmainmatter\mainmatter
\renewcommand{\mainmatter}{%
  \swuoldmainmatter
  \swumainmatterstyle
  \ifswu@gradthesis\pagestyle{swugraduate}\fi
}
\newcommand\swu@doctype{学位论文}
\ifswu@postdoc
  \renewcommand\swu@doctype{博士后研究报告}
\else\ifswu@doctor
  \renewcommand\swu@doctype{博士学位论文}
\else\ifswu@master
  \renewcommand\swu@doctype{硕士学位论文}
\else\ifswu@bachelor
  \renewcommand\swu@doctype{本科毕业论文}
\fi\fi\fi\fi
\newcommand{\swuThesisTierZh}{研究生}
\ifswu@doctor
  \renewcommand{\swuThesisTierZh}{博士}
\else\ifswu@master
  \renewcommand{\swuThesisTierZh}{硕士}
\else\ifswu@postdoc
  \renewcommand{\swuThesisTierZh}{博士后}
\else\ifswu@bachelor
  \renewcommand{\swuThesisTierZh}{本科}
\fi\fi\fi\fi
\newcommand{\swuThesisEnDocRole}{graduate thesis}
\ifswu@doctor
  \renewcommand{\swuThesisEnDocRole}{doctoral dissertation}
\else\ifswu@master
  \renewcommand{\swuThesisEnDocRole}{master's thesis}
\fi\fi
\newcommand\swu@title{}
\newcommand\swu@author{}
\newcommand\swu@studentid{}
\newcommand\swu@supervisor{}
\newcommand\swu@degree{}
\newcommand\swu@major{}
\newcommand\swu@subtitle{}
\newcommand\swu@college{}
\newcommand\swu@defenseyear{}
\newcommand\swu@defensemonth{}
\newcommand\swu@defenseday{}
\RequirePackage{l3keys2e}
\ExplSyntaxOn
\tl_new:N \l_swu_k_research_field_tl
\tl_new:N \l_swu_k_degree_en_tl
\tl_new:N \l_swu_k_supervisor_en_tl
\tl_new:N \l_swu_k_submit_year_tl
\tl_new:N \l_swu_k_submit_month_tl
\tl_new:N \l_swu_k_submit_day_tl
\tl_new:N \l_swu_k_postdoc_classification_tl
\tl_new:N \l_swu_k_postdoc_udc_tl
\tl_new:N \l_swu_k_postdoc_id_tl
\tl_new:N \l_swu_k_postdoc_confidentiality_tl
\tl_new:N \l_swu_k_postdoc_station_tl
\tl_new:N \l_swu_k_postdoc_unit_tl
\tl_new:N \l_swu_k_postdoc_work_start_tl
\tl_new:N \l_swu_k_postdoc_work_end_tl
\tl_new:N \l_swu_k_postdoc_report_date_tl
\tl_new:N \l_swu_k_postdoc_publisher_tl
\tl_new:N \l_swu_k_postdoc_publish_address_tl
\tl_new:N \l_swu_k_postdoc_cover_bottom_date_tl
\tl_new:N \l_swu_k_postdoc_mailing_postcode_tl
\tl_new:N \l_swu_k_postdoc_mailing_address_tl
\tl_new:N \l_swu_k_postdoc_mailing_phone_tl
\tl_new:N \l_swu_k_postdoc_mailing_email_tl
\seq_new:N \l__swu_date_parse_seq
\tl_new:N \l__swu_date_input_tl
\tl_new:N \l__swu_thesis_label_sub_scratch_tl
\tl_new:N \l__swu_postdoc_ym_scratch_tl
\cs_new_protected:Npn \__swu_date_from_yyyymmdd:nNNN #1#2#3#4
{
\tl_set:Nx \l__swu_date_input_tl { \tl_trim_spaces:n {#1} }
\seq_set_split:NnV \l__swu_date_parse_seq { / } \l__swu_date_input_tl
\int_compare:nNnTF { \seq_count:N \l__swu_date_parse_seq } = { 3 }
{
\tl_set:Nx #2
{ \tl_trim_spaces:n { \seq_item:Nn \l__swu_date_parse_seq { 1 } } }
\tl_set:Nx #3
{
\int_eval:n
{ \tl_trim_spaces:n { \seq_item:Nn \l__swu_date_parse_seq { 2 } } }
}
\tl_set:Nx #4
{
\int_eval:n
{ \tl_trim_spaces:n { \seq_item:Nn \l__swu_date_parse_seq { 3 } } }
}
}
{
\PackageError { swuthesis }
{ Invalid~YYYY/MM/DD~date~`\tl_to_str:N \l__swu_date_input_tl'. }
{ Use~YYYY/MM/DD~with~three~non-empty~parts,~e.g.~2026/3/15. }
}
}
\cs_new_protected:Npn \__swu_thesis_label_sub_normalise:N #1
{
\int_compare:nNnTF { \tl_count:N #1 } > { 2 }
{
\str_if_eq:eeTF { \tl_range:Nnn #1 { 1 } { 1 } } { （ }
{
\str_if_eq:eeTF { \tl_range:Nnn #1 { -1 } { -1 } } { ） }
{ \tl_set:Nx #1 { \tl_range:Nnn #1 { 2 } { -2 } } }
{ }
}
{ }
}
{ }
}
\cs_new_protected:Npn \__swu_degree_sub_en_line_strip_parens:N #1
{
\int_compare:nNnTF { \tl_count:N #1 } > { 2 }
{
\str_if_eq:eeTF { \tl_range:Nnn #1 { 1 } { 1 } } { ( }
{
\str_if_eq:eeTF { \tl_range:Nnn #1 { -1 } { -1 } } { ) }
{ \tl_set:Nx #1 { \tl_range:Nnn #1 { 2 } { -2 } } }
{ }
}
{ }
}
{ }
}
\seq_new:N \l__swu_degree_sub_en_lines_seq
\tl_new:N \l__swu_degree_sub_en_line_tl
\bool_new:N \l__swu_degree_sub_en_need_sep_bool
\keys_define:nn { swu / setup }
{
title      .tl_set:N = \l_tmpa_tl,
author     .tl_set:N = \l_tmpb_tl,
subtitle   .tl_set:N = \l_tmpk_tl,
student-id .tl_set:N = \l_tmpc_tl,
supervisor .tl_set:N = \l_tmpd_tl,
degree     .tl_set:N = \l_tmpe_tl,
major      .tl_set:N = \l_tmpf_tl,
college      .tl_set:N = \l_tmpg_tl,
title-en      .tl_set:N = \l_tmpl_tl,
author-en     .tl_set:N = \l_tmpm_tl,
college-en    .tl_set:N = \l_tmpn_tl,
defense-year .tl_set:N = \l_tmph_tl,
defense-month.tl_set:N = \l_tmpi_tl,
defense-day  .tl_set:N = \l_tmpj_tl,
research-field .tl_set:N = \l_swu_k_research_field_tl,
degree-en      .tl_set:N = \l_swu_k_degree_en_tl,
supervisor-en  .tl_set:N = \l_swu_k_supervisor_en_tl,
graduate-program-en .tl_set:N = \l_swu_k_graduate_program_en_tl,
submitted-school-en .tl_set:N = \l_swu_k_submitted_school_en_tl,
university-en       .tl_set:N = \l_swu_k_university_en_tl,
defense-location-en .tl_set:N = \l_swu_k_defense_location_en_tl,
submit-year  .tl_set:N = \l_swu_k_submit_year_tl,
submit-month .tl_set:N = \l_swu_k_submit_month_tl,
submit-day   .tl_set:N = \l_swu_k_submit_day_tl,
submit-date .code:n = {
\__swu_date_from_yyyymmdd:nNNN {#1}
\l_swu_k_submit_year_tl \l_swu_k_submit_month_tl \l_swu_k_submit_day_tl
},
postdoc-classification .tl_set:N = \l_swu_k_postdoc_classification_tl,
postdoc-udc .tl_set:N = \l_swu_k_postdoc_udc_tl,
postdoc-id .tl_set:N = \l_swu_k_postdoc_id_tl,
postdoc-confidentiality .tl_set:N = \l_swu_k_postdoc_confidentiality_tl,
postdoc-station .tl_set:N = \l_swu_k_postdoc_station_tl,
postdoc-unit .tl_set:N = \l_swu_k_postdoc_unit_tl,
postdoc-work-start .tl_set:N = \l_swu_k_postdoc_work_start_tl,
postdoc-work-end   .tl_set:N = \l_swu_k_postdoc_work_end_tl,
postdoc-report-date .tl_set:N = \l_swu_k_postdoc_report_date_tl,
postdoc-publisher .tl_set:N = \l_swu_k_postdoc_publisher_tl,
postdoc-publish-address .tl_set:N = \l_swu_k_postdoc_publish_address_tl,
postdoc-cover-bottom-date .tl_set:N = \l_swu_k_postdoc_cover_bottom_date_tl,
postdoc-mailing-postcode .tl_set:N = \l_swu_k_postdoc_mailing_postcode_tl,
postdoc-mailing-address  .tl_set:N = \l_swu_k_postdoc_mailing_address_tl,
postdoc-mailing-phone    .tl_set:N = \l_swu_k_postdoc_mailing_phone_tl,
postdoc-mailing-email    .tl_set:N = \l_swu_k_postdoc_mailing_email_tl,
defense-date .code:n = {
\__swu_date_from_yyyymmdd:nNNN {#1} \l_tmph_tl \l_tmpi_tl \l_tmpj_tl
},
thesis-label .code:n = {
  \tl_gset:Nx \g_swu_thesis_label_tl { \tl_trim_spaces:n { #1 } }
},
thesis-label-sub .code:n = {
  \tl_set:Nx \l__swu_thesis_label_sub_scratch_tl { \tl_trim_spaces:n {#1} }
  \__swu_thesis_label_sub_normalise:N \l__swu_thesis_label_sub_scratch_tl
  \tl_gset_eq:NN \g_swu_thesis_label_sub_tl \l__swu_thesis_label_sub_scratch_tl
},
thesis-label-sub-en .code:n = {
  \tl_gset:Nx \g_swu_thesis_label_sub_en_tl { \tl_trim_spaces:n {#1} }
},
}
\NewDocumentCommand{\swusetup}{m}
{
\tl_gclear:N \g_swu_thesis_label_sub_tl
\tl_gclear:N \g_swu_thesis_label_sub_en_tl
\keys_set:nn { swu / setup } { #1 }
\tl_gset_eq:NN \g_swu_title_tl      \l_tmpa_tl
\tl_gset_eq:NN \g_swu_author_tl     \l_tmpb_tl
\tl_gset_eq:NN \g_swu_subtitle_tl   \l_tmpk_tl
\tl_gset_eq:NN \g_swu_studentid_tl  \l_tmpc_tl
\tl_gset_eq:NN \g_swu_supervisor_tl \l_tmpd_tl
\tl_gset_eq:NN \g_swu_degree_tl     \l_tmpe_tl
\tl_gset_eq:NN \g_swu_major_tl      \l_tmpf_tl
\tl_gset_eq:NN \g_swu_college_tl     \l_tmpg_tl
\tl_gset_eq:NN \g_swu_title_en_tl    \l_tmpl_tl
\tl_gset_eq:NN \g_swu_author_en_tl   \l_tmpm_tl
\tl_gset_eq:NN \g_swu_college_en_tl  \l_tmpn_tl
\tl_gset_eq:NN \g_swu_defenseyear_tl \l_tmph_tl
\tl_gset_eq:NN \g_swu_defensemonth_tl \l_tmpi_tl
\tl_gset_eq:NN \g_swu_defenseday_tl  \l_tmpj_tl
\tl_gset_eq:NN \g_swu_research_field_tl \l_swu_k_research_field_tl
\tl_gset_eq:NN \g_swu_degree_en_tl   \l_swu_k_degree_en_tl
\tl_gset_eq:NN \g_swu_supervisor_en_tl \l_swu_k_supervisor_en_tl
\tl_gset_eq:NN \g_swu_graduate_program_en_tl \l_swu_k_graduate_program_en_tl
\tl_gset_eq:NN \g_swu_submitted_school_en_tl \l_swu_k_submitted_school_en_tl
\tl_gset_eq:NN \g_swu_university_en_tl       \l_swu_k_university_en_tl
\tl_gset_eq:NN \g_swu_defense_location_en_tl \l_swu_k_defense_location_en_tl
\tl_gset_eq:NN \g_swu_submit_year_tl  \l_swu_k_submit_year_tl
\tl_gset_eq:NN \g_swu_submit_month_tl \l_swu_k_submit_month_tl
\tl_gset_eq:NN \g_swu_submit_day_tl   \l_swu_k_submit_day_tl
\tl_gset_eq:NN \g_swu_postdoc_classification_tl \l_swu_k_postdoc_classification_tl
\tl_gset_eq:NN \g_swu_postdoc_udc_tl  \l_swu_k_postdoc_udc_tl
\tl_gset_eq:NN \g_swu_postdoc_id_tl   \l_swu_k_postdoc_id_tl
\tl_gset_eq:NN \g_swu_postdoc_confidentiality_tl \l_swu_k_postdoc_confidentiality_tl
\tl_gset_eq:NN \g_swu_postdoc_station_tl \l_swu_k_postdoc_station_tl
\tl_gset_eq:NN \g_swu_postdoc_unit_tl \l_swu_k_postdoc_unit_tl
\tl_gset_eq:NN \g_swu_postdoc_work_start_tl \l_swu_k_postdoc_work_start_tl
\tl_gset_eq:NN \g_swu_postdoc_work_end_tl \l_swu_k_postdoc_work_end_tl
\tl_gset_eq:NN \g_swu_postdoc_report_date_tl \l_swu_k_postdoc_report_date_tl
\tl_gset_eq:NN \g_swu_postdoc_publisher_tl \l_swu_k_postdoc_publisher_tl
\tl_gset_eq:NN \g_swu_postdoc_publish_address_tl \l_swu_k_postdoc_publish_address_tl
\tl_gset_eq:NN \g_swu_postdoc_cover_bottom_date_tl
  \l_swu_k_postdoc_cover_bottom_date_tl
\tl_gset_eq:NN \g_swu_postdoc_mailing_postcode_tl \l_swu_k_postdoc_mailing_postcode_tl
\tl_gset_eq:NN \g_swu_postdoc_mailing_address_tl \l_swu_k_postdoc_mailing_address_tl
\tl_gset_eq:NN \g_swu_postdoc_mailing_phone_tl \l_swu_k_postdoc_mailing_phone_tl
\tl_gset_eq:NN \g_swu_postdoc_mailing_email_tl \l_swu_k_postdoc_mailing_email_tl
}
\tl_new:N \g_swu_title_tl
\tl_new:N \g_swu_author_tl
\tl_new:N \g_swu_subtitle_tl
\tl_new:N \g_swu_studentid_tl
\tl_new:N \g_swu_supervisor_tl
\tl_new:N \g_swu_degree_tl
\tl_new:N \g_swu_major_tl
\tl_new:N \g_swu_college_tl
\tl_new:N \g_swu_title_en_tl
\tl_new:N \g_swu_author_en_tl
\tl_new:N \g_swu_college_en_tl
\tl_new:N \g_swu_abstract_cn_tl
\tl_new:N \g_swu_keywords_cn_tl
\tl_new:N \g_swu_abstract_en_tl
\tl_new:N \g_swu_keywords_en_tl
\tl_new:N \g_swu_defenseyear_tl
\tl_new:N \g_swu_defensemonth_tl
\tl_new:N \g_swu_defenseday_tl
\tl_new:N \g_swu_research_field_tl
\tl_new:N \g_swu_degree_en_tl
\tl_new:N \g_swu_supervisor_en_tl
\tl_new:N \g_swu_graduate_program_en_tl
\tl_new:N \g_swu_submitted_school_en_tl
\tl_new:N \g_swu_university_en_tl
\tl_new:N \g_swu_defense_location_en_tl
\tl_new:N \g_swu_submit_year_tl
\tl_new:N \g_swu_submit_month_tl
\tl_new:N \g_swu_submit_day_tl
\tl_new:N \g_swu_postdoc_classification_tl
\tl_new:N \g_swu_postdoc_udc_tl
\tl_new:N \g_swu_postdoc_id_tl
\tl_new:N \g_swu_postdoc_confidentiality_tl
\tl_new:N \g_swu_postdoc_station_tl
\tl_new:N \g_swu_postdoc_unit_tl
\tl_new:N \g_swu_postdoc_work_start_tl
\tl_new:N \g_swu_postdoc_work_end_tl
\tl_new:N \g_swu_postdoc_report_date_tl
\tl_new:N \g_swu_postdoc_publisher_tl
\tl_new:N \g_swu_postdoc_publish_address_tl
\tl_new:N \g_swu_postdoc_cover_bottom_date_tl
\tl_new:N \g_swu_postdoc_mailing_postcode_tl
\tl_new:N \g_swu_postdoc_mailing_address_tl
\tl_new:N \g_swu_postdoc_mailing_phone_tl
\tl_new:N \g_swu_postdoc_mailing_email_tl
\tl_new:N \g_swu_thesis_label_tl
\tl_new:N \g_swu_thesis_label_sub_tl
\tl_new:N \g_swu_thesis_label_sub_en_tl
\cs_new:Npn \swuCoverThesisLabelText
  {
    \tl_if_blank:VTF \g_swu_thesis_label_tl
      { \swu@doctype }
      { \tl_use:N \g_swu_thesis_label_tl }
  }
\cs_new:Npn \swuCoverThesisLabelSubText { \tl_use:N \g_swu_thesis_label_sub_tl }
\cs_new:Npn \swuCoverThesisLabelSubEnText { \tl_use:N \g_swu_thesis_label_sub_en_tl }
\cs_new:Npn \swuPostdocClassificationText { \tl_use:N
  \g_swu_postdoc_classification_tl }
\cs_new:Npn \swuPostdocUDCText { \tl_use:N \g_swu_postdoc_udc_tl }
\cs_new:Npn \swuPostdocIdText { \tl_use:N \g_swu_postdoc_id_tl }
\cs_new:Npn \swuPostdocConfidentialityText { \tl_use:N
  \g_swu_postdoc_confidentiality_tl }
\cs_new:Npn \swuPostdocStationText { \tl_use:N \g_swu_postdoc_station_tl }
\cs_new:Npn \swuPostdocUnitText {
  \tl_if_blank:VTF \g_swu_postdoc_unit_tl {西南大学}
    { \tl_use:N \g_swu_postdoc_unit_tl }
}
\cs_new:Npn \swuPostdocWorkStartText { \tl_use:N
  \g_swu_postdoc_work_start_tl }
\cs_new:Npn \swuPostdocWorkEndText { \tl_use:N
  \g_swu_postdoc_work_end_tl }
\cs_new_protected:Npn \__swu_postdoc_cover_year_month_from:N #1
{
  \tl_set:Nx \l__swu_postdoc_ym_scratch_tl { \tl_trim_spaces:V #1 }
  \regex_replace_once:nnN { (月)\d{1,2}日\z } { \1 } \l__swu_postdoc_ym_scratch_tl
  \tl_use:N \l__swu_postdoc_ym_scratch_tl
}
\cs_new_protected:Npn \swuPostdocWorkStartYearMonthText
{
  \__swu_postdoc_cover_year_month_from:N \g_swu_postdoc_work_start_tl
}
\cs_new_protected:Npn \swuPostdocWorkEndYearMonthText
{
  \__swu_postdoc_cover_year_month_from:N \g_swu_postdoc_work_end_tl
}
\cs_new:Npn \swuPostdocReportDateText {
  \tl_if_blank:VTF \g_swu_postdoc_report_date_tl
  { \swuDefenseYearText 年\swuDefenseMonthText 月 }
  { \tl_use:N \g_swu_postdoc_report_date_tl }
}
\cs_new:Npn \swuPostdocPublisherText { \tl_use:N
  \g_swu_postdoc_publisher_tl }
\cs_new:Npn \swuPostdocPublishAddressText { \tl_use:N
  \g_swu_postdoc_publish_address_tl }
\cs_new:Npn \swuPostdocPublisherLineText {
  \tl_if_blank:VTF \g_swu_postdoc_publisher_tl
    {西南大学\ （重庆）}
    { \tl_use:N \g_swu_postdoc_publisher_tl }
}
\cs_new:Npn \swuPostdocCoverBottomYearMonthText {
  \tl_if_blank:VTF \g_swu_postdoc_cover_bottom_date_tl
    { \swuPostdocReportDateText }
    { \tl_use:N \g_swu_postdoc_cover_bottom_date_tl }
}
\cs_new:Npn \swuPostdocMailingPostcodeText { \tl_use:N
  \g_swu_postdoc_mailing_postcode_tl }
\cs_new:Npn \swuPostdocMailingAddressText { \tl_use:N
  \g_swu_postdoc_mailing_address_tl }
\cs_new:Npn \swuPostdocMailingPhoneText { \tl_use:N
  \g_swu_postdoc_mailing_phone_tl }
\cs_new:Npn \swuPostdocMailingEmailText { \tl_use:N
  \g_swu_postdoc_mailing_email_tl }
\cs_new_protected:Npn \__swu_degree_sub_en_display:
{
\seq_set_split:NnV \l__swu_degree_sub_en_lines_seq { \par }
  \g_swu_thesis_label_sub_en_tl
\bool_set_false:N \l__swu_degree_sub_en_need_sep_bool
\seq_map_inline:Nn \l__swu_degree_sub_en_lines_seq
{
\tl_set:Nx \l__swu_degree_sub_en_line_tl { \tl_trim_spaces:n {##1} }
\tl_if_blank:VF \l__swu_degree_sub_en_line_tl
{
\bool_if:NT \l__swu_degree_sub_en_need_sep_bool { \par }
\bool_set_true:N \l__swu_degree_sub_en_need_sep_bool
\__swu_degree_sub_en_line_strip_parens:N \l__swu_degree_sub_en_line_tl
(\tl_use:N \l__swu_degree_sub_en_line_tl)
}
}
}
\cs_new_protected:Npn \swu_graduate_degree_sub_en_maybe:
{
\tl_if_blank:VTF \g_swu_thesis_label_sub_en_tl
{ }
{
\skip_vertical:n { 0.18 \baselineskip }
\group_begin:
\rmfamily \zihao{-4}
\__swu_degree_sub_en_display:
\group_end:
\par
}
}
\let \swu@graduate@maybe@degree@sub@en \swu_graduate_degree_sub_en_maybe:
\cs_new_protected:Npn \swu_cover_graduate_thesis_lines:
  {
    {\youyuan\zihao{0}\bfseries \swuCJKStretchText{1.10}{\swuCoverThesisLabelText}\par}
    \tl_if_blank:VTF \g_swu_thesis_label_sub_tl
      { }
      {
\skip_vertical:n { 0.25 \baselineskip }
{
  \youyuan\zihao{1}\bfseries
  \swuCJKStretchText{1.10}{（\swuCoverThesisLabelSubText）}
  \par
}
      }
  }
\let\swu@cover@graduate@thesis@lines\swu_cover_graduate_thesis_lines:
\cs_new:Npn \swuTitleText      { \tl_use:N \g_swu_title_tl }
\cs_new:Npn \swuAuthorText     { \tl_use:N \g_swu_author_tl }
\cs_new:Npn \swuSubtitleText   { \tl_use:N \g_swu_subtitle_tl }
\cs_new:Npn \swuSupervisorText { \tl_use:N \g_swu_supervisor_tl }
\cs_new:Npn \swuDegreeText     { \tl_use:N \g_swu_degree_tl }
\cs_new:Npn \swuMajorText      { \tl_use:N \g_swu_major_tl }
\cs_new:Npn \swuCollegeText      { \tl_use:N \g_swu_college_tl }
\cs_new:Npn \swuTitleEnText      { \tl_use:N \g_swu_title_en_tl }
\cs_new:Npn \swuAuthorEnText     { \tl_use:N \g_swu_author_en_tl }
\cs_new:Npn \swuCollegeEnText    { \tl_use:N \g_swu_college_en_tl }
\cs_new:Npn \swuResearchFieldText { \tl_use:N \g_swu_research_field_tl }
\cs_new:Npn \swuDegreeEnText     { \tl_use:N \g_swu_degree_en_tl }
\cs_new:Npn \swuSupervisorEnText  { \tl_use:N \g_swu_supervisor_en_tl }
\cs_new:Npn \swuGraduateProgramEnText { \tl_use:N \g_swu_graduate_program_en_tl }
\cs_new:Npn \swuSubmittedSchoolEnText { \tl_use:N \g_swu_submitted_school_en_tl }
\cs_new:Npn \swuUniversityEnText       { \tl_use:N \g_swu_university_en_tl }
\cs_new:Npn \swuDefenseLocationEnText { \tl_use:N \g_swu_defense_location_en_tl }
\cs_new:Npn \swuSubmitYearText  { \tl_use:N \g_swu_submit_year_tl }
\cs_new:Npn \swuSubmitMonthText { \tl_use:N \g_swu_submit_month_tl }
\cs_new:Npn \swuSubmitDayText   { \tl_use:N \g_swu_submit_day_tl }
\cs_new:Npn \swuAbstractCnText   { \tl_use:N \g_swu_abstract_cn_tl }
\cs_new:Npn \swuKeywordsCnText   { \tl_use:N \g_swu_keywords_cn_tl }
\cs_new:Npn \swuAbstractEnText   { \tl_use:N \g_swu_abstract_en_tl }
\cs_new:Npn \swuKeywordsEnText   { \tl_use:N \g_swu_keywords_en_tl }
\NewDocumentEnvironment { cnabstract } { +b }
  { }
  {
    \tl_gset:Nx \g_swu_abstract_cn_tl
      { \tl_trim_spaces:n {#1} }
  }
\NewDocumentEnvironment { cnkeywords } { +b }
  { }
  {
    \tl_gset:Nx \g_swu_keywords_cn_tl
      { \tl_trim_spaces:n {#1} }
  }
\NewDocumentEnvironment { enabstract } { +b }
  { }
  {
    \tl_gset:Nx \g_swu_abstract_en_tl
      { \tl_trim_spaces:n {#1} }
  }
\NewDocumentEnvironment { enkeywords } { +b }
  { }
  {
    \tl_gset:Nx \g_swu_keywords_en_tl
      { \tl_trim_spaces:n {#1} }
  }
\cs_new:Npn \swuStudentIdText    { \tl_use:N \g_swu_studentid_tl }
\cs_new:Npn \swuDefenseYearText  { \tl_use:N \g_swu_defenseyear_tl }
\cs_new:Npn \swuDefenseMonthText { \tl_use:N \g_swu_defensemonth_tl }
\cs_new:Npn \swuDefenseDayText   { \tl_use:N \g_swu_defenseday_tl }
\cs_new:Npn \swuSubtitleBlock
{
  \tl_if_blank:VTF \g_swu_subtitle_tl
  { }
  { \vspace{0.6\baselineskip}{\fangsong\zihao{-2}\swuSubtitleText\par} }
}
\seq_new:N \l_swu_stretch_chars_seq
\clist_new:N \l_swu_stretch_punct_clist
\dim_new:N \l_swu_stretch_skip_dim
\int_new:N \l_swu_stretch_count_int
\int_new:N \l_swu_stretch_index_int
\int_new:N \l_swu_stretch_slots_int
\tl_new:N \l_swu_stretch_curr_tl
\tl_new:N \l_swu_stretch_next_tl
\tl_new:N \l_swu_stretch_source_tl
\clist_set:Nn \l_swu_stretch_punct_clist
{
  ，, 。, 、, ；, ：, ！, ？, 《, 》, 〈, 〉, 「, 」, 『, 』,
  “, ”, ‘, ’, —, …, ·, -, --, ---, _, ., ,, ;, :, !, ?, (, ), [, ], {, }, /, \\
}
\prg_new_conditional:Npnn \swu_stretch_if_punct:n #1 { TF }
{
  \clist_if_in:NnTF \l_swu_stretch_punct_clist { #1 }
  { \prg_return_true: }
  { \prg_return_false: }
}
\cs_new_protected:Npn \swu_cjk_stretch:nn #1#2
{
  % 先 |x| 展开再按字拆分：若 |#2| 为单个宏（如 |\swuCoverThesisLabelText|），
  % 直接 |map| 只会得到一项，字距拉伸永远不生效。
  \tl_set:Nx \l_swu_stretch_source_tl { #2 }
  \seq_clear:N \l_swu_stretch_chars_seq
  \tl_map_inline:Nn \l_swu_stretch_source_tl
  {
    \tl_if_blank:nF { ##1 }
    {
      \seq_put_right:Nn \l_swu_stretch_chars_seq { ##1 }
    }
  }
  \int_set:Nn \l_swu_stretch_count_int { \seq_count:N \l_swu_stretch_chars_seq }
  \int_compare:nNnTF { \l_swu_stretch_count_int } > { 1 }
  {
    \int_zero:N \l_swu_stretch_slots_int
    \int_step_inline:nn { \int_eval:n { \l_swu_stretch_count_int - 1 } }
    {
      \tl_set:Nx \l_swu_stretch_curr_tl
        { \seq_item:Nn \l_swu_stretch_chars_seq { ##1 } }
      \tl_set:Nx \l_swu_stretch_next_tl
        {
          \seq_item:Nn \l_swu_stretch_chars_seq
            { \int_eval:n { ##1 + 1 } }
        }
      \swu_stretch_if_punct:nTF { \l_swu_stretch_curr_tl }
      { }
      {
        \swu_stretch_if_punct:nTF { \l_swu_stretch_next_tl }
        { }
        { \int_incr:N \l_swu_stretch_slots_int }
      }
    }
    \int_compare:nNnTF { \l_swu_stretch_slots_int } > { 0 }
    {
    \hbox_set:Nn \l_tmpa_box { \tl_use:N \l_swu_stretch_source_tl }
    \dim_set:Nn \l_swu_stretch_skip_dim
    {
      \fp_to_dim:n
      {
        (
          (#1 - 1)
          * \dim_to_fp:n { \box_wd:N \l_tmpa_box }
          / \l_swu_stretch_slots_int
        )
      }
    }
    \int_zero:N \l_swu_stretch_index_int
    \seq_map_inline:Nn \l_swu_stretch_chars_seq
    {
      \int_incr:N \l_swu_stretch_index_int
      ##1
      \int_compare:nNnT { \l_swu_stretch_index_int } < { \l_swu_stretch_count_int }
      {
        \tl_set:Nx \l_swu_stretch_next_tl
        {
          \seq_item:Nn \l_swu_stretch_chars_seq
          { \int_eval:n { \l_swu_stretch_index_int + 1 } }
        }
        \swu_stretch_if_punct:nTF { ##1 }
        { }
        {
          \swu_stretch_if_punct:nTF { \l_swu_stretch_next_tl }
          { }
          { \hspace{\l_swu_stretch_skip_dim} }
        }
      }
    }
    }
    { \tl_use:N \l_swu_stretch_source_tl }
  }
  { \tl_use:N \l_swu_stretch_source_tl }
}
\NewDocumentCommand{\swuCJKStretchText}{mm}{\swu_cjk_stretch:nn {#1} {#2}}
\ExplSyntaxOff
\newcommand{\swuGraduateTitleUnderlined}{%
  \begingroup
  \fangsong\zihao{4}%
  \setlength{\parskip}{0pt}%
  \setlength{\lineskip}{0pt}%
  \settowidth\@tempdima{学位论文题目：}%
  \noindent
  \begin{minipage}[t]{\@tempdima}%
    \raggedright
    学位论文题目：%
  \end{minipage}%
  \begin{minipage}[t]{\dimexpr\linewidth-\@tempdima\relax}%
    \centering
    \swuTitleText\par
    \nointerlineskip
    \vspace{0.1\baselineskip}%
    {\rule{\linewidth}{0.4pt}}%
  \end{minipage}%
  \par
  \endgroup
}
\newcommand{\swuGraduateTitleRuledLines}{\swuGraduateTitleUnderlined}
\renewcommand{\contentsname}{\swuCJKStretchText{1.5}{目录}}
\newcommand{\swuCoverField}[2]{%
  \noindent
  \makebox[5\ccwd][s]{\bfseries #1}：%
  \underline{\makebox[16\ccwd][c]{\kaishu #2}}\par
  \vspace{0.6em}%
}
\newcommand{\swuPostdocTitleCoverField}[2]{%
  \noindent
  \makebox[10\ccwd][s]{#1}：%
  \makebox[9\ccwd][c]{\kaishu #2}\par
  \vspace{1em}%
}
\newcommand{\swu@zh@date@inline}[3]{#1年#2月#3日}
\newcommand{\swu@graduate@cover@date@single}[2]{%
  \noindent
  \makebox[5\ccwd][s]{\bfseries #1}：%
  \underline{\makebox[16\ccwd][c]{\kaishu #2}}\par
  \vspace{0.6em}%
}
\newcommand{\swuDeclarationSignatureBlock}{%
  \begin{flushright}
    作者签名: \underline{\makebox[10\ccwd][l]{}}\par
\vspace{0.5\baselineskip}
    年\hspace{2em}月\hspace{2em}日
  \end{flushright}
}
\NewDocumentCommand{\makeoriginalitystatement}{}{
  {\songti\zihao{4}
  \thispagestyle{empty}
  \parindent=2\ccwd
  %%\addcontentsline{toc}{chapter}{独创声明}
  \phantomsection
  \pdfbookmark[0]{独创声明}{swu-decl-originality}
  \begin{center}
    {\heiti\zihao{3}\swuCJKStretchText{1.5}{独创声明}\par}
  \end{center}
  \vspace{0.5\baselineskip}
  \noindent\hspace*{2\ccwd}本人郑重声明：所呈交的毕业论文（设计），%
  是本人在指导老师的指导下，%
  独立进行研究工作所取得的成果，成果不存在知识产权争议。%
  尽我所知，除文中已经注明引用的内容外，%
  本论文（设计）不含任何其他个人或集体已经发表或撰写过的作品成果。%
  对本文的研究做出重要贡献的个人和集体均已在文中以明确方式标明。\par
  声明的法律后果由本人承担。\par
  \vspace{\baselineskip}
  \swuDeclarationSignatureBlock
  \vspace{2\baselineskip}
  \phantomsection
  \pdfbookmark[0]{毕业论文（设计）使用授权声明}{swu-decl-license}
  \begin{center}
    {\heiti\zihao{3}毕业论文（设计）使用授权声明\par}
  \end{center}
  \vspace{0.5\baselineskip}
  \noindent\hspace*{2\ccwd}本人完全了解西南大学关于收集、保存、使用毕业论文（设计）的规定。%
  \par
  本人愿意按照学校要求提交论文（设计）的印刷本和电子版，%
  同意学校保存论文（设计）的印刷本和电子版，%
  或采用影印、数字化或其它复制手段保存论文（设计）；%
  同意学校在不以营利为目的的前提下，建立目录检索与阅览服务系统，%
  公布论文（设计）的部分或全部内容，允许他人依法合理使用。\par
  （保密论文在解密后遵守此规定）\par
  \vspace{\baselineskip}
  \swuDeclarationSignatureBlock
  }
  \clearpage
}
\newcommand{\swu@graduate@sigline}[1]{%
  \settowidth\@tempdima{#1}%
  \noindent #1\kern0.35em
  \leaders\hrule height 0.4pt\relax\hskip\dimexpr\linewidth-\@tempdima-0.35em\relax
}
\newcommand{\swu@graduate@sigdate}{%
  \mbox{签名日期：\underline{\hspace{2.5\ccwd}}年\underline{\hspace{2\ccwd}}月\underline{\hspace{2\ccwd}}日}%
}
\newcommand{\swuGraduateTwoPartySignatures}{%
  \vspace{\baselineskip}%
  \noindent
  \begin{minipage}[t]{0.48\linewidth}
    \fangsong\zihao{4}\raggedright
    \noindent\swu@graduate@sigline{作者签名：}\par
    \vspace{0.55\baselineskip}%
    \noindent\swu@graduate@sigdate
  \end{minipage}\hfill
  \begin{minipage}[t]{0.48\linewidth}
    \fangsong\zihao{4}\raggedright
    \noindent\swu@graduate@sigline{导师签名：}\par
    \vspace{0.55\baselineskip}%
    \noindent\swu@graduate@sigdate
  \end{minipage}%
}
\newcommand{\swu@checkbox}{%
  \mbox{%
    \raisebox{-0.1ex}[0.52ex][0.38ex]{%
      \scalebox{1.12}{$\square$}%
    }%
  }%
}
\newcommand{\swu@maybe@degree@en}{%
  \expandafter\ifstrempty\expandafter{\swuDegreeEnText}{}{%
    \vspace{1.5\baselineskip}%
    {\rmfamily\zihao{-4}in partial fulfillment of the requirements for\par
    \swuDegreeEnText\par}%
  }%
}
\newcommand{\swu@maybe@supervisor@en}{%
  \expandafter\ifstrempty\expandafter{\swuSupervisorEnText}{%
    \expandafter\ifstrempty\expandafter{\swuSupervisorText}{}{%
      \vspace{1.5\baselineskip}%
      {\rmfamily\zihao{-4}Supervised by \swuSupervisorText\par}%
    }%
  }{%
    \vspace{1.5\baselineskip}%
    {\rmfamily\zihao{-4}Supervised by \swuSupervisorEnText\par}%
  }%
}
\newcommand{\swu@graduate@supervisors@en}{%
  \expandafter\ifstrempty\expandafter{\swuSupervisorEnText}%
  {\swuSupervisorText}{\swuSupervisorEnText}%
}
\newcommand{\swu@en@five@signature@lines}{%
  \begingroup
  \rmfamily\zihao{-4}%
  \vspace{0.22\baselineskip}%
  \noindent\makebox[\linewidth][c]{%
    \rule{0.55\linewidth}{0.4pt}}\par\vspace{0.36\baselineskip}%
  \noindent\makebox[\linewidth][c]{%
    \rule{0.55\linewidth}{0.4pt}}\par\vspace{0.36\baselineskip}%
  \noindent\makebox[\linewidth][c]{%
    \rule{0.55\linewidth}{0.4pt}}\par\vspace{0.36\baselineskip}%
  \noindent\makebox[\linewidth][c]{%
    \rule{0.55\linewidth}{0.4pt}}\par\vspace{0.36\baselineskip}%
  \noindent\makebox[\linewidth][c]{%
    \rule{0.55\linewidth}{0.4pt}}\par
  \endgroup
}
\newcommand{\swu@monthname@en}[1]{%
  \ifcase\numexpr#1\relax
    \or January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December\fi
}
\newcommand{\swu@en@submitted@school}{%
  \expandafter\ifstrempty\expandafter{\swuSubmittedSchoolEnText}%
  {Graduate School}{\swuSubmittedSchoolEnText}%
}
\newcommand{\swu@en@university}{%
  \expandafter\ifstrempty\expandafter{\swuUniversityEnText}%
  {Southwest University}{\swuUniversityEnText}%
}
\newcommand{\swu@en@defense@location}{%
  \expandafter\ifstrempty\expandafter{\swuDefenseLocationEnText}%
  {Chongqing, P.R. China}{\swuDefenseLocationEnText}%
}
\newcommand{\swu@en@defense@monthyear}{%
  \swu@monthname@en{\number\numexpr\swuDefenseMonthText\relax} \swuDefenseYearText
}
\newcommand{\swu@cover@schoolname@graphics}{%
  \includegraphics[width=0.88\textwidth,%
    height=1.9cm,keepaspectratio]{figures/swu-name-stxingkai.pdf}\par
  \IfFileExists{figures/swu-name.pdf}{%
    \vspace{0.18\baselineskip}%
    \includegraphics[width=0.78\textwidth,%
      height=0.7cm,keepaspectratio]{figures/swu-name.pdf}\par
  }{}%
}
\newcommand{\swu@ifprofessionaldoctorTF}[2]{%
  \ifswu@doctor
    \ifboolexpr{
      test {\ifstrequal{\swuCoverThesisLabelText}{专业学位博士论文}}
      or
      test {\ifstrequal{\swuCoverThesisLabelSubText}{专业学位}}
    }{#1}{#2}%
  \else
    #2%
  \fi
}
\newcommand{\swu@graduate@major@label}{%
  \swu@ifprofessionaldoctorTF{专业学位类别}{学科专业}%
}
\newcommand{\swu@graduate@research@label}{%
  \swu@ifprofessionaldoctorTF{专业领域}{研究方向}%
}
\newcommand{\swu@graduate@major@value}{%
  \swu@ifprofessionaldoctorTF
    {\expandafter\ifstrempty\expandafter{\swuMajorText}{教育博士}{\swuMajorText}}
    {\swuMajorText}%
}
\newcommand{\swu@graduate@maybe@research@field}{%
  \swu@ifprofessionaldoctorTF
    {\swuCoverField{\swu@graduate@research@label}{\swuResearchFieldText}}
    {%
      \expandafter\ifstrempty\expandafter{\swuCoverThesisLabelSubText}{%
        \swuCoverField{\swu@graduate@research@label}{\swuResearchFieldText}%
      }{%
        \ifboolexpr{
          test {\ifstrequal{\swuCoverThesisLabelSubText}{高校教师}}
          or test {\ifstrequal{\swuCoverThesisLabelSubText}{同等学力}}
          or test {\ifstrequal{\swuCoverThesisLabelSubText}{高校教师、同等学力}}
          or test {\ifstrequal{\swuCoverThesisLabelSubText}{同等学力、高校教师}}
        }{%
        }{%
          \swuCoverField{\swu@graduate@research@label}{\swuResearchFieldText}%
        }%
      }%
    }%
}
\newcommand{\swu@maketitle@graduate@zh}{%
  \begingroup
  \songti
  \noindent
  \begin{minipage}[t]{0.56\textwidth}
    \vspace{0pt}
    \includegraphics[width=\linewidth,%
      height=3.5cm,keepaspectratio]{figures/swu-badge.pdf}%
  \end{minipage}
  \begin{minipage}[t]{0.44\textwidth}
    \vspace{0pt}
    \begin{flushright}
    \null\hfill
    {\zihao{4}%
    \begin{tabular}{@{}r@{\hspace{0.35em}}l@{}}%
      \makebox[4\ccwd][s]{\songti 单位代码}： & \songti\underline{%
        \makebox[8\ccwd][c]{10635}} \\[0.42\baselineskip]
      \makebox[4\ccwd][s]{\songti 学　　号}： & \ttfamily\underline{%
        \makebox[8\ccwd][c]{\swuStudentIdText}} \\
    \end{tabular}}%
    \end{flushright}
  \end{minipage}\par
  \begin{center}
    \swu@cover@schoolname@graphics
\vspace{-\baselineskip}
    \swu@cover@graduate@thesis@lines
\vspace{1.2\baselineskip}
    {\zihao{2}\songti \swuTitleText\par}
    \swuSubtitleBlock
  \end{center}
  \vspace{\baselineskip}
  {\centering\zihao{-3}\songti
    \swuCoverField{论文作者}{\swuAuthorText}
    \swuCoverField{指导教师}{\swuSupervisorText}
    \swuCoverField{\swu@graduate@major@label}{\swu@graduate@major@value}
    \swu@graduate@maybe@research@field
    \swu@graduate@cover@date@single{提交日期}{%
      \swu@zh@date@inline%
        {\swuSubmitYearText}{\swuSubmitMonthText}{\swuSubmitDayText}}%
    \swu@graduate@cover@date@single{答辩日期}{%
      \swu@zh@date@inline%
        {\swuDefenseYearText}{\swuDefenseMonthText}{\swuDefenseDayText}}%
    \noindent\makebox[5\ccwd][s]{\bfseries 授予单位}：%
    \underline{\makebox[16\ccwd][c]{\kaishu 西南大学}}\par
    \vspace{0.6em}%
  }
  \vfill
  \begin{center}
    {\zihao{3}\youyuan\swuCJKStretchText{1.15}{中国\textbullet 重庆}\par}%
    \vspace{0.55\baselineskip}%
    {\zihao{3}\youyuan \swuDefenseYearText 年 \swuDefenseMonthText 月\par}%
  \end{center}%
  \vfill
  \endgroup
}
\newcommand{\swu@maketitle@graduate@en}{%
  \thispagestyle{empty}%
  \phantomsection
  \pdfbookmark[0]{英文题名页}{swu-title-en}%
  \begingroup
  \rmfamily
  \vspace*{0.4\baselineskip}%
  \begin{center}
    {\bfseries\zihao{2}\MakeUppercase{\swuTitleEnText}\par}%
    \vspace{0.85\baselineskip}%
    {\zihao{3}By\par}%
    \vspace{0.35\baselineskip}%
    {\bfseries\zihao{3}\MakeUppercase{\swuAuthorEnText}\par}%
    \vspace{0.82\baselineskip}%
    {\zihao{-4}A dissertation submitted to the\par}%
    \vspace{0.2\baselineskip}%
    {\zihao{-4}\swu@en@submitted@school\par}%
    \vspace{0.12\baselineskip}%
    {\zihao{-4}\swu@en@university\par}%
    \vspace{0.48\baselineskip}%
    {\zihao{-4}In partial fulfillment of the requirements\par}%
    \vspace{0.2\baselineskip}%
    {\zihao{-4}For the degree of\par}%
    \vspace{0.2\baselineskip}%
    {\zihao{-4}\swuDegreeEnText\par}%
    \swu@graduate@maybe@degree@sub@en
    \expandafter\ifstrempty\expandafter{\swuGraduateProgramEnText}{%
      \expandafter\ifstrempty\expandafter{\swuCollegeEnText}{}{%
        \vspace{0.48\baselineskip}%
        {\zihao{-4}Graduate Program in \swuCollegeEnText\par}%
      }%
    }{%
      \vspace{0.48\baselineskip}%
      {\zihao{-4}\swuGraduateProgramEnText\par}%
    }%
    \vspace{0.38\baselineskip}%
    {\zihao{-4}Written under the direction of\par}%
    \vspace{0.2\baselineskip}%
    {\zihao{-4}\swu@graduate@supervisors@en\par}%
    \vspace{0.38\baselineskip}%
    {\zihao{-4}And approved by\par}%
    \swu@en@five@signature@lines
    \vfill
    \vspace{0.55\baselineskip}%
    {\zihao{-4}\swu@en@defense@location\par}%
    \vspace{0.25\baselineskip}%
    {\zihao{-4}\swu@en@defense@monthyear\par}%
    \vfill
  \end{center}%
  \endgroup
}
\newcommand{\swu@maketitle@postdoc@cover}{%
  \begingroup
  \songti
  \noindent
  \begin{minipage}[t]{0.5\textwidth}
    \vspace{\baselineskip}
    {\zihao{4}
      \makebox[3\ccwd][s]{分类号}\underline{%
        \makebox[7.5\ccwd][c]{\swuPostdocClassificationText}}\par
      \vspace{0.5\baselineskip}
      \makebox[3\ccwd][s]{U D C}\underline{%
        \makebox[7.5\ccwd][c]{\swuPostdocUDCText}}\par
    }
  \end{minipage}
  \begin{minipage}[t]{0.5\textwidth}
    \vspace{\baselineskip}
    \begin{flushright}
      {\zihao{4}
      \makebox[2\ccwd][s]{密级}\underline{%
        \makebox[7.5\ccwd][c]{\swuPostdocConfidentialityText}}\par
      \vspace{0.5\baselineskip}
      \makebox[2\ccwd][s]{编号}\underline{%
        \makebox[7.5\ccwd][c]{\swuPostdocIdText}}\par
      }
    \end{flushright}
  \end{minipage}\par
  \vspace{4\baselineskip}
  \begin{center}
    {\heiti\zihao{-2}\bfseries\swuCJKStretchText{1.08}{\swuPostdocUnitText}\par}
    \vspace{0.5\baselineskip}
    {\heiti\zihao{-2}\bfseries\swuCJKStretchText{1.5}{博士后研究工作报告}\par}
    \vspace{2\baselineskip}
    {\zihao{4}%
      \underline{\parbox[c]{8.11cm}{%
          \centering\linespread{1.12}\selectfont\swuTitleText\strut\par}}%
    \par}%
    \expandafter\ifstrempty\expandafter{\swuSubtitleText}{}{%
      \vspace{\baselineskip}%
      {\zihao{-4}%
        \underline{\parbox[c]{8.11cm}{%
            \centering\linespread{1.12}\selectfont\swuSubtitleText\strut\par}}%
      \par}%
    }%
    \vspace{2\baselineskip}
    {\zihao{-4}\swuAuthorText\par}
  \end{center}
  \vfill
  {\centering\zihao{-4}%
    \setlength{\tabcolsep}{0pt}%
    \makebox[\textwidth][c]{%
    \renewcommand{\arraystretch}{2}
      \begin{tabular}{@{}r@{\hspace{0.5\ccwd}}c@{}}%
        \makebox[7\ccwd][s]{工作完成日期} &
          \underline{%
            \makebox[12\ccwd][c]{%
              \swuPostdocWorkStartYearMonthText\ --\ \swuPostdocWorkEndYearMonthText}}\\
        \makebox[7\ccwd][s]{报告提交日期} &
          \underline{%
            \makebox[12\ccwd][c]{\swuPostdocReportDateText}} \\
      \end{tabular}%
    }\par
  }%
  \vfill
  \begin{center}
    {\zihao{-4}%
      \swuPostdocPublisherLineText\par
      \expandafter\ifstrempty\expandafter{\swuPostdocPublishAddressText}{}{%
        \vspace{0.55\baselineskip}%
        \swuPostdocPublishAddressText\par
      }%
      \vspace{0.45\baselineskip}%
      \swuPostdocCoverBottomYearMonthText\par
    }%
    \vfill
  \end{center}%
  \endgroup
}
\newcommand{\swu@maketitle@postdoc@title}{%
  \begingroup
  \thispagestyle{plain}%
  \songti
  \vspace{2\baselineskip}
  \phantomsection
  \pdfbookmark[0]{题名页}{swu-postdoc-title}
  \begin{center}
    {\zihao{3} \swuTitleText\par}
    \expandafter\ifstrempty\expandafter{\swuSubtitleText}{}{%
      \vspace{\baselineskip}%
      {\zihao{4}%
            \centering\linespread{1.12}\selectfont\swuSubtitleText\strut\par}}%
    \vspace{2\baselineskip}
    {\zihao{4} \swuTitleEnText\par}
  \end{center}
  \vspace{3\baselineskip}
  {\zihao{4}
  \centering
    \swuPostdocTitleCoverField{博士后姓名}{\swuAuthorText}
    \swuPostdocTitleCoverField{流动站（一级学科）名称}{\swuPostdocStationText}
    \swuPostdocTitleCoverField{专业（二级学科）名称}{\swuMajorText}
    \vspace{4\baselineskip}
    \swuPostdocTitleCoverField{研究工作起始时间}{\swuPostdocWorkStartText}
    \swuPostdocTitleCoverField{研究工作期满时间}{\swuPostdocWorkEndText}
  }
  \vfill
  \begin{center}
    {\zihao{-4}%
      \swuPostdocPublisherLineText\par
      \expandafter\ifstrempty\expandafter{\swuPostdocPublishAddressText}{}{%
        \vspace{0.55\baselineskip}%
        \swuPostdocPublishAddressText\par
      }%
      \vspace{0.45\baselineskip}%
      \zihao{5}\swuPostdocCoverBottomYearMonthText\par
    }%
    \vfill
  \end{center}%
  \vfill
  \endgroup
}
\newcommand{\makegraduateoriginalitystatement}{%
  \begingroup
  \songti\zihao{4}%
  \thispagestyle{empty}%
  \parindent=2\ccwd
  \phantomsection
  \pdfbookmark[0]{独创性声明与学位论文版权使用授权书}{swu-decl-grad-combined}%
  \begin{center}
    {\songti\bfseries\zihao{2}独创性声明}%
  \end{center}
  \vspace{0.4\baselineskip}
  \ignorespaces\swuGraduateTitleUnderlined
  \vspace{0.45\baselineskip}
  % 宋体四号（外层 |\songti\zihao{4}|），首行空两格（|\parindent=2\ccwd|）。
  本学位论文是作者在导师指导下独立完成的研究工作及取得的研究成果，%
  恪守学术诚信，遵守学术准则。%
  对本研究及学位论文撰写曾做出贡献的老师、朋友、同仁在文中作了明确说明%
  并表示衷心感谢。\par
  \swuGraduateTwoPartySignatures
  \vspace{4\baselineskip}
  \begin{center}
    {\songti\bfseries\zihao{2}\swuCJKStretchText{1}{学位论文版权使用授权书}\par}
  \end{center}
  \vspace{0.4\baselineskip}
  \noindent\hspace*{2\ccwd}本学位论文作者完全了解西南大学有关保留、使用学位论文的规定，%
  有权保留并向国家有关部门或机构送交论文的复印件和磁盘，%
  允许论文被查阅和借阅。%
  本人授权西南大学研究生院可以将学位论文的全部或部分内容编入有关数据库进行检索，%
  可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。\par
  \vspace{0.4\baselineskip}
  {\fangsong\zihao{4}\setlength{\parindent}{2\ccwd}%
  本论文公开时间：~ \swu@checkbox{}获学位当年； \swu@checkbox{}推迟1年； \swu@checkbox{}推迟2年。\par}%
  \swuGraduateTwoPartySignatures
  \endgroup
  \clearpage
}
\NewDocumentCommand{\maketitlepage}{}{
\ifswu@postdoc\thispagestyle{plain}\else\thispagestyle{empty}\fi
\phantomsection
\pdfbookmark[0]{封面}{swu-cover}
\ifswu@bachelor
  \begingroup
  \songti
  \noindent
  \begin{minipage}[t]{0.56\textwidth}
    \vspace{0pt}
    \includegraphics[width=\linewidth,%
      height=3.5cm,keepaspectratio]{figures/swu-badge.pdf}%
  \end{minipage}
  \begin{minipage}[t]{0.44\textwidth}
    \vspace{0pt}
    \raggedleft{\zihao{4}\songti 单位代码：10635}
  \end{minipage}\par
  \begin{center}
    \swu@cover@schoolname@graphics
\vspace{-\baselineskip}
    {\youyuan\zihao{0}\bfseries \swuCJKStretchText{1.10}{本科毕业论文（设计）}\par}
\vspace{1.2\baselineskip}
    {\zihao{2}\songti \swuTitleText\par}
    \swuSubtitleBlock
  \end{center}
  \vspace{1.8\baselineskip}
  {\centering\zihao{-3}\songti
    \swuCoverField{学　　院}{\swuCollegeText}
    \swuCoverField{专　　业}{\swuMajorText}
    \swuCoverField{姓　　名}{\swuAuthorText}
    \swuCoverField{学　　号}{\swuStudentIdText}
    \swuCoverField{指导教师}{\swuSupervisorText}
    \swuCoverField{答辩日期}{
    \swuDefenseYearText 年
    \swuDefenseMonthText 月
    \swuDefenseDayText 日}\par
  }
  \vfill
  \begin{center}
    {\zihao{3}\youyuan \swuDefenseYearText 年 \swuDefenseMonthText 月\par}
  \end{center}
  \vfill
  \endgroup
  \clearpage
  \makeoriginalitystatement
\else
  \ifswu@gradthesis
    \swu@maketitle@graduate@zh
    \clearpage
    \swu@maketitle@graduate@en
    \clearpage
    \makegraduateoriginalitystatement
  \else
      \ifswu@postdoc
        \swu@maketitle@postdoc@cover
        \clearpage
        \swu@maketitle@postdoc@title
      \else
      \begin{center}
      {\zihao{2}\bfseries 西南大学\swu@doctype\par}
      \vspace{2cm}
      {\zihao{2}\bfseries \swuTitleText\par}
      \swuSubtitleBlock
      \vspace{1.5cm}
      {\zihao{4}作者：\swuAuthorText\par}
      \vspace{0.5cm}
      {\zihao{4}指导教师：\swuSupervisorText\par}
      \vspace{0.5cm}
      {\zihao{4}专业：\swuMajorText\par}
      \vfill
      {\zihao{4}\today\par}
      \end{center}
      \fi
  \fi
\fi
\clearpage
}
\renewcommand{\maketitle}{\maketitlepage}
\newcommand{\swu@makeabstract@postdoc}{%
\phantomsection
\addcontentsline{toc}{chapter}{摘要}%
\begingroup
\songti
\begin{center}
  {\heiti\bfseries\zihao{3}\swuCJKStretchText{1.5}{内容摘要}\par}%
\end{center}%
\vspace{1.2\baselineskip}%
{\zihao{-4}\setlength{\parindent}{2\ccwd}%
  \swuAbstractCnText\par
  \vspace{\baselineskip}%
  \noindent\textbf{关键词：}\swuKeywordsCnText\par}%
\endgroup
\clearpage
\phantomsection
\addcontentsline{toc}{chapter}{Abstract}%
\begingroup
\begin{center}
  {\rmfamily\zihao{3}Abstract\par}%
\end{center}%
\vspace{1.2\baselineskip}%
{\rmfamily\zihao{4}\setlength{\parindent}{2em}%
  \swuAbstractEnText\par
  \vspace{\baselineskip}%
  \noindent\textbf{Key words: }\swuKeywordsEnText\par}%
\endgroup
}
\NewDocumentCommand{\makeabstract}{}{
\clearpage
\ifswu@gradthesis
  \pagestyle{swugraduate}%
  \thispagestyle{swugraduate}%
\fi
\ifswu@postdoc
  \pagenumbering{Roman}%
  \setcounter{page}{1}%
  \swu@makeabstract@postdoc
\else
\phantomsection
\addcontentsline{toc}{chapter}{摘要}
\begin{center}
  {\heiti\zihao{3}\swuTitleText\par}
  \vspace{-0.5\baselineskip}
  \swuSubtitleBlock
  \vspace{0.3\baselineskip}
  {\kaishu\zihao{-4}\swuAuthorText\par}
  \vspace{0.3\baselineskip}
  {\songti\zihao{5}西南大学\swuCollegeText，重庆 400715\par}
\end{center}
\vspace{\baselineskip}
{\songti\zihao{5}\noindent\textbf{摘\hspace{1\ccwd}要：}%
  \fangsong\swuAbstractCnText\par}
{\songti\zihao{5}\noindent\textbf{关键词：}\swuKeywordsCnText\par}
\vspace{2\baselineskip}
\phantomsection
\addcontentsline{toc}{chapter}{Abstract}
\begin{center}
  \vspace{\baselineskip}
  {\rmfamily\bfseries\zihao{4}\swuTitleEnText\par}
  \vspace{\baselineskip}
  {\rmfamily\zihao{5}\swuAuthorEnText\par}
  \vspace{0.5\baselineskip}
  {\rmfamily\zihao{-5}\swuCollegeEnText, Southwest University,%
    Chongqing 400715, PR China\par}
\end{center}
\vspace{\baselineskip}
{\rmfamily\zihao{5}\noindent\textbf{Abstract: } \swuAbstractEnText\par}
{\rmfamily\zihao{5}\noindent\textbf{Key words: } \swuKeywordsEnText\par}
\fi
}
\NewDocumentEnvironment{ack}{}{
\clearpage
\phantomsection
\addcontentsline{toc}{chapter}{致\hspace{1\ccwd}谢}
\begingroup
\songti
\setstretch{1}%
\setlength{\parindent}{2\ccwd}%
\setlength{\parskip}{0.5\baselineskip plus 0.2pt minus 0.2pt}%
\begin{center}
  {\songti\bfseries\zihao{-4}致\hspace{1\ccwd}谢\par}
\end{center}
\vspace{0.5\baselineskip}%
\zihao{5}%
\hspace{2\ccwd}\ignorespaces
}{\par\vspace{0.5\baselineskip}\endgroup}
\NewDocumentEnvironment{acknowledgements}{}{\begin{ack}}{\end{ack}}
\NewDocumentEnvironment{resume}{}{
\begingroup
\songti
\setstretch{1}%
\setlength{\parindent}{2\ccwd}%
\setlength{\parskip}{0.5\baselineskip plus 0.2pt minus 0.2pt}%
\zihao{5}%
}{\par\vspace{0.5\baselineskip}\endgroup}
\newcommand{\swucvsubsection}[1]{%
\par\vspace{\baselineskip}%
\noindent
{\heiti\zihao{-4}#1\par}%
\vspace{0.35\baselineskip}%
}
\newcommand{\swucvdatedline}[2]{%
\par\noindent
{\songti\bfseries #1}\hspace{0.75em}{\songti #2}\par
}
\newcommand{\swucvnote}[1]{%
\vspace{0.15\baselineskip}%
\noindent
{\songti\zihao{6}\color{black!55}#1\par}%
\vspace{0.4\baselineskip}%
}
\newcommand{\swuPublicationsHeading}{%
\ifswu@postdoc
  在站期间取得的科研成果%
\else
  在读期间取得的科研成果%
\fi
}
\NewDocumentEnvironment{publications}{}{
\clearpage
\phantomsection
\addcontentsline{toc}{chapter}{\swuPublicationsHeading}
\begingroup
\songti
\setstretch{1}%
\setlength{\parindent}{2\ccwd}%
\setlength{\parskip}{0.5\baselineskip plus 0.2pt minus 0.2pt}%
\begin{center}
  {\songti\bfseries\zihao{-4}\swuPublicationsHeading\par}
\end{center}
\vspace{0.5\baselineskip}%
\zihao{5}%
}{\par\vspace{0.5\baselineskip}\endgroup}
\newcommand{\swupublicationsubsection}[1]{%
\par\vspace{\baselineskip}%
\noindent
{\songti\bfseries #1\par}%
\vspace{0.35\baselineskip}%
}
\newenvironment{swupubenum}{%
\begin{enumerate}[
label={[\arabic*]},
align=left,
leftmargin=3.2em,
labelsep=0.45em,
itemsep=0.35\baselineskip,
parsep=0pt,
topsep=0.2\baselineskip
]
}{
\end{enumerate}%
}
\newcommand{\swu@defaultprintbibliography}{%
  \printbibliography[heading=bibintoc,%
    title={参考文献}]%
}
\newcommand{\swuprintbibliography}{\swu@defaultprintbibliography}
\newcommand{\swuPostdocPermAddressZipBoxes}{%
\begingroup
\setlength{\fboxsep}{2.15pt}%
\setlength{\fboxrule}{0.4pt}%
\framebox[1.08em][c]{\rule{0pt}{1.05em}}\hspace{0.22em}%
\framebox[1.08em][c]{\rule{0pt}{1.05em}}\hspace{0.22em}%
\framebox[1.08em][c]{\rule{0pt}{1.05em}}\hspace{0.22em}%
\framebox[1.08em][c]{\rule{0pt}{1.05em}}\hspace{0.22em}%
\framebox[1.08em][c]{\rule{0pt}{1.05em}}\hspace{0.22em}%
\framebox[1.08em][c]{\rule{0pt}{1.05em}}%
\endgroup
}
\newcommand{\swuPostdocPermAddressTwoRules}{%
\begin{minipage}[t]{\hsize}%
\raggedright
\setlength{\parindent}{0pt}%
\noindent\hrulefill\par
\vspace{0.55\baselineskip}%
\noindent\hrulefill
\end{minipage}%
}
\newcommand{\swuPostdocPermAddressOneRule}{%
\begin{minipage}[t]{\hsize}%
\raggedright
\setlength{\parindent}{0pt}%
\noindent\hrulefill
\end{minipage}%
}
\newcommand{\swuPostdocPermAddressTwoRulesWithText}[2]{%
\begin{minipage}[t]{\hsize}%
\raggedright
\setlength{\parindent}{0pt}%
\noindent\underline{%
\parbox[t]{\linewidth}{\raggedright\strut #1\strut}}\par
\vspace{0.55\baselineskip}%
\noindent\underline{%
\parbox[t]{\linewidth}{\raggedright\strut #2\strut}}%
\end{minipage}%
}
\newcommand{\swuPostdocPermAddressOneRuleWithText}[1]{%
\begin{minipage}[t]{\hsize}%
\raggedright
\setlength{\parindent}{0pt}%
\noindent\underline{%
\parbox[t]{\linewidth}{\raggedright\strut #1\strut}}%
\end{minipage}%
}
\ExplSyntaxOn
\seq_new:N \l__swu_postdoc_addr_seq
\cs_new_protected:Npn \swu_postdoc_zip_boxes_filled:N #1
{
\begingroup
\setlength { \fboxsep } { 2.15pt }
\setlength { \fboxrule } { 0.4pt }
\tl_set:Nx \l_tmpa_tl { \tl_trim_spaces:V #1 }
\int_step_inline:nn { 6 }
{
\tl_set:Nx \l_tmpb_tl { \tl_item:Nn \l_tmpa_tl { ##1 } }
\framebox[1.08em][c]{\rule{0pt}{1.05em}\tl_use:N \l_tmpb_tl}
\int_compare:nNnT { ##1 } < { 6 } { \hspace{0.22em} }
}
\endgroup
}
\cs_new_protected:Npn \swu_postdoc_typeset_postcode_cell:
{
\tl_if_blank:VTF \g_swu_postdoc_mailing_postcode_tl
{ \swuPostdocPermAddressZipBoxes }
{ \swu_postdoc_zip_boxes_filled:N \g_swu_postdoc_mailing_postcode_tl }
}
\cs_new_protected:Npn \swu_postdoc_typeset_address_cell:
{
\tl_if_blank:VTF \g_swu_postdoc_mailing_address_tl
{ \swuPostdocPermAddressTwoRules }
{
\tl_set_eq:NN \l_tmpa_tl \g_swu_postdoc_mailing_address_tl
\seq_set_split:NnV \l__swu_postdoc_addr_seq { \\ } \l_tmpa_tl
\int_compare:nNnT { \seq_count:N \l__swu_postdoc_addr_seq } = { 1 }
{
\seq_set_split:NnV \l__swu_postdoc_addr_seq { \par }
\l_tmpa_tl
}
\tl_set:Nx \l_tmpa_tl { \seq_item:Nn \l__swu_postdoc_addr_seq { 1 } }
\tl_trim_spaces:N \l_tmpa_tl
\tl_clear:N \l_tmpb_tl
\int_compare:nNnT { \seq_count:N \l__swu_postdoc_addr_seq } > { 1 }
{
\int_step_inline:nnn { 2 } { \seq_count:N \l__swu_postdoc_addr_seq }
{
\tl_put_right:Nx \l_tmpb_tl
{
\exp_args:Ne \tl_trim_spaces:n
{ \seq_item:Nn \l__swu_postdoc_addr_seq { ##1 } }
}
\int_compare:nNnT { ##1 } < { \seq_count:N \l__swu_postdoc_addr_seq }
{ \tl_put_right:Nn \l_tmpb_tl { \par } }
}
}
\use:e
{
\exp_not:N \swuPostdocPermAddressTwoRulesWithText
{ \exp_not:o \l_tmpa_tl }
{ \exp_not:o \l_tmpb_tl }
}
}
}
\cs_new_protected:Npn \swu_postdoc_typeset_phone_cell:
{
\tl_if_blank:VTF \g_swu_postdoc_mailing_phone_tl
{ \swuPostdocPermAddressOneRule }
{
\tl_set:Nx \l_tmpa_tl { \tl_use:N \g_swu_postdoc_mailing_phone_tl }
\use:e
{
\exp_not:N \swuPostdocPermAddressOneRuleWithText
{ \exp_not:o \l_tmpa_tl }
}
}
}
\cs_new_protected:Npn \swu_postdoc_typeset_email_cell:
{
\tl_if_blank:VTF \g_swu_postdoc_mailing_email_tl
{ \swuPostdocPermAddressOneRule }
{
\tl_set:Nx \l_tmpa_tl { \tl_use:N \g_swu_postdoc_mailing_email_tl }
\use:e
{
\exp_not:N \swuPostdocPermAddressOneRuleWithText
{ \exp_not:o \l_tmpa_tl }
}
}
}
\cs_new_protected:Npn \swu_postdoc_print_permanent_address_sheet:
{
\begingroup
\songti
\zihao { 5 }
\setlength { \parindent } { 0pt }
\setstretch { 1.08 }
\vspace{1.2\baselineskip}
\begin{center}
{\bfseries 博士后研究人员：}\swuAuthorText
\end{center}
\vspace{1.8\baselineskip}
\noindent
\setlength{\tabcolsep}{0pt}
\renewcommand{\arraystretch}{2.05}
\begin{tabular*}{\linewidth}{%
  @{}>{\bfseries}p{6\ccwd}%
  @{\hspace{1.1em}}%
  p{\dimexpr\linewidth-6\ccwd-1.1em}@{}}%
\toprule
邮政编码 & \swu_postdoc_typeset_postcode_cell: \\
通信地址 & \swu_postdoc_typeset_address_cell: \\
联系电话 & \swu_postdoc_typeset_phone_cell: \\
电子信箱 & \swu_postdoc_typeset_email_cell: \\
\bottomrule
\end{tabular*}%
\par\vspace{1.5\baselineskip}
\endgroup
}
\NewDocumentCommand{\swuPostdocPrintPermanentAddressSheet}{}
{ \swu_postdoc_print_permanent_address_sheet: }
\cs_new_protected:Npn \swu_postdoc_maybe_after_chapter_head:n #1
  {
    \tl_if_eq:nnT {#1} { 永久通信地址 }
      { \swu_postdoc_print_permanent_address_sheet: }
  }
\ExplSyntaxOff
\makeatletter
\ifswu@postdoc
\newcommand{\swu@postdoc@afterchapterhead}[1]{%
  \csname swu_postdoc_maybe_after_chapter_head:n\endcsname{#1}%
}%
\apptocmd{\@makechapterhead}{\swu@postdoc@afterchapterhead{#1}}{}{}%
\fi
\makeatother


\endinput
%%
%% End of file `swuthesis.cls'.
