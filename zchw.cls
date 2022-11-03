%=======================================================%
% Zachary's Homework Templates
% Maintainer: Zachary Liu (zsbyqx2020@163.com)
% 
% Document class to produce stylish homework
%=======================================================%


%=======================================================%
% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zchw}[2022/10/10]
%=======================================================%


%=======================================================%
% New Commands
\newcommand{\subtitle}[1]{\newcommand{\subtitlelocal}{#1}}
\newcommand{\class}[1]{\newcommand{\classlocal}{#1}}
\newcommand{\id}[1]{\newcommand{\idlocal}{#1}}
\newcommand{\engname}[1]{\newcommand{\engnamelocal}{#1}}
%=======================================================%


%=======================================================%
% Options
\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption{twoside}{\OptionNotUsed}
\PassOptionsToClass{fontset=none}{ctexart}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax
\LoadClass{ctexart}
%=======================================================%


%=======================================================%
% Required Packages
\RequirePackage{amsmath,amssymb,amsthm,mathrsfs}
% \RequirePackage{mathpazo}
\RequirePackage{unicode-math}
\RequirePackage{fontspec}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage[small,bf]{caption}
\RequirePackage[hyperfootnotes=true,bookmarksopen=true]{hyperref}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{makecell}
\RequirePackage{fancyhdr}
\RequirePackage{ifthen}
\RequirePackage{subfig}
\RequirePackage{xcolor}
\RequirePackage{framed}
\RequirePackage{ragged2e}
\RequirePackage{tcolorbox}
\RequirePackage{color}
\RequirePackage{listings}
\RequirePackage{changepage}
\RequirePackage{multirow}
\RequirePackage{bookmark}
\RequirePackage{IEEEtrantools}


% Global Settings
\graphicspath{{./figures}}
\setlength\parindent{0pt}
\setlist[enumerate]{itemsep=0em,topsep=0.2em,parsep=0pt,partopsep=0.2em}
\setlist[enumerate, 1]{label = {(\arabic*)}}
\setlist[enumerate, 2]{label = {\roman*.}}
\setlist[itemize]{itemsep=0em,topsep=0.2em,parsep=0pt,partopsep=0.2em}
\setlist[description]{topsep = 0.2em, listparindent = \parindent, font = \normalfont, itemsep = 0em}
\titleformat{\section}{\large\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\bfseries}{\thesubsection}{1em}{}
\geometry{left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm}
\fancyhead[R] {\footnotesize\thepage}
\fancyhead[L] {\footnotesize\itshape\@title}
\fancyhead[C] {\footnotesize\itshape{
    \ifthenelse{\isundefined\classlocal}
    {}{\classlocal}
}}
\fancyfoot{}
\fancyfoot[R] {
    \footnotesize{
        \ifthenelse{\isundefined\subtitlelocal}
        {\itshape{Department of Electronic Engineering}}
        {\itshape\subtitlelocal}
    }
}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}

\setlength{\parindent}{2em}

% Some font settings
%% English font
\setmainfont{TeX Gyre Pagella}
\setmathfont{Asana Math}
\setmonofont{JetBrains Mono}
%% Chinese font
\newfontfamily\numchi{华文楷体}
\setCJKmainfont[ItalicFont={华文楷体},BoldFont={等线 Bold}]{方正新书宋简体}
%=======================================================%


%=======================================================%
% Some stylish blocks

% Define colors
\definecolor{Tsinghua}{RGB}{102,8,116}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

% Set title format
\renewcommand{\maketitle}{
    \thispagestyle{empty}
    \begin{flushleft}
        \hspace{2em}
        \includegraphics[height=1.5cm]{\string"D:/Desktop/Study/Coding/Latex Source Code/Templates/Pic/image.png\string"}{\color{Tsinghua}\qquad \rule[-0.5cm]{.3mm}{2.5cm}}\hspace{2em}\begin{minipage}[t]{8cm}
            \vspace{-5em}

            \LARGE  \textbf{\classlocal}

            \small \textsc{\engnamelocal}
            \vspace{0.5em}
    
            \normalsize  \textit{\@title}
    
            \normalsize  \textit{\@author} \numchi \idlocal
        \end{minipage}
    \end{flushleft}
    \vspace{2em}
}

% Define a sublist environment
\newenvironment{sublist}{
    \setlength\parindent{2em}
    \vspace*{0.2em}\par
}{\vspace*{0.5em}}

% Define problems & proofs
\newcounter{problemname}
\newenvironment{colorpb}
{\stepcounter{problemname}\begin{tcolorbox}[title=Problem \theproblemname]}
{\end{tcolorbox}}

\newenvironment{answer}
{
  \setlength\parindent{0pt}
  \noindent{\bf 解答.}
  \vspace{-\baselineskip}
  \begin{adjustwidth}{3em}{}
}
{  
  \end{adjustwidth}\vab
}

% Two useful indent horizon & vertical
\newcommand{\tab}{\hspace{2em}}
\newcommand{\vab}{\vspace{1em}}

% set hyperref
\hypersetup{hidelinks}

% SQL format
\lstset{language=SQL,
  basicstyle={\small\ttfamily},
  belowskip=3mm,
  breakatwhitespace=true,
  breaklines=true,
  classoffset=0,
  columns=flexible,
  commentstyle=\color{dkgreen},
  escapechar=\$,
  framexleftmargin=0.25em,
  frameshape={{RYRYNYYYY}{yny}{yny}{RYRYNYYYY}}, %To remove to vertical lines on left, set `frameshape={}{}{}{}`
  keywordstyle=\color{blue},
  numbers=none, %If you want line numbers, set `numbers=left`
  numberstyle=\tiny\color{gray},
  showstringspaces=false,
  stringstyle=\color{mauve},
  tabsize=3,
  xleftmargin=1em
}
%=======================================================%