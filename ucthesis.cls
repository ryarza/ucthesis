% University of California thesis class
% First version by Ricardo Yarza, June 2026

\ProvidesClass{ucthesis}[UC Santa Cruz thesis]

\newif\ifcopyright
\copyrighttrue

\DeclareOption{nocopyright}{\copyrightfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ProcessOptions\relax

\LoadClass[12pt,openany]{report}

\RequirePackage[pdfusetitle]{hyperref}
\RequirePackage{setspace}
\RequirePackage{geometry}
\geometry{
letterpaper,
left=1.5in,
right=1.25in,
top=1.25in,
bottom=1.25in,
}

\def\campus#1{\gdef\@campus{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\field#1{\gdef\@field{#1}}
\def\dean#1{\gdef\@dean{#1}}
\def\deantitle#1{\gdef\@deantitle{#1}}
\def\month#1{\gdef\@month{#1}}
\def\year#1{\gdef\@year{#1}}

\newcommand{\@committeemembers}{}
\newcommand{\committeemember}[1]{%
\g@addto@macro\@committeemembers{\medskip\bigskip\rule{0.5\textwidth}{0.5pt}\\#1\par} }

% Title page
\renewcommand{\maketitle}{
\begin{center}
UNIVERSITY OF CALIFORNIA\\
\expandafter\uppercase\expandafter{\@campus}

\bigskip

{\bfseries{\expandafter\uppercase\expandafter{\@title}}}

\medskip

A dissertation submitted in partial satisfaction of the\\
requirements for the degree of

\bigskip

\@degree

\bigskip

in

\bigskip

{\expandafter\uppercase\expandafter{\@field}}

\bigskip

by

\bigskip

{\bfseries \@author}

\bigskip

\@month{} \@year
\end{center}

\vfill
\begin{flushright}
\parbox{0.5\textwidth}{
The Dissertation of {\@author}\\ is approved:

\@committeemembers
}
\end{flushright}

\bigskip\bigskip\noindent
\rule{0.42\textwidth}{0.5pt}\\
\@dean\\
\@deantitle

\thispagestyle{empty}
}

\appto{\maketitle}{
\clearpage\thispagestyle{empty}
\ifcopyright
\vspace*{\fill}
\begin{center}
Copyright \copyright{} by

\@author

\@year
\end{center}
\vspace*{\fill}
\else
\null
\fi
\clearpage
}

% Abstract
\renewenvironment{abstract}{
\addcontentsline{toc}{chapter}{Abstract}
\begin{center}
\textbf{Abstract}

\@title

by

\@author
\end{center}
}{
}

% Table of contents
\renewcommand\contentsname{Table of Contents}

\pretocmd{\tableofcontents}{\renewcommand{\thepage}{\roman{page}}}{}{}
\appto{\tableofcontents}{\clearpage}

% List of figures
\pretocmd{\listoffigures}{\addcontentsline{toc}{chapter}{\listfigurename}}{}{}
\appto{\listoffigures}{\clearpage\doublespacing}

% Main matter
\newcommand{\mainmatter}{\clearpage \pagenumbering{arabic}}