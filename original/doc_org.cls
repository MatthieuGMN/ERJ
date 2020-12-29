% This class file is provided for authors submitting to the
% REHABILITATION Journal
%
% Version: 1.0, 2020/05/26
%
% Produced by Overleaf (www.overleaf.com)
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rehab}[26/05/2020, v1]
\AtEndOfClass{\RequirePackage{microtype}}

% Options for element switching
\RequirePackage{xifthen}
\newboolean{displaycopyright}
\newboolean{displaylineno}
\setboolean{displaylineno}{false}

\DeclareOption{lineno}{\setboolean{displaylineno}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions*
\LoadClass{extarticle}

% May 25, 2020:
% Line numbers
% v1.0 May 25, 2020: make sure line numbers are 
% displayed in outer margins of columns; so
% remove "running" option somehow gets it right
\RequirePackage[switch,pagewise]{lineno}

% Fonts and language
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{mathpazo}
\RequirePackage[scaled]{helvet}
\usepackage{CormorantGaramond}
\usepackage[T1]{fontenc}
\usepackage{eso-pic,xcolor,graphicx}
%% The font package uses mweights.sty which has som issues with the
%% \normalfont command. The following two lines fixes this issue.
\let\oldnormalfont\normalfont
\def\normalfont{\oldnormalfont\mdseries}
\RequirePackage{url}
\RequirePackage[colorlinks=true, allcolors=blue]{hyperref}
\RequirePackage{lettrine}

\newcommand{\watermarkfont}{\color{black80}\normalfont\fontsize{15}{12}\selectfont}
\newcommand{\headerfont}{\color{color2}\normalfont\sffamily\bfseries\fontsize{14}{12}\selectfont}
\newcommand{\titlefont}{\normalfont\sffamily\bfseries\fontsize{24}{30}\selectfont}
\newcommand{\datesfont}{\normalfont\sffamily\itshape\fontsize{8}{10}\selectfont}
\renewcommand\UrlFont{\color{color1}\sffamily}
\newcommand{\absfont}{\normalfont\sffamily\linespread{1.2}\fontsize{10}{12}\selectfont}
\newcommand{\keywordsfont}{\normalfont\sffamily\linespread{1.2}\fontsize{9}{10}\selectfont}
\newcommand{\copyrightfont}{\normalfont\sffamily\fontsize{7}{9}\selectfont}

\RequirePackage{datetime}

\newdateformat{monthyeardate}{%
  \monthname[\THEMONTH] \THEYEAR}

\RequirePackage{enumitem} 
\setlist[itemize]{noitemsep}

% Author and affiliation
\RequirePackage{authblk}
\setlength{\affilsep}{0.1em}
\renewcommand\Authfont{\color{color0}\normalfont\sffamily\bfseries\fontsize{9}{13}\selectfont}
\renewcommand\Affilfont{\color{color0}\normalfont\sffamily\fontsize{8}{10}\selectfont}
% \makeatletter
\renewcommand\AB@affilsepx{, \protect\Affilfont}
% \makeatother
\renewcommand\Authands{ and }

% Choose article type
\newcommand*{\articletype}[1]{%
  \RequirePackage{styles/#1}}
  
% Copyright statement
\RequirePackage{textcomp} % For copyright symbol styling
\newcommand{\copyrightstatement}{Copyright \, \textcopyright\, \the\year{} by the Société Française de Physiothérapie}

% Remove copyright statement from PDF
\AtBeginDocument{\setboolean{displaycopyright}{false}}

% Graphics, tables and other formatting
\RequirePackage{graphicx,xcolor}
\RequirePackage{colortbl}
\RequirePackage{booktabs}
\RequirePackage{tikz}
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{changepage}
\RequirePackage[left=48pt,%
                right=42pt,%
                top=48pt,%
                bottom=60pt,%
                headheight=15pt,%
                headsep=10pt,%
                letterpaper,twoside]{geometry}%
\RequirePackage[labelfont={bf,sf},%
                labelsep=space,%
                figurename=Figure,%
                singlelinecheck=off,%
                justification=RaggedRight]{caption}
\setlength{\columnsep}{24pt} % Distance between the two columns of text
\setlength{\parindent}{12pt} % Paragraph indent

% Set document color scheme
\definecolor{black50}{gray}{0.5} % 50% black for hrules
\definecolor{color0}{RGB}{0,0,0} % Base color
\definecolor{color1}{RGB}{59,90,198} % unused
% color2 defined by the specific article type style file

% Bibliography
% Vancouver style from ICMJE
\usepackage[numbers]{natbib}
\bibliographystyle{unsrtnat}

% Table style
\arrayrulecolor{color0} % Set the color of the horizontal rules
\renewcommand{\arraystretch}{1.5} % Increased line spacing
\captionsetup[table]{position=below} % Reduce spacing below caption

% Algorithm style
% \makeatletter
\newcommand\fs@coloruled{\def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@coloruled
  \def\@fs@pre{\kern2pt}%
  \def\@fs@post{\kern2pt{\color{color2}\hrule}\relax}%
  \def\@fs@mid{\kern2pt{\color{color2}\hrule}\kern2pt}%
  \let\@fs@iftopcapt\iftrue}
% \makeatother

\floatstyle{coloruled}
\restylefloat{algorithm}

% Headers and footers
\RequirePackage{fancyhdr}  % custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\pagestyle{fancy}          % Enables the custom headers/footers

\fancypagestyle{firststyle}{
   \fancyhead[C]{{\watermarkfont EUROPEAN REHABILITATION JOUNRAL |} 
   \headerfont \articletypename} % C for centre
   \fancyhead[R]{} %
}

\fancyhf{} % make lines for header and footer
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Headers
\lhead{}
\chead{}
\rhead{}
\fancyhead[LO,LE]{} % Blank headers for non-title pages.
\fancyhead[RE,RO]{\@runningauthor \hspace{2em} \ }

% Footers
\lfoot{}
\cfoot{}
\rfoot{}
\fancyfoot[RE,RO]{\@runningtitle \hspace{2em} \thepage\ }

% \makeatletter
%\fancyfoot[RE,RO]{\@runningtitle \hspace{2em} \thepage\ }
% \makeatother
%\fancyfoot[LO,RE]{}
\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0pt}% % No footer rule

%% Make sure sections are unnumbered
\setcounter{secnumdepth}{0}
\setcounter{tocdepth}{0}

% Section/subsection/paragraph set-up
\RequirePackage[explicit]{titlesec}
\renewcommand{\thesubsection}{\Alph{subsection}}

\titleformat{\section}
  {\large\sffamily\bfseries}
  {\thesection.}
  {0.5em}
  {#1}
  []
\titleformat{name=\section,numberless}
  {\large\sffamily\bfseries}
  {}
  {0em}
  {#1}
  []
\titleformat{\subsection}
  {\sffamily\bfseries\itshape}
  {\thesubsection.}
  {0.5em}
  {#1}
  []
\titleformat{\subsubsection}[runin]
  {\sffamily\bfseries\itshape}
  {\thesubsubsection.}
  {0.5em}
  {#1}
  []
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1}
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{2pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{2pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{12pt}

% Article meta data additional fields
\newcommand{\runningauthor}[1]{\def\@runningauthor{#1}}
%% Backward compatibility
\newcommand{\correspondingauthor}[1]{\runningauthor{#1}}
\newcommand{\keywords}[1]{\def\@keywords{#1}}
\newcommand{\runningtitle}[1]{\def\@runningtitle{#1}}

\newcommand{\keywordname}{KEYWORDS} % Defines the keywords heading name
%\newcommand{\keywordname}[1]{MOTS-CLÉS} % Defines the keywords heading name

% Colored margin box
\newcommand{\marginmark}{
\begin{textblock}{2}(141,15) 
\begin{tikzpicture}
\fill[color=color2] (0,0) rectangle (100,0.25);
\end{tikzpicture}
\end{textblock}
}

\def\xabstract{abstract}
\long\def\abstract#1\end#2{\def\two{#2}\ifx\two\xabstract
\long\gdef\theabstract{\ignorespaces#1}
\def\go{\end{abstract}}\else
\typeout{^^J^^J PLEASE DO NOT USE ANY \string\begin\space \string\end^^J
COMMANDS WITHIN ABSTRACT^^J^^J}#1\end{#2}
\gdef\theabstract{\vskip12pt BADLY FORMED ABSTRACT: PLEASE DO
NOT USE {\tt\string\begin...\string\end} COMMANDS WITHIN
THE ABSTRACT\vskip12pt}\let\go\relax\fi
\go}

% Set environment for abstract content and styling
\newcommand{\abscontent}{
    \noindent
{%
\parbox{\dimexpr\linewidth}{%
    %% v1.8: turn on line numbers
	\ifthenelse{\boolean{displaylineno}}{\internallinenumbers}{}%
    {\absfont\bfseries ABSTRACT} \absfont \theabstract
}%
\vskip10pt%
\noindent
\parbox{\dimexpr\linewidth-2\fboxsep\relax}{%
 %% v1.8: turn on line numbers
\ifthenelse{\boolean{displaylineno}}{\internallinenumbers}{}%
{\keywordsfont\bfseries\keywordname}\hspace*{0.1em} \keywordsfont \@keywords%
}%
}%
}%

% Custom title page
\renewcommand{\@maketitle}{\bgroup\setlength{\parindent}{0pt}
\begin{flushright}
{%
\vskip50pt%
{\raggedright \titlefont \@title\par}%
\vskip11pt
{\raggedright \@author\par}
\vskip10pt%

%author contribution
%{\raggedright \noindent$\dagger$These authors contributed equally to this work.\par}
%\vskip5pt%
{\raggedright \noindent DOI: 10.1534/genetics.XXX.XXXXXX\par} 
% Data Manuscript
{\raggedright \Manuscript received : \today \par}
{\raggedright \Manuscript accepted: \today \par}
}%

\vskip5pt%
% Conflict of interest
{\raggedright \noindent \textbf{Conflict of interest:}
\\
ML and JCB are employees of “AGIR à dom.”, a non-profit home care provider. JCB has received grants, personal fees, and non-financial support from Philips healthcare, RESMED outside the context of the submitted work. JCB has also a patent with NOMICS SA. ML has received grants, personal fees, and non-financial support from Air Liquide Healthcare and SEFAM outside the context of the submitted work. JLP is  supported by a research grant from the French National Research Agency (ANR-12-TECS-0010) in the framework of the “Investissements d’avenir” program (ANR-15-IDEX-02) and the “e-health and integrated care” Chair of excellence of the University Grenoble Alpes Foundation. JCB and JLP are co-inventors of a patent N # WO2016041025A1. The others authors (DN, CS, MCR, JPM, LL, EML, NM) have no conflicts to disclose linked to this work.\par}

\vskip5pt%
% Abbreviations list
{\raggedright \noindent \textbf{Abbreviations list:}
\\
AHI : Apnea Hypoxia Index
\\
BMI : Body Mass Index
\\
CPAP : Continuous Positive Airway Pressure 
\\
ESS : Epworth Sleepiness Scale
\\
IQR : Inter Quartile Range
\\
OSA : Obstructive Sleep Apnea
\\
REM Sleep : Rapid Eye Movement Sleep
\\
SD : Standard Deviation
\\
SpO2 : Peripheral capillary oxygen saturation
\\
OR : Odds Ratio
\\
NC : Non-calculable\par}

\end{flushright}\egroup

{%
{\color{black50}\rule{\linewidth}{0.5pt}}
\vskip12pt%
\abscontent
\vskip12pt%
\color{black50}\rule{\linewidth}{0.5pt}
}%
\vskip25pt%
}%

% Other packages
\RequirePackage{enumitem} % For reducing bullet list item separation

\RequirePackage{tabularx}

\RequirePackage[flushmargin,ragged]{footmisc}

\newlength{\myFootnoteWidth}%
\newlength{\myFootnoteLabel}%
\setlength{\myFootnoteLabel}{0.5em}
\renewcommand{\@makefntext}[1]{%
  \setlength{\myFootnoteWidth}{\columnwidth}%
  \addtolength{\myFootnoteWidth}{-\myFootnoteLabel}%
  \noindent\makebox[\myFootnoteLabel][r]{\@makefnmark\ }%
  \parbox[t]{\myFootnoteWidth}{#1}
  }

% Commands to set the footnote for the front page.
\renewcommand{\footnoterule}{%
  \kern -3pt
  {\color{black50} \hrule width \columnwidth height 0.5pt}
  \kern 2.5pt
}

\newcommand{\@authfootnote}[2]{%
  \begingroup
  \setlength{\myFootnoteLabel}{0em}
  \renewcommand\thefootnote{}\footnote{\footnotelayout\copyrightfont\textsuperscript{#1}#2}%
   \endgroup%
}

\newcommand\blfootnote[1]{%
  \@authfootnote{}{#1}%
%   \begingroup
%   \setlength{\myFootnoteLabel}{0em}
%   \renewcommand\thefootnote{}\footnote{#1}%
%   \addtocounter{footnote}{-1}%
%   \addtocounter{Hfootnote}{-1}%
%   \endgroup%
}

\newcommand\correspondingauthoraffiliation[2]{%
  \@authfootnote{#1}{#2}%
%   \begingroup
%   \setlength{\myFootnoteLabel}{0em}
%   \renewcommand\thefootnote{}\footnote{\footnotelayout\copyrightfont\textsuperscript{1}#1}%
%   \endgroup
  %% v1.8: turn on line numbers after this
  \ifthenelse{\boolean{displaylineno}}{\par\linenumbers}{}
}

\newenvironment{tableminipage}[1]{\begin{minipage}{#1}\renewcommand\footnoterule{ \kern -1ex}%
\setlength{\myFootnoteLabel}{0.5em}%
}{\end{minipage}}

% Package to enable absolute positioning of figures
\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\textblockorigin{0mm}{0mm} % start everything near the top-left corner