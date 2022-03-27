% $Id: AlabamaManuscript.cls 17328 2011-07-07 01:11:59Z nkraft $
%
% Manuscript Class for an ETD
% Department of Computer Science
% The University of Alabama
%
% Nicholas A. Kraft <nkraft@cs.ua.edu>

\def\filedate{2011/01/18}
\def\fileversion{v1.0}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{AlabamaManuscript}[%
   \filedate\space\fileversion
   Manuscript Class for a UA ETD
   ]




%-- Variable declaration/initialization
%--

%---- Public variables
\renewcommand{\title}[1]{\gdef\ETD@title{#1}}
\renewcommand{\author}[1]{\gdef\ETD@author{#1}}
\renewcommand{\date}[1]{\gdef\ETD@date{#1}}
\newcommand{\department}[1]{\gdef\ETD@department{#1}}

\title{---}
\author{---}
\date{---}
\department{---}

%---- Private variables
\newcommand{\ETD@draft}{false}


%-- Document Options
%--
\DeclareOption{draft}{%
   \PassOptionsToClass{draft}{report}
   \PassOptionsToPackage{final}{graphicx}
   \PassOptionsToPackage{final}{hyperref}
   \PassOptionsToPackage{final}{listings}
   \renewcommand{\ETD@draft}{true}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions

\LoadClass[12pt,letterpaper,onecolumn,oneside]{report}


%---- fonts
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\RequirePackage{mathptmx}              % roman
\RequirePackage[scaled=0.92]{helvet}   % sans serif
\RequirePackage{courier}               % typewriter
\RequirePackage{pifont}                % Zapf Dingbats

%---- other
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{calc}
\RequirePackage[strict]{changepage}
\RequirePackage{comment}
\RequirePackage[pdftex,dvipsnames]{color}
\RequirePackage{fancyhdr}
\RequirePackage[bottom,hang,stable]{footmisc}
\RequirePackage[pdftex]{geometry}
\RequirePackage[pdftex]{graphicx}
\RequirePackage{ifthen}
\RequirePackage{indentfirst}
\RequirePackage{lineno}
\RequirePackage{lipsum}
\RequirePackage{listings}
\RequirePackage[square,longnamesfirst,sort&compress]{natbib}
\RequirePackage{setspace}
\RequirePackage[caption=false]{subfig}
\RequirePackage{titlesec}
%\RequirePackage[subfigure]{tocloft}
\RequirePackage{ulem}
\RequirePackage[
,  pdftex
,  letterpaper
,  colorlinks
,  hyperfootnotes
,  linktocpage
,  citecolor=black
,  linkcolor=black
,  urlcolor=black
]{hyperref}


%-- Package Configuration
%--

%---- geometry
\geometry{letterpaper}
\geometry{textwidth=6.5in}
\geometry{textheight=9in}
\geometry{top=1in,left=1.5in,right=1in,bottom=1in}			% 1.0? top, bottom, and right, and 1.5? left;%

%---- fancyhdr
\fancyhf{}
\cfoot{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

%---- lineno
\renewcommand{\linenumberfont}{\normalfont\scriptsize\sffamily}
\setlength{\linenumbersep}{2em}

%---- titlesec
\titleformat{\chapter}[display]
   {\centering\normalsize\bfseries}{\vspace*{0.5\baselineskip}\@chapapp\space\thechapter}{0pt}{\MakeUppercase}
\titleformat{name=\chapter,numberless}[display]
   {\centering\normalsize}{\vspace*{\baselineskip}}{0pt}{\MakeUppercase}
\titleformat{\section}[hang]
   {\centering\normalsize\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}[hang]
   {\normalsize}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[hang]
   {\itshape\normalsize}{\thesubsubsection}{1em}{}
\titleformat{\paragraph}[runin]
   {\itshape\normalsize}{\theparagraph}{1em}{}
\titlespacing{\chapter}{0pt}{.5in}{*0}
\titlespacing{\section}{0pt}{*0}{*0}
\titlespacing{\subsection}{0pt}{*0}{*0}
\titlespacing{\subsubsection}{0pt}{*0}{*0}
\titlespacing{\paragraph}{0pt}{*0}{2em}

%---- ulem
\normalem


%-- Document properties
%--

\AtBeginDocument{%
   \setlength{\footnotemargin}{1em}
   \setlength{\parindent}{0.5in}
   \setcounter{tocdepth}{2}
   \setcounter{secnumdepth}{3}
   \pagestyle{fancy}
   \pagenumbering{roman}
   \widowpenalty=10000
   \clubpenalty=10000
}

\bibliographystyle{chicago}


%-- Preliminary pages

%--

%---- Blank page left intentionally

%---- Blank page
% First Fly Sheet, not considered in numbering.
\thispagestyle{empty}
\phantom{}

%---- Title page and copyright page
\renewcommand{\maketitle}[1]{%
   \cleardoublepage
   \thispagestyle{empty}
   \phantomsection
   \vspace*{.625in}

\vspace*{.625in}

\begin{center}
\MakeUppercase{\ETD@title} \\
\end{center}
% Leave a blank line below, to start another paragraph.

% The vertical measurement below may need to be adjusted to get the next bit of text 4 in. from the top of the page.
\vspace{1.45in}
% Leave a blank line below, to start another paragraph.

\begin{center}
A Thesis \\
Presented to \\
The Faculty of the Department of Computer Science\\
Western Kentucky University \\
Bowling Green, Kentucky
\end{center}
% Leave a blank line below, to start another paragraph.

% The vertical measurement below may need to be adjusted to get the next bit of text 7 in. from the top of the page.
\vspace{1.725in}
% Leave a blank line below, to start another paragraph.

\begin{center}
In Partial Fulfillment \\
Of the Requirements for the Degree \\
Master of Science
\end{center}
% Leave a blank line below, to start another paragraph.

% The vertical measurement below may need to be adjusted to get the next bit of text 9 in. from the top of the page.
\vspace{1.05in}
% Leave a blank line below, to start another paragraph.

\begin{center}
By \\
\ETD@author \\ 			%remove "MakeUppercase" to have case sensitive names
\doublespacing
\ETD@date

\end{center}




}

%-------- Signatures page


\newenvironment{signature}{%
   \phantomsection
 %  \addcontentsline{toc}{}{}									%commented to remove from table of content
   %\changepage{-1in}{0in}{0in}{0in}{0in}{1in}{0in}{0in}{0in}
   \vspace*{0.5in}
   \vspace*{\baselineskip}
   \begin{center}
      signature
   \end{center}
   \vspace{-\baselineskip}
   \begin{spacing}{2.0}
}{%
   \end{spacing}
   \cleardoublepage
   %\changepage{1in}{0in}{0in}{0in}{0in}{-1in}{0in}{0in}{0in}
}


  %---- Abstract
\renewenvironment{abstract}{%

\begin{center}
\MakeUppercase{\ETD@title}\\
\end{center}
%\addcontentsline{toc}{section}{\normalsize\textnormal{ABSTRACT}}		%commented to remove from table of content
\doublespacing

\begin{center}
%Month Year
 \ETD@date
\end{center}

\vspace{-3em}													% changed to -3 to be in the same line as author

{\raggedright \ETD@author}  % Your name here, inside the braces.

\vspace{-2em}

{\raggedleft \hfill 187 Pages}  % Replace XX with the number of pages.		%replace with newer page

{\raggedright Directed by: Dr. Guangming Xing, Dr. Michael Galloway, Dr. Qi Li }  % Put your thesis committee here.

{\raggedright Department of Computer Science}

\vspace{-2em}
{\raggedleft \hfill Western Kentucky University}
   %\vspace*{\baselineskip}							%commented for WKU example
}



%---- Dedication
\newenvironment{dedication}{%
   \phantomsection
   %\addcontentsline{toc}{chapter}{DEDICATION}						%commented to remove from table of content
   %\changepage{-1in}{0in}{0in}{0in}{0in}{1in}{0in}{0in}{0in}
   \vspace*{0.5in}
   \vspace*{\baselineskip}
   \begin{center}
      DEDICATION
   \end{center}
   \vspace{-\baselineskip}
   \begin{spacing}{2.0}
}{%
   \end{spacing}
   \cleardoublepage
   %\changepage{1in}{0in}{0in}{0in}{0in}{-1in}{0in}{0in}{0in}
}
%---- Acknowledgments
\newenvironment{acknowledgments}{%
   \phantomsection
   %\addcontentsline{toc}{chapter}{ACKNOWLEDGMENTS}				%commented to remove from table of content
   %\changepage{-1in}{0in}{0in}{0in}{0in}{1in}{0in}{0in}{0in}
   \vspace*{0.5in}
   \vspace*{\baselineskip}
   \begin{center}
      ACKNOWLEDGMENTS
   \end{center}
   \vspace{-\baselineskip}
   \begin{spacing}{2.0}
}{%
   \end{spacing}
   \cleardoublepage
   %\changepage{1in}{0in}{0in}{0in}{0in}{-1in}{0in}{0in}{0in}
}

%---- Table of Contents
\renewcommand{\tableofcontents}{%
   %\pagestyle{toccont}
   %\thispagestyle{tocstart}
   \phantomsection
   \vspace*{0.5in}
   \vspace*{\baselineskip}
   \begin{center}
      CONTENTS
   \end{center}
   \vspace{-\baselineskip}
   \begin{spacing}{1.0}
      \@starttoc{toc}
   \end{spacing}
   \cleardoublepage
   %\pagestyle{fancy}
   %\thispagestyle{fancy}
}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    %\vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \leavevmode
      \@dottedtocline{1}{0em}{1.4em}{\MakeUppercase{#1}}{#2}
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand*\l@section[2]{
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    %\vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \leavevmode
      \@dottedtocline{1}{1.5em}{2.3em}{{#1}}{#2}
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand*\l@subsection[2]{
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    %\vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \leavevmode
      \@dottedtocline{2}{3.8em}{3.2em}{{#1}}{#2}
      \penalty\@highpenalty
    \endgroup
  \fi}

\renewcommand*\l@figure[2]{
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    %\vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \leavevmode
      \@dottedtocline{1}{1.5em}{2.3em}{{#1}}{#2}
      \penalty\@highpenalty
    \endgroup
  \fi}
\let\l@table\l@figure
\def\ps@tocstart{
   \setlength{\topmargin}{0.5in}
}
\def\ps@toccont{
   \setlength{\topmargin}{-0.5in}

}

%---- List of Tables
\renewcommand{\listoftables}{%
   \phantomsection
   %\addcontentsline{toc}{chapter}{LIST OF TABLES}				%commented to remove from table of content
   \vspace*{0.5in}
   \vspace*{\baselineskip}
   \begin{center}
      LIST OF TABLES
   \end{center}
   \vspace{-\baselineskip}
   \begin{spacing}{1.0}
      \@starttoc{lot}
   \end{spacing}
   \cleardoublepage
}




%---- List of Figures
\renewcommand{\listoffigures}{%
   \phantomsection
   %\addcontentsline{toc}{chapter}{LIST OF FIGURES}				%commented to remove from table of content
   \vspace*{0.5in}
   \vspace*{\baselineskip}
   \begin{center}
      LIST OF FIGURES
   \end{center}
   \vspace{-\baselineskip}
   \begin{spacing}{1.0}
      \@starttoc{lof}
   \end{spacing}
   \cleardoublepage
}
\newcommand{\listofsymbols}{%
   \phantomsection
   %\addcontentsline{toc}{chapter}{LIST OF ABBREVIATIONS}				%commented to remove from table of content
   \vspace*{0.5in}
   \vspace*{\baselineskip}
   \begin{center}
      LIST OF ABBREVIATIONS
   \end{center}
   \vspace{-\baselineskip}
   \begin{spacing}{2.0}
      \input{abbreviation}
   \end{spacing}
   \cleardoublepage
}




\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}




\renewcommand\appendix{\par
  \cleardoublepage
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \setcounter{table}{0}
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}
  \renewcommand{\thetable}{A.\arabic{table}}
  \renewcommand{\appendixtocname}{Appendix}
  \addappheadtotoc
  \newpage
  }

%-- Body
%--

\newenvironment{body}{%
   \setcounter{page}{1}
   \pagenumbering{arabic}
   \begin{spacing}{2.0}
      \ifthenelse{\equal{\ETD@draft}{true}}{%
         \begin{linenumbers}
      }{}
}{%
      \ifthenelse{\equal{\ETD@draft}{true}}{%
         \end{linenumbers}
      }{}
   \end{spacing}
   \cleardoublepage
}

\newcommand{\newtocpage}{%
   \addtocontents{toc}{\protect\newpage\protect\vspace*{-2\baselineskip}}
}

%---- References
\renewenvironment{thebibliography}[1]{%
	\phantomsection
	\addcontentsline{toc}{chapter}{REFERENCES}
	\cleardoublepage
   %\changepage{-1in}{0in}{0in}{0in}{0in}{1in}{0in}{0in}{0in}
   \vspace*{0.5in}
   \vspace*{\baselineskip}
   \begin{center}
      REFERENCES
   \end{center}
   %\vspace{-.75\baselineskip}
   \vspace{-.5\baselineskip}
   \list{%
      [\arabic{enumi}]
   }{%
      \settowidth\labelwidth{[#1]}
      \itemsep\baselineskip
      \leftmargin\labelwidth
      \advance\leftmargin\labelsep
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      \usecounter{enumi}
   }
   \def\newblock{}
   \sloppy
   \sfcode`\.=1000\relax
}{%
	\cleardoublepage
   %\changepage{1in}{0in}{0in}{0in}{0in}{-1in}{0in}{0in}{0in}
}

\renewcommand{\cite}[1]{\citep{#1}}
\newcommand{\shortcite}[1]{\citeyearpar{#1}}

% vim:syntax=tex
