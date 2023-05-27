%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Class CusanoOne for the Proceedings
%% of the Niccolò Cusano Scientific Conferences (NCSC)
%% created by Pietro Oliva 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesPackage{CusanoOne}[2017/08/27 v0.0]
\AtEndOfClass{\RequirePackage{microtype}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%CHANGE IF REQUIRED
%%NOTE: NCSC doesn't support twocolumns
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions*
\LoadClass[a4paper,11pt,final]{extarticle}
%\LoadClass[a4paper,11pt,draft]{article}


%%%%%%%%%%%%%%%%%
%%%%INCLUDED PACKAGES	
%%%%%%%%%%%%%%%%%
\RequirePackage[OT1, OT2, T1]{fontenc}%Font Encoding
\RequirePackage[utf8]{inputenc}%UTF-8 Input Encoding (italian keyboard)
\RequirePackage[polutonikogreek,italian,english]{babel}%Languages. Last one is the main one.
\RequirePackage{authblk}%Affiliations
\RequirePackage{amsfonts,amssymb,amsmath,amsthm,marvosym,wasysym,pxfonts,cancel}%All math symbols ever needed
\RequirePackage{units, booktabs}%Better fractions inline and tabulature lines
\RequirePackage[output-decimal-marker={,}]{siunitx}
\RequirePackage{chemfig}%chemistry
\RequirePackage{lipsum}%Dummy text i.e. \lipsum[3-5]
\RequirePackage{moresize,anyfontsize, siunitx, xspace}%Extra dimensions and inline num.
\RequirePackage[colorlinks=true, allcolors=blue]{hyperref}%interactive refs
\RequirePackage[all]{hypcap} %Adjusting the anchors of captions
\RequirePackage{xcolor, keyval}%Adding xcolors and useful for TikZ
\RequirePackage{graphicx}%Figures
\RequirePackage[sc]{mathpazo}
\RequirePackage{url}
\RequirePackage{tikz}%Draw tool (kein Draw...)



%%%%%%%%%%%%%%%%%%%
%%EXTRA PACKAGES IF NEEDED
%%%%%%%%%%%%%%%%%%%
%\usepackage{array,tabularx,graphicx,geometry}%pacchetti per tabelle, riferimenti e layout.
%\usepackage{afterpage, color, fancybox}%serve per lasciare pag. bianche e box colori.
%\usepackage{soul,fourier}%tipografia (spazi, cancellature e sottolineamenti vari) e ornamenti.
%\usepackage{booktabs}%tabelle più belle.
%\usepackage{devanagari}%per il sanscrito
\RequirePackage{t4phonet}%simboli fonetici
\RequirePackage{arcs, tipa}%per archi diacritici
%\usepackage{teubner}%consente greco antico grassetto legature e segni diacritici
%\usepackage{pdflscape,blindtext,xcolor}
%\usepackage{marginnote}% per note a margine
\RequirePackage{adforn}%simboli dei pianeti e abbellimenti
\RequirePackage{arabtex,allrunes, aramaic, aurical, cjhebrew, epiolmec, etruscan, oldprsn, phoenician, protosem, sarabian}%rune + aramaico + calligrafico + ebraico + etrusco + persiano_cuneiforme + fenicio + protosemitico+sudarabo_arcaico
%\usepackage{feynmp-auto}
%
%
%%Margine notes managements
%\newcommand{\mn}[1]{\marginnote{\tiny #1}}
%%\setlength{\marginparwidth}{90pt}
%\setmarginnotes{15pt}{85pt}{1pt}




%%%%%%%%%%%%%%%%%
%%Color scheme
%%%%%%%%%%%%%%%%%
\definecolor{color0}{RGB}{0,0,0} % Basic Black
\definecolor{color1}{RGB}{59,90,198} % Author email, doi
%\definecolor{color2}{RGB}{16,131,16} % Header, authors, table lines (EVENTUALLY)

%%%%%%%%%%%%%%%%%%%
%%PAGE LAYOUT AND TITLEPAGE
%%%%%%%%%%%%%%%%%%%
\RequirePackage[left=80pt,%
                right=80pt,%
                top=70pt,%
                bottom=80pt,%
                headheight=15pt,%
                headsep=10pt,%
                a4paper,twoside]{geometry}%
\RequirePackage[labelfont={bf,sf},%
                labelsep=period,%
                figurename=Fig.,%
                singlelinecheck=off,%
                justification=RaggedRight]{caption}
           
\renewcommand{\@maketitle}{%
\vskip60pt%
{\raggedright \titlefont \@title\par}%
\vskip12pt
{\raggedright \@author\par}
\rule{\linewidth}{.3pt}
\vskip12pt%
}%


%%%%%%%%%%%%%%%%%
%%NEWCOMMANDS	
%%%%%%%%%%%%%%%%%
\newcommand{\titlefont}{\normalfont\sffamily\bfseries\fontsize{22}{25}\selectfont}
\renewcommand\UrlFont{\color{color1}\sffamily}
\newcommand{\absfont}{\normalfont\rmfamily\bfseries\fontsize{11}{14}\selectfont}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Ancient Greek Loaded. Only if you are using polutonikogreek in babel (COMMAND: \greco{})
%%DOC: http://www.lorenzopantieri.net/LaTeX_files/LaTeXpedia.pdf  (pp.293--299)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\greco}[1]{\foreignlanguage{polutonikogreek}{#1}}

%%%%%%%%%%%%%%%%%
%%Author/Affiliation Management
%%%%%%%%%%%%%%%%%
\setlength{\affilsep}{1em}
\renewcommand\Authfont{\color{color0}\normalfont\sffamily\bfseries\scshape\fontsize{15}{17}\selectfont}

%%%%%%%%%%%%
%%%%FIRST LETTER
%%%%%%%%%%%%
\RequirePackage{ifthen}
\RequirePackage{lettrine}
\RequirePackage{yfonts}
\DeclareFontShape{LYG}{ygoth}{m}{n}{ <-> ygoth}{}
%\renewcommand{\LettrineTextFont}{\normalfont}
\renewcommand{\LettrineFontHook}{\color[gray]{0.5}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%By Reed A. Cartwright 
%%http://dererumnatura.us/archives/2009/02/automatic-usage.html
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\ecap}[1]{\begingroup\obeyspaces\etospace{#1}{}}
\newcommand*{\etospace}[3]{\ifthenelse{\equal{#3}{\space}}%
{\endgroup\lettrine[lines=3, nindent=0em, findent=0.1em]{#1}{#2}#3}{\etospace{#1}{#2#3}}}
% Setup environment `entry' to use `entry*' with a drop cap
\newenvironment{entry}{\begin{entry*}\ecap}{\end{entry*}}
% Setup environment `entry*' so that lettrine can be manually specified if needed
\newenvironment{entry*}{}{}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%COMMAND: \textcyr{} to write in cyrillic
%%DOC: http://www.lorenzopantieri.net/LaTeX_files/LaTeXpedia.pdf (pp.301--303)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlanguage\fakelanguage
\newcommand\cyr{\fontencoding{OT2}\fontfamily{wncyr}\selectfont
\language\fakelanguage}
\DeclareTextFontCommand{\textcyr}{\cyr}


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TEXT INTERSPACE: MODIFY ONLY IF NEEDED
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\linespread{1.05}% Palatino needs more leading (space between lines)


%%%%%%%%%%%%%%%%%%%%%%%%%
%% TEXT OFFSET: MODIFY ONLY IF NEEDED
%% CRITICAL PARAMETER
%%%%%%%%%%%%%%%%%%%%%%%%%
%\advance\voffset 0.7in % Negative values will raise the text, positives will lower it.


%%%%%%%%%%%%%%%%
%%%CLASS DEFINITIONS
%%%%%%%%%%%%%%%%

\def\ds{\displaystyle}
\def\ddx{\ds \frac{\textrm{d}}{\textrm{d}x}}
\def\ddt{\ds \frac{\textrm{d}}{\textrm{d}t}}
\newcommand \dd[1]{\,\textrm d{#1}}   % infintesimal
\newcommand \de[2]{\frac{\mathrm d{#1}}{\mathrm d{#2}}}   % first order derivative
\newcommand \intl[4]{\int\limits_{#1}^{#2}{#3}\dd{#4}}   % integral with limits
\newcommand{\degree}{\ensuremath{^\circ}}%Decimal Degree
\newcommand{\pfrac}[2]{\ensuremath{\frac{\partial #1}{\partial #2}}}%partial derivative
\newcommand{\bit}{\begin{itemize}}% item environment begin
\newcommand{\eit}{\end{itemize}}% item environment end
\newcommand{\ben}{\begin{enumerate}}% enumerate environment begin
\newcommand{\een}{\end{enumerate}}% enumerate end
\newcommand\ecappar[1]{\ifx\par#1\def\next{\ecappar}\else\def\next{\ecap{#1}}\fi\next}
\newcommand{\introduction}{\section{Introduction}\label{intro}\ecappar}

\newcommand{\inschar}[2][]{\includegraphics[#1]{./#2}}%per alcuni caratteri inline sotto forma di immagini
%\newcommand{\pic}[2][]{\begin{center}\includegraphics[#1]{./YourPath/#2}\end{center}}



