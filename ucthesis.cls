\ProvidesClass{ucthesis}[UC Santa Cruz thesis]

% Option to skip copyright page
\newif\ifcopyright
\copyrighttrue
\DeclareOption{nocopyright}{\copyrightfalse}

% Option to print bibliography in single spacing
\newif\ifsinglespacebib
\singlespacebibfalse
\DeclareOption{singlespacebib}{\singlespacebibtrue}

% Pass other options to underlying report class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

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

\NewDocumentCommand{\campus}{m}{\gdef\@campus{#1}}
\NewDocumentCommand{\degreeconferred}{m}{\gdef\@degreeconferred{#1}}
\NewDocumentCommand{\field}{m}{\gdef\@field{#1}}
\NewDocumentCommand{\dean}{m}{\gdef\@dean{#1}}
\NewDocumentCommand{\deantitle}{m}{\gdef\@deantitle{#1}}
\NewDocumentCommand{\monthconferred}{m}{\gdef\@monthconferred{#1}}
\NewDocumentCommand{\yearconferred}{m}{\gdef\@yearconferred{#1}}

\NewDocumentCommand{\@committeemembers}{}{}
\NewDocumentCommand{\committeemember}{m}{%
\g@addto@macro\@committeemembers{\medskip\bigskip\rule{0.5\textwidth}{0.5pt}\\#1\par} }

% Title page
\RenewDocumentCommand{\maketitle}{}{
\hyphenpenalty=10000
\begin{center}
UNIVERSITY OF CALIFORNIA\\
\expandafter\uppercase\expandafter{\@campus}

\bigskip

{\bfseries{\expandafter\uppercase\expandafter{\@title}}}

\medskip

A dissertation submitted in partial satisfaction\\of the requirements for the degree of

\bigskip

{\expandafter\uppercase\expandafter{\@degreeconferred}}

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
The Dissertation of {\@author} is approved:

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

\bigskip

\@author

\bigskip

\@yearconferred
\end{center}
\vspace*{\fill}
\else
\null
\fi
\clearpage
\hyphenpenalty=50
}

% Abstract
\RenewDocumentEnvironment{abstract}{}{
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