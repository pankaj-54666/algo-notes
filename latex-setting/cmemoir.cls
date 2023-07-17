\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myclass}[2023/07/05 Custom Class based on memoir]

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
\setlength{\marginparwidth}{50mm}

\newcommand{\tab}{\hspace{8mm}}
% Please ensure there is no binding offset
% \usepackage{parskip}

\usepackage{marginnote}
\usepackage{layout}
\usepackage{lipsum}
\usepackage{blindtext}
\usepackage{tikz}
\usepackage{listings}
\usepackage{paracol}
\usepackage{amsmath} 
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




\newcommand{\rfl}[1]{ \sethlcolor{yellow}\hl{#1}} %rfl = remember for later
\newcommand{\intution}[1]{\sethlcolor{green!40}\hl{#1}} 

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
    { \addcontentsline{toc}{subsection}{#1} \setlength\parindent{0pt} \vspace{4mm} \noindent\textit{Solution:  \hfill #1 } \\[2mm]}
    {\hfill \\ \rule{\textwidth}{1pt}}


\newenvironment{guide}
{\noindent\setlength\parindent{0pt} \textcolor{green}{\rule{\textwidth}{2pt}} \textbf{Hints:}\\[2mm]}
{\textcolor{green}{\rule{\textwidth}{2pt}}}


\newcommand{\texthighlight}[2]
{\sethlcolor{#1}{\hl{#2}}}
%hl stands for highlight

% \newenvironment{intution}
%     {\par\smallskip\noindent\underline{Intution:}\quad}
%     {}

% Environment end here



\newenvironment{pratice}
{}
{}

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
\lstnewenvironment{code2}[1][]
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

% IMP: if you want it to on same page, one option is to use \newpage wher you want it (as for now mdframe cannot be used with lstenvironment)
% tested with minipage , mdframe no simple solution found.
% tested with calulcation of content width, but the issue is that code \BODY cannot be expande well.
% tested with codeframe new envrionment, same issue as code body cannot be passed to new envrionemnt

% use this for full width code display
\lstnewenvironment{code3}[1][]
{
    \newgeometry{left=15mm,right=15mm}  
    % see listing package documentation to learn about below/more options
    \lstset{
        basicstyle=\ttfamily,
        columns=fullflexible,
        keepspaces=true,
        frame=single, %making is single will draw a border
        framerule=0pt, %frame that is not visible (added to use margin)
        backgroundcolor=\color{gray!10}, %to code background color
        breaklines=true, % for text autowrap around boundary
        % resetmargins=true,
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