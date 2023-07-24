\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cmemoir}[Customized algorithmic notes class]

% Load the memoir class
\LoadClass[11pt]{memoir}

% Define your own setting
% \usepackage[a4paper,marginparwidth=80pt]{geometry} % to create a small page
% \usepackage[a4paper, inner=1.5cm, outer=3cm, top=2cm,
% bottom=3cm, bindingoffset=1cm]{geometry}

\usepackage[
            % a4paper,
            inner=20mm,
            outer=60mm,% = marginparsep + marginparwidth 
                       %   + 5mm (between marginpar and page border)
            top=20mm,
            bottom=25mm,
            marginparsep=5mm,
            marginparwidth=50mm,
            % showframe% for show your page design, normaly not used
            ]{geometry}

% \RequirePackage{geometry}
% \geometry{includeall, top=14mm, bottom=14mm, inner=20mm, outer=60mm, headheight=16pt, marginparwidth=50mm, marginparsep=5mm}

\setlength{\marginparwidth}{50mm}

\newcommand{\tab}{\hspace{8mm}}
% Please ensure there is no binding offset
\usepackage{parskip} %TO-DO: check why its effect not effecing in global, only affected within environment when used like as shown in \begin{guide}

\usepackage{marginnote}
\usepackage{layout}
\usepackage{lipsum}
\usepackage{blindtext}
\usepackage{tikz}
\usepackage{listings}
\usepackage{paracol}
\usepackage{amsmath} 
\usepackage{import}
% \usepackage{enumitem}
% \usepackage{paralist}
% amsmath have \text{}

% for color
\usepackage{xcolor}
\usepackage{soul}
\usepackage{paralist}

% Environment Here
\usepackage{mdframed}
\usepackage{xcolor}
\usepackage{fancyvrb}
\usepackage[hidelinks]{hyperref} 
\usepackage{needspace}
\usepackage{environ}
\usepackage{fontawesome5}

\newcommand{\rfl}[1]{ \sethlcolor{yellow}\hl{#1}} %rfl = remember for later
\newcommand{\intution}[1]{\sethlcolor{green!40}\hl{#1}} 
\newcommand{\constrain}[1]{\hfill\begin{math} #1 \end{math}}

% \newenvironment{foo}[2]
%   {something with #1 and #2 to be performed at the beginning}
%   {something to be performed at the end}

%   \begin{foo}{arg1}{arg2}
%     some stuff in the middle
%     \end{foo}

\newenvironment{problem}[2][Q:]
    { \newpage \begin{mdframed}[backgroundcolor=yellow!40] \addcontentsline{toc}{section}{#2} \textbf{#1 #2} \\}
    {  \end{mdframed}}
 
    % \setlength\parindent{0pt}
% Define solution environment
%guide: \newenvironment{name}[num]{before code}{after code}
\newenvironment{solution}[1][]
    { \addcontentsline{toc}{subsection}{#1} \setlength\parindent{0pt} \vspace{4mm} \noindent\textit{Solution:  \hfill #1 } \\[2mm]\parskip=.6em}
    {\hfill \\ \rule{\textwidth}{1pt}}


\newenvironment{guide}
{
  \textcolor{green}{\rule{\textwidth}{2pt}} \textbf{Hints:}\newline \parskip=.6em
  \renewcommand{\item}{\vspace{.7em}\faHandPointRight\hspace{2mm}} %VERT IMPORTANT: defining command within environment scope
}
{\par\textcolor{green}{\rule{\textwidth}{2pt}}\par}


\newcommand{\texthighlight}[2]
{\sethlcolor{#1}{\hl{#2}}}
%hl stands for highlight

% \newenvironment{intution}
%     {\par\smallskip\noindent\underline{Intution:}\quad}
%     {}

% Environment end here


%------------------------------------------------------------
% VARIOUS RULERS, SEPARATORS & DIVIDERS
%------------------------------------------------------------
\newcommand{\rulethick}[1][darkgray]{\par\textcolor{#1}{\rule{\linewidth}{4pt}}\par}
\newcommand{\rulethin}[1][black]{\par\textcolor{#1}{\rule{\linewidth}{1pt}}\par}

\RequirePackage{multicol}
\RequirePackage[twosidemode, needspace=3mm, outermargin=-\marginparsep-\marginparwidth]{fullwidth}

\newenvironment{pratice}
{  
    \begin{fullwidth}[width=\linewidth +\marginparsep+\marginparwidth]
    
    \begin{mdframed}[leftline=true, rightline=true,linewidth=2pt,linecolor=gray] %hidealllines=true add it to default do show any border
    \begin{center}
    \addcontentsline{toc}{subsection}{Pratice More Problems}
    {\Large Pratice Problems:}
    % TO-DO: Increase the font-size of above text to make it stand out from the content.
}
{\end{center}\end{mdframed}\end{fullwidth}}

\newenvironment{praticeHints}
{  
    \begin{fullwidth}[width=\linewidth +\marginparsep+\marginparwidth]
    \begin{center}
    \begin{mdframed}[leftline=true, rightline=true,linewidth=2pt,linecolor=green!40]
    {\Large Pratice Problems Hints:}
}
{\end{mdframed}\end{center}\end{fullwidth}}




% usage: \begin{problems}[heading]{problems}
\newenvironment{exercise}[1][Chapter Exercises:]{
   
    \begin{fullwidth}[width=\linewidth+\marginparwidth] %+\marginparsep
    % \newgeometry{inner=10pt,outer=20pt}  
    \rulethick\vspace*{-3mm}
    % \setlist[enumerate,1]{label=\arabic*.}
    % \setlist[myenum,2]{label=\alph*)}
    \section*{#1}
    \addcontentsline{toc}{section}{#1}
    \begin{multicols}{2}
  }{
    \end{multicols}\end{fullwidth}%\restoregeometry
  }

  \newenvironment{exerciseHints}[1][Exercises Solutions:]{
    \begin{fullwidth}[width=\linewidth+\marginparwidth] %+\marginparsep
    \rulethick[green!40]\vspace*{-3mm}

    \section*{#1}
    \begin{multicols}{2}
  }{
    \end{multicols}\end{fullwidth}
  }

% Below define code environemnt

\newenvironment{code}
{\Verbatim[samepage=true]}
{\endVerbatim}

% \makeatletter
% \renewcommand{\mdf@prebreakhook}{\newpage}
% \makeatother

\lstset{
  basicstyle=\ttfamily,
  columns=fullflexible,
  keepspaces=true,
  frame=single,
  breaklines=true
}
% use it like \begin{lstlisting} code \end{lstlisting}
% or use it single line as \verb|int val1;|

% use this for normal width with marginparwidth & images on side. \code2{Code Caption}
\lstnewenvironment{code2c}[1][]
{
    % see listing package documentation to learn about below/more options (https://ctan.org/pkg/listings?lang=en)
    \lstset{
        basicstyle=\ttfamily, %verbatium usages ttfamily font, hence setting it this means display be like verbatium
        columns=fullflexible,
        keepspaces=true,
        frame=single, %making is single will draw a border
        framerule=0pt, %frame that is not visible (added to use margin)
        backgroundcolor=\color{gray!10}, %to code background color
        breaklines=true, % for text autowrap around boundary
        % resetmargins=true,
        caption=#1,
      }
}
{}

\lstnewenvironment{code2}[1][]
{
    % see listing package documentation to learn about below/more options (https://ctan.org/pkg/listings?lang=en)
    \lstset{
        basicstyle=\ttfamily, %verbatium usages ttfamily font, hence setting it this means display be like verbatium
        columns=fullflexible,
        keepspaces=true,
        frame=single, %making is single will draw a border
        framerule=0pt, %frame that is not visible (added to use margin)
        % backgroundcolor=\color{gray!10}, %to code background color
        breaklines=true, % for text autowrap around boundary
        % resetmargins=true,
        caption=#1,
      }
}
{}

% IMP: if you want it to on same page, one option is to use \newpage wher you want it (as for now mdframe cannot be used with lstenvironment)
% tested with minipage , mdframe no simple solution found.
% tested with calulcation of content width, but the issue is that code \BODY cannot be expande well.
% tested with codeframe new envrionment, same issue as code body cannot be passed to new envrionemnt

% use this for full width code display
% \lstnewenvironment{code3}[1][]
% {
%     \newgeometry{left=15mm,right=15mm}
%     % see listing package documentation to learn about below/more options
   
%     \lstset{
%         basicstyle=\ttfamily,
%         columns=fullflexible,
%         keepspaces=true,
%         frame=single, %making is single will draw a border
%         framerule=0pt, %frame that is not visible (added to use margin)
%         backgroundcolor=\color{gray!10}, %to code background color
%         breaklines=true, % for text autowrap around boundary
%         resetmargins=true,
%         caption=#1
%       } 
% }
% {\restoregeometry}

% Create a new environment without borders
\newenvironment{mdframed2}{
  \begin{mdframed}[
    hidealllines=true,
    innertopmargin=0pt,
    innerbottommargin=0pt,
    skipabove=0pt,
    skipbelow=0pt,
  ]
}{
  \end{mdframed}
}

\lstnewenvironment{code3}[1][]
{
  \newgeometry{left=15mm,right=15mm,bottom=2.5cm}
  \lstset{
        basicstyle=\ttfamily,
        columns=fullflexible,
        keepspaces=true,
        frame=single, %making is single will draw a border
        framerule=0pt, %frame that is not visible (added to use margin)
        backgroundcolor=\color{gray!10}, %to code background color
        breaklines=true, % for text autowrap around boundary
        resetmargins=true,
        caption=#1
        } 
}
{\restoregeometry}

\lstnewenvironment{code4}[1][]
{
  \newgeometry{left=15mm,right=15mm,bottom=2.5cm}
  \lstset{
        basicstyle=\ttfamily,
        columns=fullflexible,
        keepspaces=true,
        frame=single, %making is single will draw a border
        framerule=0pt, %frame that is not visible (added to use margin)
        backgroundcolor=\color{gray!10}, %to code background color
        breaklines=true, % for text autowrap around boundary
        resetmargins=true,
        caption=#1
      } 
}
{\restoregeometry}

% see listing package documentation for more
\newcommand{\icode}[1]{\lstinline|#1|}
\begin{comment}
 use it like icode{your code here} <= code must not have {}

 If your code has {}, you should use lstinline||. If you code does not have {} you can use either 
 lstinline{} or \icode{}.

 Example Usages:
     \lstinline{int val1; [] int val2;} /% will not work if {} is in code, rest is okay

    \lstinline|int {} [] val1; int val2;| % will work even if {} is in code

    \icode{[]val1; int val2;}

\end{comment}


% code environemtn ends here


% \newenvironment{code}
% {\endgraf\noindent 
% \endgraf\verbatim}
% {\endverbatim}

% \settocdepth{section} % For numbering section & subsection
% \setsecnumdepth{subsubsection}
\setcounter{tocdepth}{3}

% below: environemtn related to hints & solution of pratice + Exercise Question
\newsavebox{\hints}
\setbox\hints=\vbox{}






% end marker
\endinput