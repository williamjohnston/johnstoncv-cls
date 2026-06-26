\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{johnstoncv}[2026/06/25 JohnstonCV]

\LoadClass[11pt, oneside]{article}

\author{William Johnston}
\date{\today}
\title{Curriculum Vitae}

%%% PAGE LAYOUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Text height of DIV=11, width of DIV=8 
\RequirePackage[height=203.20mm, width=134.94mm, headheight=13.6pt, footskip=0.06\paperheight]{geometry}

\RequirePackage[manualmark,headsepline]{scrlayer-scrpage}
	\makeatletter
	\ihead{\@author}\chead{}\ohead{\@title}% i = inner = left, o = outer = right
	\ifoot{}\cfoot*{\pagemark}\ofoot*{\scriptsize Last updated: \@date}
	\makeatother

\flushbottom

%%% FONT AND TYPESETTING %%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fontspec}
	\setmainfont[
		Ligatures={TeX,Common}, 
		Numbers={Proportional},
		BoldFont = * Semibold,
		ItalicFont = * Italic,
		BoldItalicFont = * Semibold Italic,
		SmallCapsFeatures = {BoldFont= * Semibold, BoldItalicFont= * Semibold Italic},
		]{Libertinus Serif}

\RequirePackage{microtype}% Typographical adjustments
\RequirePackage{fontawesome5}% Icons

%Reduce amount of hyphenation
\lefthyphenmin=4
\righthyphenmin=4

%%% LINKS AND REFERENCES %%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{hyperref}
	\hypersetup{colorlinks=true, linkcolor=BlueViolet, filecolor=BlueViolet, urlcolor=BlueViolet}
	\urlstyle{same}
\RequirePackage{bookmark}

%%% SPACING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% No paragraph indent
\setlength{\parindent}{0pt}

% No paragraph skip
\setlength{\parskip}{0pt}

% Set ``column'' widths
\newlength{\leftcolwidth}
\setlength{\leftcolwidth}{9em}

\newlength{\mycolspace}
\setlength{\mycolspace}{0.75em}

% Set hanging indent
\RequirePackage{hanging}
\newlength{\myhangingindent}
\setlength{\myhangingindent}{0.75em}
\newcommand{\hang}{\hangpara{\myhangingindent}{1}}

\makeatletter
\newlength{\myitemskip}
\setlength{\myitemskip}{1.6ex \@plus 1ex \@minus .2ex}
\newlength{\sskip}
\setlength{\sskip}{4ex \@plus 1.5ex \@minus 1ex}
\newlength{\ssskip}
\setlength{\ssskip}{2ex \@plus 1ex \@minus .6ex}
\newlength{\sssskip}
\setlength{\sssskip}{\myitemskip}
\makeatother 

%%% SECTION HEADINGS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{needspace}

\makeatletter
\renewcommand\section[1]{%
	\addvspace{\sskip}%
	\end{itemize}%
	\pagebreak[3]%\Needspace*{2.5cm}%
	\begin{itemize}[label={}, left=0pt .. 0pt, itemsep=0pt, topsep=0pt]%\Needspace*{5ex}%
	\item{\Large\bfseries\scshape#1}%
	\pdfbookmark[1]{#1}{#1}%
	\addvspace{\ssskip}%
	}
\renewcommand\subsection[1]{%
	\addvspace{\ssskip}%
	\end{itemize}%
	\pagebreak[3]%
	\begin{itemize}[label={}, left=0pt .. 0pt, itemsep=0pt, parsep=0pt, topsep=0pt]%
	\item{\normalfont\large\mdseries\scshape#1}%
	\pdfbookmark[2]{#1}{#1}%
	\addvspace{\sssskip}%
	}
\renewcommand\subsubsection[1]{%
	\addvspace{\sssskip}%
	\end{itemize}%
	\pagebreak[2]%
	\begin{itemize}[label={}, left=0pt .. 0pt, itemsep=0pt, parsep=0pt, topsep=0pt]%
	\item{\normalfont\normalsize\mdseries\itshape#1\hspace*{\myhangingindent}}%
	\pdfbookmark[3]{#1}{#1}%
	%\addvspace{}%
	}
\renewcommand\paragraph[1]{%
	\addvspace{\sssskip}%
	\end{itemize}%
	\pagebreak[2]%
	\begin{itemize}[label={}, left=0pt .. 0pt, itemsep=0pt, parsep=0pt, topsep=0pt, itemindent=-1\myhangingindent, leftmargin=\myhangingindent]%
	\item{\normalfont\normalsize\mdseries\scshape#1}%
	\pdfbookmark[4]{#1}{#1}%
	\hspace*{\myhangingindent}%
	}
\renewcommand\subparagraph[1]{%
	\end{itemize}%
	\pagebreak[2]%
	\begin{itemize}[label={}, left=0pt .. 0pt, itemsep=0pt, parsep=0pt, topsep=0pt, itemindent=-1\myhangingindent, leftmargin=\myhangingindent]%
	\null\hspace*{\myhangingindent}%
	\item{\normalfont\normalsize\mdseries\scshape#1}%
	\pdfbookmark[5]{#1}{#1}%
	\hspace*{\myhangingindent}%
	}
\makeatother

%%% CUSTOM LIST ENVIRONMENTS %%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{enumitem}
\setlist[itemize]{label={}, parsep=0pt, itemsep=\myitemskip}%
\RequirePackage{xargs}
\RequirePackage[fulladjust]{marginnote}

% Source - https://tex.stackexchange.com/a/377231
\def \ifempty#1{\def\temp{#1} \ifx\temp\empty }

\newcommand{\PossibleLink}[1]{%
	\ifempty{#1}
		\relax%
	\else
		\leavevmode\marginpar{\href{#1}{\footnotesize\faLink}}\relax\hspace*{-0.25em}%
	\fi
	}

\newcommandx{\Item}[2][1={},2={}]{%
	\ifempty{#1}
		\UndatedItem{#2}
	\else
		\DatedItem[#2]{#1}
	\fi
	}
	
\newcommand{\UndatedItem}[1][]{%
	\end{itemize}%
	\item\begin{itemize}[label={}, left=0pt .. 0pt, itemindent=-1\myhangingindent, leftmargin=\myhangingindent]%
	\item\PossibleLink{#1}%
	\pagebreak[2]%
	}
	
\newcommand{\DatedItem}[2][]{%
	\end{itemize}%
	\item\begin{itemize}[align=left, left=0pt, labelsep=\mycolspace, labelwidth=\leftcolwidth, leftmargin=!, labelindent=0pt]%
	\item[#2]\PossibleLink{#1}%
	\pagebreak[2]%
	}

%Define useful aliases
\newcommand{\Pub}[1][]{\UndatedItem[#1]}
\newcommand{\SubItem}{\item}
	
\newenvironment{entries}{%
	\begin{itemize}[left=0pt .. 0pt, itemsep=\myitemskip, parsep=0pt, topsep=0pt]% Begin list of entries
	\item\vspace{-1\baselineskip}% Dummy item to avoid compilation errors
	\begin{itemize}% Begins first sublist
	%
	}{%
	\end{itemize}% Ends last sublist
	\end{itemize}% Ends list of entries
	}
	
%%% TITLE PAGE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter
\renewcommand{\maketitle}{%
	\thispagestyle{plain}
	\begin{center}
	{\huge{\@author}}\\
	\vspace{2\myitemskip}
	\textsc{\Large \@title}\\
	\end{center}	
	\vspace{2\myitemskip}
	}
\makeatother

%%% MACROS FOR CONTACT INFO w/ ICONS %%%%%%%%%%%%%%%
\newcommand{\addicon}[1]{\raisebox{-1pt}{\small#1}\enspace}

\newcommand{\email}[1]{\addicon{\faEnvelope}{\href{mailto:#1}{#1}}}
\newcommand{\website}[1]{\addicon{\faGlobe}\href{https://#1}{#1}}
\newcommand{\orcid}[1]{\addicon{\faOrcid}\href{https://#1}{#1}}
\newcommand{\github}[1]{\addicon{\faGithub}\href{https://#1}{#1}}
\newcommand{\phone}[1]{\addicon{\faPhone}#1}
\newcommand{\split}[4]{%
	\addicon{#1}\href{#2}{#3}\\%
	\null\hphantom{\addicon{#1}}\href{#2}{#4}%
	}
