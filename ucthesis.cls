\ProvidesClass{ucthesis}[UC Santa Cruz thesis]

% Option to skip copyright page
\newif\ifcopyright
\copyrighttrue
\DeclareOption{nocopyright}{\copyrightfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% Option to print bibliography in single spacing
\newif\ifsinglespacebib
\singlespacebibfalse
\DeclareOption{singlespacebib}{\singlespacebibtrue}

\ProcessOptions\relax

\LoadClass[12pt,openany]{report}

\RequirePackage{unicode-math}
\RequirePackage{setspace}
\RequirePackage{geometry}
\geometry{
letterpaper,
left=1.5in,
right=1.25in,
top=1.25in,
bottom=1.25in,
}
\RequirePackage[pdfusetitle]{hyperref}

\ifsinglespacebib
\setlength{\bibitemsep}{\baselineskip}
\AtBeginBibliography{\singlespace}
\else
\fi

\def\campus#1{\gdef\@campus{#1}}
\def\degreeconferred#1{\gdef\@degreeconferred{#1}}
\def\field#1{\gdef\@field{#1}}
\def\dean#1{\gdef\@dean{#1}}
\def\deantitle#1{\gdef\@deantitle{#1}}
\def\monthconferred#1{\gdef\@monthconferred{#1}}
\def\yearconferred#1{\gdef\@yearconferred{#1}}

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

\@degreeconferred

\bigskip

in

\bigskip

{\expandafter\uppercase\expandafter{\@field}}

\bigskip

by

\bigskip

{\bfseries \@author}

\bigskip

\@monthconferred{} \@yearconferred
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

\@yearconferred
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