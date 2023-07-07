%-----------------------------------------------------------------------------
%-------10--------20--------30--------40--------50--------60--------70------78
%-----------------------------------------------------------------------------
% This is my Motion Mountain class file:        motionmountain.cls
% This .cls file is for my macbook laptop.
%----------------------------------------------------------------------------- 
% This file is coded in UTF-8. To change this, use OSX's TextEdit Utility.
%----------------------------------------------------------------------------- 
% This file explicitly has NO copyright. May 2020. 
% It is available online as www.motionmountain.net/motionmountain.cls
% Thank you to all helpers for all this. They are named in the book.
% 
% The catch: many comments are in Italian.
%-----------------------------------------------------------------------------
% There are several additional .sty files used as addenda:
% 
% bw-a4.sty          (for the B&W book at kdp / Amazon)
% 8x10-colour.sty    (for the colour book at kdp / Amazon)
% cskindle.sty       (for a kindle version - obsolete in 2020)
% vietna.sty         (for the Vietnamese translation)
% spanishmm.sty      (for the Spanish translation)
% 
%----------------------------------------------------------------------------- 
% Versione mai provata con il vecchio desktop, giÃ  almeno dal 2014.
%-----------------------------------------------------------------------------
% USE OF THIS CLASS FILE: Dec 2014 - May 2020
%
% To typeset a volume (e.g. motionmountain-volume1.tex) do:
%
% latex motionmountain-volume1; latex motionmountain-volume1; latex motionmountain-volume1; 
% makeindex -s motionmountain.ist -o  motionmountain-volume1.ind   motionmountain-volume1.idx
% makeindex -s motionmountain.ist -o  motionmountain-volume1.nad -t motionmountain-volume1.nag  motionmountain-volume1.nax;
% latex motionmountain-volume1; latex motionmountain-volume1; latex motionmountain-volume1; 
% dvips -R -Poutline -G0 -j0 -o motionmountain-volume1.ps motionmountain-volume1.dvi
%
% Then DISTILL the ps file with Adobe Distiller:
% 
% open -a "/Applications/Adobe Acrobat XI Pro/Acrobat Distiller.app" /Users/schiller/Desktop/Buch-Laufende-Files/motionmountain-volume1.ps
%
% Alternatively, since Dec 2014, to make the pdf, you can use:
% ps2pdf -dNOSAFER -dAutoRotatePages=/None -dFastWebView=true 
% motionmountain-volume1.ps motionmountain-volume1.pdf
%
% For all the ps2pdf options, see
% http://www.ghostscript.com/doc/9.14/Ps2pdf.htm#Options
%----------------------------------------------------------------------------- 
%
% All the typesetting commands for volume 1 are found in the shell file 
%        mm-mb-1.sh
%        
% It can be run by using:
%        bash mm-mb-1.sh      This typesets the first English volume
%        bash mm-mb-2.sh      This typesets the second English volume
% 
%----------------------------------------------------------------------------- 
% Downloaded texlive 2020 from http://www.tug.org/mactex/mactex-download.html
% using SAFARI (they want it). Installed the PKG file.
% 
% Then did: 
% sudo -H mktexlsr
% sudo -H updmap-sys
% sudo -H updmap-user --enable Map=MinionPro.map
% sudo -H updmap-user --enable Map=minionmath-ps.map
% sudo -H updmap-user --enable Map=springer.map
% 
% If dvips does not find the fonts, you can also use
% 
% dvips -R -Poutline -G0 -j0 -u +MinionPro.map -u +springer.map -u +minionmath-ps.map\
%  -o /Users/schiller/Desktop/Buch-Laufende-Files/motionmountain-volume3.ps\
%  /Users/schiller/Desktop/Buch-Laufende-Files/motionmountain-volume3.dvi
%  
% inside all the .sh commands files.
%----------------------------------------------------------------------------- 
%-----------------------------------------------------------------------------
\def\fileversion{9.584\space} 
\def\filedate{2020/05/23\space}
\NeedsTeXFormat{LaTeX2e}[2020/02/02]% Modified to work with Texlive 2020
\typeout{--------------------------------------------------------}
\ProvidesPackage{motionmountain}[\filedate \fileversion]
\typeout{--------------------------------------------------------}
%-----------------------------------------------------------------------------
\long\def\comment#1{} % for testing features and macros - here or in the text
%-----------------------------------------------------------------------------
% CLASS FILE HISTORY:
%
% versione   9.580, Mag 2020:   5487 righe  Works on Macbook Pro with 
%                                           Distiller with TexLive 2020
% versione   9.570, Oct 2017:   5306 righe  Works on Macbook Pro with Distiller
%                                           TOC and runiing headers corrected
% versione   9.550, Aug 2017:   5253 righe  tested on Macbook Pro with Distiller
% versione   9.540, Jun 2016:               tested on Macbook with Distiller
% versione   9.522, giu 2015:               con floatpag
% versione   9.522, feb 2015:   5060 righe  le virgole matematiche funzionano
%                                              edizione 27.10
% versione   9.520, feb 2015:   5036 righe  lettrine funziona di nuovo
% versione   9.510, gen 2015:   5015 righe
% versione   9.500, dic 2014:   4879 righe  per texlive 2014 & utf8 & ps2pdf
%                                           e il mio laptop (MacBook), ed. 27.06
% versione   9.420, mar 2014:   4600 righe  aggiornamenti per u3d, edizione 27
% versione   9.400, ott 2012:   4576 righe  aggiornamenti per l'edizione 25.2
% versione   9.380, giu 2011:   4484 righe  ora un solo file (lettrine non fa)
% versione   9.360, ago 2010:   4225 righe  per l'edizione 24
% versione   9.320, aug 2009:   4005 righe    
% versione   9.220, aug 2009:   4160 righe  per l'edizione 23, con minionmath
% versione   9.200, jan 2009:   4052 righe  edizione 22bis
% versione   9.196, dic 2008:   3928 righe  edizione 22
% versione   9.192, dic 2008:   4184 righe  edizione 22
% versione   9.186, dic 2008:   4269 righe  edizione 22
% versione   9.182, nov 2008:   4288 righe  edizione 22
% versione   9.150, lug 2008:   4451 righe  
% versione   9.144, nov 2007:   4527 righe  edizione 21
% versione   9.130, set 2007:   4184 righe  
% versione   9.092, dic 2006:   3837 righe  
% versione   9.064, apr 2006:   3536 righe  
% versione   9.058, feb 2006:   3099 righe  
% versione   9.056, set 2005:   3050 righe  
% versione   9.050, ago 2005:   2918 righe  riorganizzato da Dirr
% versione   9.022, lug 2005:   2693 righe
% versione   9.004, apr 2005:   3000 righe
% versione   9.000, dic 2004:   2870 righe
% versione   8.896, dic 2004:   2812 righe
% versione   8.888, dic 2004:   2754 righe
% versione   8.884, nov 2004:   2952 righe
% versione   8.882, nov 2004:   3199 righe
%-----------------------------------------------------------------------------
%-----------------------------------------------------------------------------
% TO DOs IN THIS FILE, Dec 2014
%
% !!! indicates a `to do' item, the number after it is the priority
%
% !!!3 add more space before : ; ? and ! - use babel to do it, with the
%      active mechanism, or use microtype.
%
% !!!3 reduce the distance to the horizontal bar in \frac
%
% There are a few more !!!'s in the rest of the file
%-----------------------------------------------------------------------------
%-----------------------------------------------------------------------------
% NECESSARY TEX INSTALLATION, Dec 2014, May 2020
%
% Requires the MINIONPRO TEXT FONT (as .pfb files) 
%         The map is MinionPro.map
%         It also needs minionmath-ps.map and springer.map
%         Do NOT use minionmath.map with .pfb files!
%
% Requires the MINIONMATH FONT (I bought it from Johannes KÃ¼ster:
%                               http://www.typoma.de/en/support_latex.html)
%                               The map is minionmath-ps.map
%         Do NOT use minionmath.map with .pfb files!
%
% Requires the MYRIAD FONT for Figure and table captions, margin par, etc.
%                              (I have it installed) ss sans serif Font
%                              The map is springer.map
%                              The font name is fmy
%
% Requires the GRMN fonts (for certain greek texts),
%            these are now in a few files in my book working directory
%
% Requires the WASY fonts (for the jupiter sign).
%
%-----------------------------------------------------------------------------
% ON THE MACBOOK LAPTOP, these files are needed in the book directory:
%
% grmn0900.600pk, grmn0900.1200pk, grmn0900.mf, grmn0900.tfm,
% grmn1000.1200pk                (for greek text characters)
%
% t1f...fd, ts1f...fd            (for my sans serif font)
%
% And these files are NOT needed (as tested): rgrsc10.tfm, sfourier.sty,
%                                 MinionMath-Regular.otf   
%
%-----------------------------------------------------------------------------
% ON THE OLD DESKTOP MAC, these files were needed in the book directory:
%
% grmn0900.600pk, grmn0900.1200pk, grmn0900.mf, grmn0900.tfm,
% grmn1000.1200pk                (for greek text characters)
%
% t1minionmath.fd                is elsewhere on the laptop
% 
%-----------------------------------------------------------------------------
% 
% Good for TESTING: 
%          - pages 411 to 415, and 432 (Jupiter sign) in vol 1,
%          - also page 54 in vol 3 on the very bottom (Tesla in cyrillic)
%          - the Vietnamese book...
%
%-----------------------------------------------------------------------------
%-----------------------------------------------------------------------------
% LATEX DETAILS
%
% Since 2008, the MinionPro package gives a harmless latex error:
% Unknown slot number of character `\j' 
% Ignore it. And it seems that one should never use the command \j, as
% it bombs latex in this case. (Jan 2015: message is gone, with a trick.)
%
% Dec 2014: Also ignore the harmless latex error on the order of amsmath.
% (Jan 2015: message is gone, with a trick.)
%
% Dec 2014: I updated all packages to texlive 2014 on my laptop, many changes
% to this file, including adding etex, making it run on the laptop
% with ps2pdf, using utf8
%
% NOTE: REPLACE *ALL* PACKAGES WITH THE LATEST VERSION BEFORE RETYPESETTING!
% I HAVE NEVER MANAGED TO RETYPESET THIS BOOK AFTER 6 MONTHS WITHOUT DOING SO!  
% Well, once, in December 2008: same packages as November 2007.
% Well, twice, also in August 2009, with Kuester's MinionMath
% Well, I still use the system in June 2011, and even updated {caption} *only*
% Well, I still use the system in spring 2012, updated nothing
% Well, I still use the system in autumn 2012, updated nothing
%
% NOTE ON FILM INCLUSIONS (Dec 2014)
%
% This class uses movie15 - I am not convinced about its successor,
% media9. I am not sure that its compatibility and portability across
% different computers is better.
%
% DVIPS, Jan 2015
%
% Ignore the many messages     "dvips: Checksum mismatch ..."
% they are harmless.
% 
% May 2020 : all works with TexLive 2020 now.
%
%-----------------------------------------------------------------------------
%-----------------------------------------------------------------------------
%-----------------------------------------------------------------------------
% Notes for DEBUGGING the latex book files when running latex:
%
% -----
%
% If you get errors like ``not in outer par mode'' then you did, for example:
%
% - use \iinn with one argument instead of two
% - write \figure{} instead of \figureref{}
% 
% -----
%
% If you get spurious dots in the bibliography, you
% 
% - had a space after the ] of an \asix command
% 
% Nov 2007: from comp.text.tex
% *Never* use \edef on user input, especially not text. Try replacing the  
% \edef's in the original macros with \protected@edef.
% (I use it in fancyhead ...)
% 
% -----
%
% If you get the message "Token not allowed in a PDF string (PDFDocEncoding)"
% then add  \texorpdfstring{$\hbar$}{h} or similar in the section title
%
% -----
%
% \clearpage % use it in the text to ship out all graphics and tables  
%
%-----------------------------------------------------------------------------
%-----------------------------------------------------------------------------
%-----------------------------------------------------------------------------
% START OF CLASS FILE 
%-----------------------------------------------------------------------------
% Jan 2016 take out for xelatex - however, xelatex does not work:
%                                 not able to do microtype.
\pdfoutput=0  % MUST be uncommented, to allow for dvips instead of pdflatex.
              % This cls file is NOT designed to work WITHOUT this command.
              % This whole system is designed to use the dvi->ps->pdf path!
%-----------------------------------------------------------------------------
%-----------------------------------------------------------------------------
% DVI -> PS -> PDF
%
% There are many reasons for this path, including pstricks, corner
% films, eps figures, psfrag, microtype (!), etc.
% 
% May 2020: microtype kerning still does not work with luatex.
%
% 2015: I tried the direct pdf route the first time in Jan 2015, but there are
% dozens of issues: no green links, inverted figures, no rotated text, etc.
%
% This is a no-go. There is no way to typeset the book without the PS detour.   
%-----------------------------------------------------------------------------
%-----------------------------------------------------------------------------
% Acrobat Distiller versus ps2pdf/ghostscript
%-----------------------------------------------------------------------------
% This whole system is mainly designed to use ACROBAT DISTILLER, but
% also works with ps2pdf
%
% There are several quality reasons to use Adobe Acrobat Distiller: 
%   in-pdf ligature search (Dec 2014: still bad with ps2pdf),
%   smaller pdf files,
%   better pdf quality,
%   psfrag (Dec 2014: now works with ps2pdf as well),
%   ability to annotate pdfs (Dec 2014: now works with ps2pdf as well).
%
% BUT
% This is not a no-go.
% Since Dec 2014, this file edition works with ps2pdf on my laptop
%
% In July 2008, I had changed the film file paths: the ps 
% HAD TO be DISTILLED with Adobe Acrobat Distiller! 
% ps2pdf did not work any more (in fact, ONLY films are 
% the issue; but either ps2pdf (if the have full 
% paths) or Distiller (if they only have relative paths)
% usually bomb if not used with the correct paths.
% Dec 2014: Both should work again: ps2pdf -dNOSAFER solves this
% particular issue
%-----------------------------------------------------------------------------
% WE DEFINE THE FILM DIRECTORY HERE - Dec 2014, May 2016 

% THIS WORKS ON MY LAPTOP MACBOOK, FOR ADOBE DISTILLER (JUN 2016)
\newcommand{\filmfolder}{/Users/schiller/Desktop/Buch-Laufende-Files/Films}

% THIS WORKS ON MY LAPTOP MACBOOK, FOR ps2pdf ONLY (MAY 2016), not for Distiller
%\newcommand{\filmfolder}{Films}

% On my desktop mac:   /Users/christopschiller/Desktop/aFys-Tex6/Films
% THIS IS NEEDED ON THE DESKTOP MAC, BECAUSE DISTILLER WANTS ABOLUTE 
% FILE PATHS
% \newcommand{\filmfolder}{/Users/christophschiller/Desktop/Buch-Laufende-Files/Films}

%-----------------------------------------------------------------------------

% !.!3 Dec 2014: on my desktop mac, there is an undefined command error
% \hyperindexformat when theindex is processed; this error
% does not appear in the old latex, it seems; this patch 
\let\hyperindexformat\relax
% is harmless on the laptop, and has no effect on the desktop mac.

%-----------------------------------------------------------------------------
\def\cspageprefix#1{\relax} % (Now obsolete) wanted to add this to pagenumbers  
                            % on each of the 6 volumes, giving: I-123, II-345
                            % etc. Problem: roman is also used for chapters 
                            % titles

%-----------------------------------------------------------------------------
%-----------------------------------------------------------------------------

% ****************************************
% *          FIRST PACKAGES              *
% ****************************************     OK Jun 2011, Feb 2015

% The order of the package loading sometimes matters! (e.g. babel, index)
% The age/date of the package also matters! (e.g. caption)

%%%%%%%%%%% BASIC %%%%%%%%%%%%%%%%%
\LoadClass[a4paper,twoside,onecolumn,11pt]{book} 


%\pdfmapfile{+MinionPro.map}    % does not work in dvips route
 

%\usepackage{rerunfilecheck}    % Dec 2014: needed with etex and movie15 -
%                               % Not needed for ps2pdf
%                               % Jun 2016: not needed any more 

%\usepackage{iftex}             % Apr 2020: determines latex type 
%                               % not needed
                                
\usepackage{etex}               % Dec 2014, increases TeX (enough dimen) to 
%                               % handle my book
%                               % Also works on my desktop


%%%%%%%%%%% BOOK STRUCTURE %%%%%%%%%%%%%%%%%
\usepackage{index}               % several indices; do NOT move this around!
\usepackage{appendix}            % allows to mix chapters and appendices


%%%%%%%%%%% INPUT %%%%%%%%%%%%%%%%%
\usepackage[OT2, T1]{fontenc}    % Jan 2006: OT2 is for cyrillic in Nikola Tesla

% If you don't use \usepackage[T1]{fontenc}:
% - Words containing accented characters cannot be automatically hyphenated,
% - You cannot properly copy-and-paste such words from the output (DVI/PS/PDF),
% - Characters like the pipe sign, less than and greater sign give unexpected results in text.

\usepackage[utf8]{inputenc}      % Dec 2014  % Also works on my desktop

% \usepackage[applemac]{inputenc} % Used from Nov 2004 to Dec 2014
% \usepackage[utf8x]{inputenc}   % DO NOT USE THIS, NEVER
% \catcode165=13 \def ï½¥{\csbul}  % Input file easier to read - OUT IN JUN 2011.
% \def NOT-CHAR{\relax}          % Used to solve a problem of my editor program.


%%%%%%%%%%% TABLES %%%%%%%%%%%%%%%%%
\usepackage{colortbl}            % 
% (NO) \usepackage{tabularx}     % Dirr, July 2005, for extendible columns

\usepackage{booktabs}            % For good tables  
\usepackage{longtable,ltcaption} % The command \setlongtables is in motionmountain.tex


%%%%%%%%%%% COLOUR AND GRAPHICS %%%%%%%%%%%%%%%%%
\usepackage{colordvi}            % Defines \Color for titles
\usepackage[dvips,dvipsnames,table]{xcolor} % take out option cmyk, says Zedler 
                                            % (Dec 2008)
\usepackage{pst-plot}            % Must be here; I get trouble with my command
\usepackage{pstricks-add}        % \csd otherwise (don't know why)
\usepackage{psfrag}              % Adds Minion in eps files

% \usepackage{auto-pst-pdf}      % Tested in Jan 2015 - did not work

\usepackage{graphicx}
\DeclareGraphicsExtensions{.eps} % {,.jpg,.pdf} Since I use the dvi-ps-pdf
                                 % route; also required by movie15

\usepackage[verbose]{wrapfig}   % For small figures
\usepackage[originalparameters]{ragged2e}    % For captions of small figures

% (NO) \usepackage{subfig}      % For figures side by side

\let\bigcircle\undefined        % Both curves and minion define bigcircle 

%%%% moved to lower place Aug 2009  
%%%%\usepackage{curves,calc}    % For my flip movie  

% (NO) \usepackage{acronym}     % For abbreviations in capitals - NO, I do it myself
% (NO) \usepackage{rotating}

\usepackage{fp}                 % Added in April 2014: needed for u3d 
                                % files, must be before french babel

\usepackage[final,3D]{movie15}  % Package for films inside pdf; 3d added 
                                % in April 2014 for u3d file

% \usepackage[final]{media9}    % Newer package for films inside pdf, to 
                                % be added one day, maybe !.!3
                                % Not yet, because not so compatible


%%%%%%%%%%% PAGINATION %%%%%%%%%%%%%%%%%
% (NO) \usepackage{epigraph}    % for the (future) quotes; not needed yet

\usepackage{multicol}           % for the index

\usepackage{perpage}            % numbers footnotes on every page
\MakePerPage{footnote}

\usepackage{marginnote}         % Feb 2010: allows marginpar in footnotes

%\usepackage[sf,bf,center,clearempty,nobottomtitles,newlinetospace]{titlesec}
\usepackage{titlesec}           % Apr 2006: for titles
\usepackage{titletoc}           % Sep 2007: for several tocs

\usepackage{fancyhdr}           % for running page/column titles
\usepackage{extramarks}         % for the letter-dependent marginpars in the index
% they define \firstrightmark (is the same as \rightmark) and \lastrightmark etc.

%\usepackage[cam,a4,center,axes,pdftex]{crop}

\usepackage{floatpag}           % June 2015: allows \thisfloatpagestyle{} 
% Provides commands to apply different pagestyles to the full page floats.

\usepackage{nextpage}  % Dec 2005: defines \clearpage and \newpage variants

\def\cleardoublepage{\cleartooddpage[\thispagestyle{empty}\vspace*{\fill}%
\begin{center}\ \hbox{\href{http://www.motionmountain.net}{\csepsffile{o-logo-30}}}\ \end{center}%
\vspace*{\fill}]}

% USED AT END OF EACH PDF VOLUME - Nov 2016
\def\csfinalinnerpages{\thispagestyle{empty}\vspace*{\fill}%
\begin{center}\ \hbox{\href{http://www.motionmountain.net}{\csepsffile{o-logo-30}}}\ \end{center}%
\vspace*{\fill}\clearpage}


%%%%%%%%%%% TYPOGRAPHY %%%%%%%%%%%%%%%%%
\usepackage{textcomp}           % provides more text symbols
                                % also used for my \textthreequartersemdash

\usepackage{array}              % for mathematics

\usepackage{soulutf8}   % used in my section titles: spaces out letters
                        % soulutf8 solves the accent problems in section titles! (April 2020)
%------------------------------------------------
% This was my file soul.cfg, it is now included here
%
% define macros for logical markup
%\sodef\person{\scshape}{0.125em}{0.4583em}{0.5833em}
%\sodef\SOUL@@@versal{\upshape}{0.125em}{0.4583em}{0.5833em}
%\DeclareRobustCommand*\versal[1]{%
%\MakeUppercase{\SOUL@@@versal{#1}}%
%}
\soulregister{\numberline}{1}
\soulregister{\hl}{1}
\soulregister{\bit}{1}
\soulregister{\nb}{1}
%\soulregister{\pageref}{1}
\soulregister{\hphantom}{1}
\soulregister{\mbox}{1}
\soulregister{\caption}{1}
%\sodef\tabcapso{\usefont{T1}{lo9}{m}{sc}}{1bp}{0.25em plus.1em minus.1em}{0.25em plus.1em minus.1em}
%\sodef\tabcapso{\usefont{T1}{lsx}{mb}{sc}}{1bp}{0.25em plus.1em minus.1em}{0.25em plus.1em minus.1em}
% CS:
\sodef\tabcapso{\usefont{T1}{fmy}{m}{n}}{1bp}{0.25em plus.1em minus.1em}{0.25em plus.1em minus.1em}
\sodef\tabhead{\scshape}{0.125em}{0.4583em}{0.5833em}
%
\sodef\chapterso{\huge}{2bp}{0.4em plus.1em minus.1em}{0.4em plus.1em minus.1em}
\sodef\chaptertitleso{\scshape}{2bp}{0.33em plus.1em minus.1em}{0.33em plus.1em minus.1em}
\sodef\chapterno{\scshape}{1.25bp}{.5em plus.1em minus.1em}{0.75em plus.1em minus.1em}
\sodef\secso{\bfseries\scshape}{.125bp}{0.33em plus.1em minus.1em}{0.33em plus.1em minus.1em}
\sodef\secno{\fontseries{b}\scshape}{2bp}{.5em plus.1em minus.1em}{0.75em plus.1em minus.1em}
\sodef\subsecso{\bfseries\scshape}{.05bp}{0.33em plus.1em minus.1em}{0.33em plus.1em minus.1em}

% load the color package and set a different highlighting color
%\RequirePackage{color}
%\definecolor{lightblue}{rgb}{.90,.95,1}
%\sethlcolor{lightblue}
\definecolor{myyellow}{cmyk}{0,0,1,0}
\definecolor{mygreen}{cmyk}{.15,0,.25,0}   % 2019: this colour seems a mistake now
\sethlcolor{myyellow}
\def\SOUL@hlpreamble{%
    \setul{}{1.5ex}%
    \let\SOUL@stcolor\SOUL@hlcolor
    \SOUL@stpreamble}
%--------end of soul.cfg-------------------------

\usepackage{url}                % for url typesetting and linking, Dec 2003
\urlstyle{same}                 % so that it works also in captions
\newcommand\email{\begingroup \urlstyle{same}\Url}
\renewcommand\url{\begingroup \urlstyle{same}\Url}
% However, this definition is changed again below!

\usepackage{relsize}             % Apr 2006, used in csac to make  acronyms smaller

% Aug 2009: wasy makes lots of font problems, taken out
% \usepackage[nointegrals]{wasysym}  % July 2006, for \jupiter in Appendix, works
%                                    % nointegrals added Jan 2009 (M. Zedler)
%                                    % must be before MinionPro
% Alternative:                  
% \usepackage{marvosym}          % July 2006, for \Jupiter in Appendix, NEVER TESTED

\usepackage{xspace}              % Added June 2016, similar to \ignorespaces, by Oberdiek


%%%%%%%%%%% MORE TYPOGRAPHY: LETTRINE %%%%%%%%%%%%%%%%%
\usepackage{lettrine}           % Dec 2006: there is a strange interaction with wasysym
                                % it loads a font that I do not need
\def\csini#1#2{\lettrine{#1}{#2}{}\relax}  %  uso: \csini{F}{rom} ...\linebreak

%------------------------------------------------
%%%%% This was my file lettrine.cfg: configuration file for
%%%%% lettrine.sty; all is now included in this cls file.
%%%
%%% Uncomment lines and change the parameters' values to fit
%%% your needs (see lettrine.dtx).

\setcounter{DefaultLines}{3} % cs: height of first letter in lines
\renewcommand*{\LettrineTextFont}{\upshape} % takes the small caps out, Feb 2015

%%% These are *decimal* numbers:
\renewcommand{\DefaultLoversize}{.1}
%\renewcommand{\DefaultLraise}{0}
%\renewcommand{\DefaultLhang}{0}

%%% These are *lengths* (don't forget the unit):
%\setlength{\DefaultFindent}{0pt}
%\setlength{\DefaultNindent}{0.5em}
%\setlength{\DefaultSlope}{0mm}

%%% This is a *flag* (value=true/false):
%\LettrineImagefalse
%------------------------------------------------

% Now the configuration for lettrine.sty and minion:

%\usepackage{filecontents}        % Added Feb 2015, after asking stackexchange;
                                  % otherwise the options are not read.
                                  % May 2020: taken out, obsolete.
                                  % May 2020: still gives a warning; ignore it.
\begin{filecontents}[overwrite,nosearch]{minion.cfl}
%------------------------------------------------
% CS: This is my file `minion.cfl' for Minion Pro, it configures lettrine.
%     !!!3 It still needs further small improvements for some letters.
%------------------------------------------------

\LettrineOptionsFor{A}{lhang=0.070,findent=-0.700em,nindent=0.3em,slope=0.6em}
\LettrineOptionsFor{B}{lhang=0.110,findent=.10em,nindent=0em,slope=0em}
\LettrineOptionsFor{C}{lhang=0.070,findent=.10em,nindent=0em,slope=0em}
\LettrineOptionsFor{D}{lhang=0.110,findent=.0em,nindent=0.1em,slope=-0.4em}  % Oct 2019
%\LettrineOptionsFor{{Ä}}{lhang=0.110,findent=.10em,nindent=0em,slope=0em}
\LettrineOptionsFor{E}{lhang=0.180,findent=.10em,nindent=0em,slope=0em}
\LettrineOptionsFor{F}{lhang=0.070,findent=.10em,nindent=0em,slope=0em}
\LettrineOptionsFor{G}{lhang=0.070,findent=.10em,nindent=0em,slope=0em}
\LettrineOptionsFor{I}{lhang=0.200,findent=.10em,nindent=0em,slope=0em}
\LettrineOptionsFor{L}{lhang=0.200,findent=.10em,nindent=0em,slope=0em}
\LettrineOptionsFor{N}{lhang=0.120,findent=.10em,nindent=0em,slope=0em}
\LettrineOptionsFor{M}{lhang=0.070,findent=.10em,nindent=0em,slope=0em} % Feb
                                % 2015, reduced lhang
\LettrineOptionsFor{O}{lhang=0.110,findent=.10em,nindent=0em,slope=0em}
\LettrineOptionsFor{P}{lhang=0.200,findent=.10em,nindent=0em,slope=0em} % Jan 2018
\LettrineOptionsFor{S}{lhang=0.110,findent=.10em,nindent=0em,slope=0em}
\LettrineOptionsFor{T}{lhang=0.070,findent=.10em,nindent=0em,slope=0em}
\LettrineOptionsFor{V}{lhang=0.070,findent=.10em,nindent=-0.3em,slope=-0.40em}
\LettrineOptionsFor{W}{lhang=0.070,findent=.10em,nindent=-0.3em,slope=-0.40em}
%------------------------------------------------
\end{filecontents}
\renewcommand{\DefaultOptionsFile}{minion.cfl}


%%%%%%%%%%% MINION FONTS %%%%%%%%%%%%%%%%% 

% \usepackage{type1ec}  
% \usepackage{type1cm}
% \usepackage[fullfamily,normalsize]{MinionPro-Fontdef} % not needed, says Zedler


% Dec 08: Trick from Michael Zedler to increase word spacing
% \usepackage[fullfamily,opticals]{MinionPro-FontDef}
\Mn@AddToConfig{code:shape}{n,it,sc,ssc,scit,sscit}{
  \fontdimen2\font=1.05\fontdimen2\font  % Zedler proposed 1.1: that seems 
                                         % too large to me.
  \fontdimen4\font=0.3\fontdimen2\font   % Zedler proposed 0.24: too small 
                                         % value: gives large word distances
}

\usepackage{amsmath}            % allows {align} (is also loaded by MinionPro)
                                % Moved here in May 2020

%%%% Aug 2009
%%%%\usepackage[fullfamily,textlf,mathlf,opticals,openg,minionint,swash,fourierbb]{MinionPro}
% fourierbb added in Jan 2009, suggested by Michael Zedler; all works
  
% MinionPro Text fonts: from Jan 2009 onwards
% \usepackage[fullfamily,textlf, opticals, swash, onlytext]{MinionPro}
\let\thorn\@undefined           % Jan 2009: is redefined in minionmath.sty

% MinionMath fonts by Johannes Kuester, Jan 2009, command 1 of 2
\usepackage[extraops,textcomp,withamsmath,amssymb]{minionmath}
% Dec 2014: !!!3 gives a warning, despite correct order; also with
% withamsmath first the same warning appears

\let\arc\relax % else conflict with ``curves.sty''
\DeclareMathAccent{\arcacc}           {\mathord}  {letters}  {5}

% % Added Aug 2009
% \let\rhd\vartriangleright  %  
% \def\csrhd{\hbox to 0 pt{\hss\hbox to 13 pt{$\rhd$\hss}}}
% % Added Oct 2016
% \def\npcsrhd{\noindent \hbox to 0 pt{\hss\hbox to 13 pt{$\rhd$\hss}}}

% Added Aug 2009, to have the simpler \cal fonts, from Johannes Kuester
\DeclareMathAlphabet\mathcal{T1}{\Mn@Math@Family}{m}{sw} % Aug 2009


% Moved here in Aug 2009, taken out in May 2020, because it makes
%                         problems with \ddot and \dot (Volume II)
%                         moved it upwards again; now ok.
%\usepackage{amsmath}            % allows {align} (is also loaded by MinionPro)


% May 2020: these 2 lines compensates the moving of amsmath up again.
\def\iint{\relax}  % solves a problem in minionamsmath.sty
\def\iiint{\relax} % solves a problem in minionamsmath.sty
 
% BUT SEE HERE: https://tex.stackexchange.com/questions/545748

% MinionMath fonts by Johannes, Jan 2009, command 2 of 2, defines a few details
% \usepackage{minionamsmath}

% Moved here in Aug 2009, for minionmath
% % Minionmath, Jan 2009
\let\pi\piup % pi greco piu`bello: per Minion, Nov 2004 (dopo Minion!)
\let\upsigma\sigmaup % pi greco piu`bello: per Minion, Nov 2004 (dopo Minion!)
\let\upvarphi\varphiup % pi greco piu`bello: per Minion, Nov 2004 (dopo Minion!)
\let\upgamma\gammaup % pi greco piu`bello: per Minion, Nov 2004 (dopo Minion!)

% Added Aug 2009, for minionmath
\let\partial\partialup 

% Moved here in Aug 2009
\usepackage{curves,calc}        % for my flip corner films  

% Added Aug 2009, for minionmath: Dirac slash symbols
\def\notD{{\mkern2mu\raise.1ex\hbox{$\slash$}\mskip-10mu {\rm D}}}
\def\notd{{\mkern2mu\raise.1ex\hbox{$\slash$}\mskip-9mu \partialup}}
% used to be -10; changed to -9 in May 2012


% % this is only necessary and possible (?) when NOT using Minion: 
\ifx\figureversion\@undefined
      \def\figureversion#1{\relax}     
      \usepackage{amssymb}             
   \else\fi

\usepackage[toc,eqno,enum,bib,lineno]{tabfigures} % New in April 2020 
                                                   

% bm must be after MinionPro  
\usepackage{bm}                 % makes bold math possible using \bm{...}
\def\csbold #1{{\bm{#1}}}       % makes my old tex files compatible with \bm
    
\usepackage{pifont}             % used for the greek table in CAppendix
% Feb 2004: pifont e` vecchio; meglio usare upgreek, che definisce uppi;
% 2005: no, dicono gli esperti del Latex Stammtisch, lascia pifont.
  
% Small detail about MinionPro
  \ifx\uppi\@undefined
  \else
     \let\pi\uppi % pi greco piÃ¹ bello: per Minion, Nov 2004 (dopo Minion!)
  \fi


%%%%%%%%%%% LANGUAGES %%%%%%%%%%%%%%%%%
  
% Aug 2010, solves a latin bug
\def\addtoextraslatin#1{\relax}

\usepackage[vietnamese=nohyphenation]{hyphsubst} % May 2020

\usepackage[polutonikogreek,% defines qoppa
greek,latin,vietnamese,spanish,es-tabla,polish,french,italian,german,british]{babel} 
% Defines languages, including those of quotations.
% Must be after Minion, says Johannes Kuester, because options `french' and
% `italian' do things to the mathematics comma. Moved here in Jan
% 2009.

% Added Dec 2014, after help from stackexchange; should also work on desktop.
\def\qoppa{\begingroup\fontfamily{MinionPro-LF}\fontencoding{LGR}\selectfont\char18\endgroup}

%   uso:  \csgreekok{t~w| >emo`i da`imoni}  
\long\def\csgreek#1{\begin{otherlanguage*}%
{greek}#1\end{otherlanguage*}\citefmp{check the greek\hfil}}
\long\def\csgreekok#1{\begin{otherlanguage*}{greek}#1\end{otherlanguage*}}

%   uso:  \cscyrillic{Nikola Tesla}  
\def\cscyrillic#1{{\fontencoding{OT2}\selectfont#1}}

%%%%%%%%%%% BABEL ITALIAN BUG %%%%%%%%%%%%%%%%%

% \usepackage{icomma}  % Added in Dec 2014 to solve the 2014 
% "italian" math comma issue. (The math comma is typeset as an inverted E.)
% Do NOT move this line before babel! Leave it here!
% Feb 2015: This is not always what I want: (a,b) and (a, b) now typeset
% differently! But without icomma, it typesets an inverted E instead of the
% math comma, so it is the lesser evil...

% After loading of icomma, the comma will be typeset as a punctuation
% character, if the next input character is a space; otherwise the comma is
% treated as a decimal separator. Thus, a decimal number is to be entered as,
% for instance, 1,234 whereas the mathematical expression (x, y) is to be
% written with a space after the comma: (x, y)

% Feb 2015: this really solves the issue, which is due to bad code in
% "italian" of babel 2014:
\mathchardef\virgola=\mathcode`,
\def\virgoladecimale{{\virgola}}
%%%% This does not work in August 2017 with the new 2017 distribution
%%%% any more, so in August 2017 I added this (tex.stackexchange.com):
\AtBeginDocument{\mathcode`,=\virgola}
%%%% It now works again.


%%%%%%%%%%% MACRO HELPERS %%%%%%%%%%%%%%%%%
\usepackage{calc}
\usepackage{ifthen}
%\usepackage{multido}   % does not work with {fp}
\usepackage{ifmtarg}    % Sep 2007

%%%%%%%%%%% REFERENCES %%%%%%%%%%%%%%%%%
\usepackage{xr-hyper}   % before hyperref, as required by hyperref
\usepackage{varioref}   % for references

%%%%%%%%%%% MORE PACKAGES ARE AT THE END OF THIS FILE %%%%%%%%%%%%%%%%%
% Some packages must be there, at the end, not here.


% ****************************************
% *               FONTS                  *
% ****************************************      OK Jun 2011

% Uso:
% \textrm{...} \textsf{...} \texttt{...} \textbf{...}
% \textup{...} \textit{...} \textsc{...} \textsl{...}
% \textmd{...} (medium) 
% {\rmfamily ...} e anche \sffamily \ttfamily
% \mdseries, \bfseries \itshape \scshape \slshape
% usa \emph{....} o {\em ...\/} , mai \it!

\setlength\lineskip{1pt}
\setlength\normallineskip{1pt}
\def\baselinestretch{1}
% \clubpenalty         % 'Club line'  at bottom of page.
% \widowpenalty        % 'Widow line' at top of page.
% \displaywidowpenalty % Math display widow line.
% \predisplaypenalty   % Breaking before a math display.
% \postdisplaypenalty  % Breaking after a math display.
% \interlinepenalty    % Breaking at a line within a paragraph.
% \brokenpenalty       % Breaking after a hyphenated line.

\renewcommand\normalsize{%
   \@setfontsize\normalsize{11pt}{13pt}%
   \abovedisplayskip13pt\belowdisplayskip\abovedisplayskip
%cs   \abovedisplayshortskip\z@ \belowdisplayshortskip\abovedisplayshortskip
   \abovedisplayshortskip\z@ \belowdisplayshortskip\belowdisplayskip
   \def\@listi{\leftmargin\leftmargini
            \parsep\normalbaselineskip \partopsep0pt
            \topsep\normalbaselineskip \labelwidth13pt
            \itemsep\parsep}%
}
\normalsize % leave this command here!

\renewcommand{\scdefault}{ssc}
\renewcommand{\ttdefault}{cmtt}% not {hlst}
%\renewcommand{\rmdefault}{ptm}
%\renewcommand{\sfdefault}{lo9}
%\renewcommand{\sfdefault}{lsx}
%\renewcommand{\sfdefault}{pmy} % Myriad, old version

\renewcommand{\sfdefault}{fmy}  % Myriad, new version

% Dirr, Apr 2006:
\renewcommand\Huge{\@setfontsize\Huge{28pt}{36pt}}
\renewcommand\huge{\@setfontsize\huge{20pt}{25pt}}
\renewcommand\LARGE{\@setfontsize\LARGE{20pt}{20pt}}
\renewcommand\Large{\@setfontsize\Large{18pt}{22pt}}
\renewcommand\large{\@setfontsize\large{14pt}{18pt}}

% ****************************************
% *            COLOURS                   *
% ****************************************     OK Jun 2011

\definecolor{grayten}{cmyk}{0,0,0,0.1} 
\definecolor{graytwenty}{cmyk}{0,0,0,0.2} 
\definecolor{graythirty}{cmyk}{0,0,0,0.3}

% per le figure
\definecolor{figurebackgroundcolor}{cmyk}{0,0,0,0.05} % 5 percent gray

% per i links con hyperref
%\definecolor{csbaslicolor}{cmyk}{0.92,0,0.59,0.25}   % this is PineGreen
%\definecolor{csbaslicolor}{cmyk}{0.83,0.4,0.12,0.02} % Blaue Idee von Britta 
                                                      % (version 18)
%\definecolor{csbaslicolor}{cmyk}{0.5, 0, 1, 0.1}     % Green1 Dirr
\definecolor{csbaslicolor}{cmyk}{1, 0, 0.99979, 0}    % Green2 Dirr

\definecolor{cslinkcolor}{named}{csbaslicolor}
\definecolor{cscitecolor}{named}{csbaslicolor}
\definecolor{csfilecolor}{named}{csbaslicolor}
\definecolor{csurlcolor}{named}{csbaslicolor}
\definecolor{csmenucolor}{named}{csbaslicolor}
\definecolor{cspagecolor}{named}{csbaslicolor}

% per i miei titoli:
\def\cssectioncolour#1{\Color{0.1 1.0 0.8 0.0}{#1}}   % HKS15
\def\cssectioncolourh{\Color{0.1 1.0 0.8 0.0}}
\definecolor{CSBlue}{cmyk}{0.1,1.0,0.8,0.0}
% \def\cssectioncolour#1{\Color{0.35 1.0 0.65 0.0}{#1}}  % Christophrot
% \def\cssectioncolourh{\Color{0.35 1.0 0.65 0.0}}
% \definecolor{CSBlue}{cmyk}{0.35,1.0,0.65,0.0}
% \def\cssectioncolour#1{\Color{0.25 0.65 0.32 0.12}{#1}}   % Brittablassrot
% \def\cssectioncolourh{\Color{0.25 0.65 0.32 0.12}}
% \definecolor{CSBlue}{cmyk}{0.25,0.65,0.32,0.12}
% \def\cssectioncolour#1{\Color{0.0 0.13 0.63 0.00}{#1}}   % Brittagelb
% \def\cssectioncolourh{\Color{0.0 0.13 0.63 0.00}}
% \definecolor{CSBlue}{cmyk}{0.0,0.13,0.63,0.00}

% per le tavole
\definecolor{hks15}{cmyk}{0.1,1.0,0.8,0.0}  
%\definecolor{hks15}{cmyk}{0.25,0.65,0.32,0.12}   % Brittablassrot
%\definecolor{hks15}{cmyk}{0.0,0.13,0.63,0.00}    % Brittagelb
%\definecolor{hks15-2}{cmyk}{0.015,0.05,0.035,0.0}
\colorlet{hks15-3}{hks15!10}
\colorlet{hks15-2}{hks15!80}

\definecolor{greylight}{cmyk}{0.0,0.0,0.0,0.07}   % for the row background

% per i challenge non risolti
\definecolor{cschallgraycolor}{named}{graythirty}

% ****************************************
% *             ACRONYMS                 *
% ****************************************      OK Jun 2011

\def\csac#1{\textsmaller{#1}} % only in text

\def\csaciin#1{\textsmaller{#1}\index{#1@\textsmaller{#1}}} % also in index

\def\bce{{\scshape{bce}}} 

% ****************************************
% *            PAGE LAYOUT               *
% ****************************************     OK Jun 2011
%
% SIDE MARGINS:
\setlength\oddsidemargin{25mm}
\setlength\evensidemargin{25mm}
\setlength\marginparwidth{6pc}
\setlength\marginparsep{1em}
\setlength\marginparpush{0pt}
% VERTICAL SPACING:
% \topskip = 10pt % standard
\setlength\topmargin{25mm-1in}
\setlength\headheight{\baselineskip}
\setlength\headsep{1.5\baselineskip}
\setlength\footskip{2\baselineskip}
% DIMENSION OF TEXT:
\setlength\paperwidth{210mm}
\setlength\paperheight{297mm}
\setlength\textwidth{32pc}   % that is around 134.96 mm = 32 * 4.2175 mm
% (Note: postscript uses 1pc= 4.233333 mm , thus 32 pc would be 135.47 mm)
\setlength\textheight{45\baselineskip+\topskip}
\setlength\columnsep{13pt}
\setlength\columnseprule{0mm}

% % From Donald Arseneau
% % he says this gives almost never widows.
% \raggedbottom  % no consequences for movies
% \setlength{\topskip}{1\topskip plus 5pt}
% \widowpenalty=9999
% \clubpenalty=9999

% From my first Minion edition:
% \partopsep 3\p@ plus\p@ minus 2\p@
% 
% \@lowpenalty   51 \@medpenalty  151 \@highpenalty 301
% \@beginparpenalty -\@lowpenalty
% \@endparpenalty   -\@lowpenalty
% \@itempenalty     -\@lowpenalty
% 
% \arraycolsep 2\p@ \tabcolsep 6\p@ \arrayrulewidth .4\p@
% \jot = 3pt    % Extra space added between lines of an eqnarray environment
% \doublerulesep 2\p@ \tabbingsep \labelsep \skip\@mpfootins = \skip\footins
% \fboxsep = 3\p@ \fboxrule = .4\p@

% FRAMEBOX
\setlength\fboxsep{1mm}
\setlength\fboxrule{.15mm}

% New in August 2016: to place the "titolo interiore"
\def\cspatrick\relax
\def\cspbtrick\relax


% ****************************************
% *           PARAGRAPHING               *
% ****************************************     OK Jun 2011
%
\setlength\bigskipamount{13pt}
\setlength\normalbaselineskip{13pt}
\setlength\parindent{13pt}
\setlength\parskip{0pt}
\newcommand\Indent{\hspace*{13pt}}
\newcommand\UnIndent{\hspace*{-13pt}}

\def\normalparindent{\parindent 13pt}     
\def\zeroparindent{\parindent \z@}

% This is better than sloppy:
\tolerance 1414
\hbadness 1414
\emergencystretch 1.5em
\hfuzz 0.3pt % default is 0.1pt ; this only changes the reporting

% \vfuzz \hfuzz % NOT YET 
% \raggedbottom % NOT!


% ****************************************
% *           MARGINPAR                  *
% ****************************************     OK Jun 2011, Feb 2015

% Dirr: marginpars are normally on the left/outside:

% \@mparswitchfalse\reversemarginpar
\@mparswitchfalse\normalmarginpar  


% ****************************************
% *        COUNTERS                      *
% ****************************************     OK Jun 2011

%  \@removefromreset{FOO}{BAR} : Removes counter FOO from the list of 
%                       counters \cl@BAR to be reset when counter bar 
%                       is stepped.  The opposite of \@addtoreset.
%  Donald Arseneau                         asnd@reg.triumf.ca

\def\@removefromreset#1#2{\let\@tempb\@elt 
   \def\@tempa#1{@&#1}\expandafter\let\csname @*#1*\endcsname\@tempa
   \def\@elt##1{\expandafter\ifx\csname @*##1*\endcsname\@tempa\else
         \noexpand\@elt{##1}\fi}%
   \expandafter\edef\csname cl@#2\endcsname{\csname cl@#2\endcsname}%
   \let\@elt\@tempb 
   \expandafter\let\csname @*#1*\endcsname\@undefined}

\@removefromreset{equation}{part}
\@removefromreset{equation}{chapter}
\@removefromreset{section}{part}
\@removefromreset{section}{chapter}

% Corrects a lacking feature of appendix (Oct 2007)
% A new counter to track the first sub-division
\newcounter{@ppsave@sec}
% Modified versions of the save and restore macros 
% from the appendix package
\renewcommand{\@ppsavesec}{%
  \if@chapter@pp
    \setcounter{@ppsavesec}{\value{chapter}}
    \setcounter{@ppsave@sec}{\value{section}}
  \else
    \setcounter{@ppsavesec}{\value{section}}
    \setcounter{@ppsave@sec}{\value{subsection}}
  \fi
}

\renewcommand{\@pprestoresec}{%
  \if@chapter@pp
    \setcounter{chapter}{\value{@ppsavesec}}
    \setcounter{section}{\value{@ppsave@sec}}
  \else
    \setcounter{section}{\value{@ppsavesec}}
    \setcounter{subsection}{\value{@ppsave@sec}}
  \fi
}

% Aug 2009
\def\csnumbertext#1{\@csnumbertext{\@nameuse{c@#1}}}
\def\@csnumbertext#1{\ifcase#1\or First Volume\or Second Volume\or Third Volume\or 
             Fourth Volume\or Fifth Volume\or Sixth Volume\else Umpth Volume\fi}

\def\thepart{\csnumbertext{part}}
\def\thechapter {\arabic{chapter}}             %cs
\def\thesection {\relax}           %cs - changed in Dec 2008
\setcounter{secnumdepth}{0}  % decide quali livelli sono numerati % Dec 2008
      % -1: nessuno, 0: solo capitoli, 1: anche le section ecc.

% The solutions to my challenges in the solution appendix:
%
% Use: \sol{ahgj}The solution is ...      % Leave no blank after the "}" 
% New use: \sol{ahgj} The solution is ... % Since Jun 2016, also allowed with blank
%
% Sep 2005, impr. Jun 2011: \hbox added, reduced 0.5 em to 0.4 em, 
%           moved hypertarget ``up'' to make the pdf behave properly
% Jun 2011: label instead of hypertarget does not work
\def\sol#1{\smallskip\noindent\small\hbox to 0 pt{\hss\vbox to 0 
pt{\vss\hbox to 0 pt{\hypertarget{sol:#1}{\strut}}\vspace*{10mm}\hbox to 0
  pt{}}}% 
% the following is the second argument to hypertarget
{\hbox{{\footnotesize{\figureversion{tabular}\sffamily\bfseries Challenge%
\kern 0.3em\ref{c:#1}}},\kern 0.4em\small page\kern
0.3em\figureversion{tabular}%
\pageref{c:#1}:\kern 0.3em}}%
%
\addtocounter{cschallengesolved}{1}%
\figureversion{proportional}\ignorespaces}% \ignorespaces added Jun 2016


% ****************************************
% *         (SUB)SECTIONS                *
% ****************************************     OK Jun 2011

%  uso:        \section[Title]{Title\footnote{Something}}
  
\newcommand{\secformat}[1]{\parbox[t]{\linewidth-0.0em}{%
    %\fontsize{14pt}{18pt}
    \large\selectfont
    \filright\textcolor{hks15}{\lowercase{\secso{#1}}}}}
\titleformat{\section}[hang]
   {\filright}
   {}
%    {\color{hks15}%                        % out in Dec 2008
%     \hbox to 1.5em{\secno{\thesection}}%
%     \color{black}}
%    {.5em}
   {}
   {\secformat}
\titlespacing*{\section}{0pt}{26pt}{13pt}
  
\newcommand{\subsecformat}[1]{\parbox[b]{\linewidth}{% !!!3 tried b in Jan 
                                                     % 2011, seems ok
    \normalsize\selectfont
    \filright\textcolor{hks15}{\textsc{#1}}}}%
%     \fontsize{12bp}{15bp}\selectfont % Dirr original, reduced by me
%     \filright\textcolor{hks15}{\subsecso{#1}}}}
\titleformat{\subsection}[hang]
   {\filright}
   {}
   {}
   {\subsecformat}
\titlespacing*{\subsection}{0pt}{13pt}{6.5pt} 

%cs \def\@seccntformat#1{\csname the#1\endcsname\quad}  % form latex.ltx


% ****************************************
% *        PARTS                         *
% ****************************************     OK Jun 2011
    
\def\partfigure[#1]#2{%
\gdef\partlabel{#2}% added the % in Nov 2010
\gdef\partfigurefile{\csepsffile[#1]{#2}}}

\def\partsubtitle#1{\gdef\partsubtitletext{#1}}

\newlength\csparthelplen
   
% uso:    \part{Title\\Subtitle\\Subtitle2} oppure (VECCHIO) \part*{Appendix}
% oppure: \part[Title\\Subtitle for toc]{Title\\Subtitle\\Subtitle2}
%
\long\def\part{%\thispagestyle{empty} % 2019: corrected this error - taken out
%                now the last page of the toc has the correct running title
\null\vfil \secdef\@part\@spart}
    
% Nov 2014: ``part'' is a tabular with left a column of 25 mm white space, 
%                                  and right a column with 107 mm
%
\long\def\@part[#1]#2{\refstepcounter{part}       % used for each volume
%   \addcontentsline{toc}{part}{\protect\numberline{\thepart}#1}%cs
   \addcontentsline{toc}{part}{#1}%cs Jan 2015
%                    This change just improves the pdfbookmark: takes
%                    a spurious blank out; no effect on the book itself
   \markboth{}{}%
%
   \newpage\pagestyle{nomovieheadings} % da non togliere, Nov 2014 qui
%   \vskip 5mm 
   \ \parindent 0mm\par\noindent%  First we have one free line
%
   \settowidth{\csparthelplen}{\hbox{\large\selectfont{\sc\thepart}}}%
%   
%  % 2019: 107mm is too small for vol 5, textwidth is too narrow
   \begin{tabular*}{150mm}{@{}r@{\extracolsep{\fill}}p{120mm}@{}}%
%\typeout{--------------------------------------------------------}
\typeout{ }
\typeout{CS: Ignore this Overfull hbox:}
%\typeout{--------------------------------------------------------}
%\typeout{ }
   %
   % Here comes left: nothing (but with a width of 25 mm); right: my PART FIGURE
   %
   \hbox to 25mm{\hss\hbox{\large\selectfont{\sc\thepart}}\hskip 4mm\ }
   & 
   \ \partfigurefile\label{\partlabel}\\
   %   
   \vspace*{9 mm} \   &   \\  % A free line in between
   %
   % April 2005: tested with many \ \ \ after the \indent: but it looks awful
   %
   % Here comes the TITLE of the PART
   \  & %
   {\def\cscscstrick{\baselineskip 0.3ex\parindent 0mm\par\vskip 5mm\parindent
                            % Mar 2010 changed from 6 mm to 5 mm ^
   0mm\par\noindent\leavevmode\noindent\ignorespaces\nobreak}\let\\\cscscstrick
   \textcolor{hks15}{\huge\selectfont\textsc{{#2}}}}\\ % May 2017: huge
   %
   \vspace*{18 mm} \   &   \\ % Another, double free line in between
   %
   % Here comes left: nothing (25 mm wide); right: my ``SUMMARY POEM''
   %
   \hbox to 25mm{\hss\hbox to 
    \csparthelplen{\hss%\csepsffile[scale=0.35]{i-chaptertit-refl-best}%
    }\hskip 4mm\ }
   & % 
   %\renewcommand{\baselinestretch}{2.2}% does not work: used this:
   %
   % This has a bug: it works only if every line has ``underlinge''!
   {\def\cscscstrick{\baselineskip 0.3ex\parindent 0mm\par\vskip 1mm\parindent
   0mm\par\noindent\leavevmode\noindent\ignorespaces\nobreak}\let\\\cscscstrick
   \partsubtitletext} 
   \\
   %
   \end{tabular*}
   \normalsize
   \vfill%
   \vskip 1 mm % 
   \normalparindent
   % qui da Nov 2014:
   \thispagestyle{empty}
   \selectlanguage{british} % April 2011, for security
   \figureversion{proportional} % for MinionPro
   \newpage%
   }


% ****************************************
% *        APPENDIX                      *
% ****************************************     OK Jun 2011
%
%      cambia gli effetti di \chapter per le appendici
%      uso: \begin{appendix}, seguito da \chapter{....}


% ****************************************
% *        CHAPTERS                      *
% ****************************************     OK Jun 2011
     
\def\@chapapp{Chapter}
%\edef\@chapapphelp{Ch\protect\soulomit{\protect\kern.075em a\protect\kern.075em}pter}
%\def\@chapapphelp{Chapter} % The above was for an old version, not version 22
% Last command out in Jan 2015; not used anywhere

% These must remain in here: (to get clearpage instead of cleadoublepage)

\renewcommand\chapter{\clearpage\thispagestyle{plain} 
  \global\@topnum\z@
     \@afterindentfalse \secdef\@chapter\@schapter}     

\def\@chapter[#1]#2{%            % usato per i capitoli e le appendici
  \refstepcounter{chapter}%
  \addcontentsline{toc}{chapter}{%
      \protect\numberline{\thechapter}#1}%
      % Jan 2015 I took the chapapp out altogether - no "chapter" in 
      % pdf bookmarks
  \@makechapterhead{#2}\@afterheading}
  
% (2) uso \chapter*{..}     per i due indici - non funziona piu` (Dic 2008)
\def\@schapter#1{%               
  \addcontentsline{toc}{chapter}{#1}%
  \mark{{#1}{#1}} 
  \@makeschapterhead{#1}\@afterheading}
   
% The following overwrites the chapter* --- chapter* does not work anymore
\newcommand{\chapterformat}[1]{%
    \put(0,26){%
        \makebox(0,0)[lb]{%
%            \color{hks15-1}%
            \uppercase{\chapterno\@chapapp}\  % this is the red title word
            \chapterno{\thechapter}
%            \color{black}
}}
    \put(0,13){%
        \parbox[t]{\linewidth}{%
            \color{hks15}%
            \huge\filright\uppercase{\chapterso{#1}}
            \color{black}}}}
%\newcommand{\chaptertitleformat}[1]{\uppercase{\chaptertitleso{#1}}}
\titleformat{\chapter}[block]
    {\begin{picture}(134,60)}
    {\put(-5,0){% original: -15,0 % right end: 384,0
	\makebox(0,0)[rb]{\href{http://www.motionmountain.net}{\csepsffile[scale=0.7]{i-chaptertit-refl-best}}}}
	} {0pt} {\chapterformat} [\end{picture}]
\titlespacing*{\chapter}{0pt}{0pt}{64pt}  % changed by CS to more than 52pt, for 3 line 
                                          % titles! Dec 2008 

% Dec 2008: I now use \chapter in the text and in the appendix, and \stchapter
% for biblio and indices

% New in Dec 2008, because chapter* does not work any more
\titleclass{\stchapter}{top}[\chapter]
\newcounter{stchapter}
\newcommand{\stchapterformat}[1]{%
    \put(0,26){%
        \parbox[t]{\linewidth}{%
            \color{hks15}%
            \huge\filright\uppercase{\chapterso{#1}}
            \color{black}}}}
\titleformat{\stchapter}[block]
    {\begin{picture}(134,60)}
    {\put(-5,12){% corrected in Sep 2019 (was -5,0) % original: -15,0 % right end: 384,0
	\makebox(0,0)[rb]{\href{http://www.motionmountain.net}{\csepsffile[scale=0.7]{i-chaptertit-refl-best}}}}
    }
    {0pt}
    {\stchapterformat}
    [\end{picture}]
\titleformat{name=\stchapter,numberless}[block]
    {\begin{picture}(134,60)}
    {\put(-5,12){% corrected in Sep 2019 (was -5,0) % original: -15,0 % right end: 384,0
	\makebox(0,0)[rb]{\href{http://www.motionmountain.net}{\csepsffile[scale=0.7]{i-chaptertit-refl-best}}}}
    }
    {0pt}
    {\stchapterformat}
    [\end{picture}]
\titlespacing*{\stchapter}{0pt}{0pt}{52pt}
\titlespacing{name=\stchapter,numberless}{0pt}{0pt}{52pt}
\newcommand{\stchapterbreak}{\clearpage}  % titlesec default is 
                                          % cleardoublepage

% nota: \@afterhead e` in latex.ltx e non aggiunge spazi  


% ****************************************
% *         PARAGRAPH                    *
% ****************************************     OK Jun 2011
%
% per foreword & afterword, appare nelle prefazioni

\def\paragraph{%
\thispagestyle{plain}% Aug 2005
\@startsection{paragraph}{4}{\z@}{-3.5ex plus -1ex minus
-.2ex}{2.3ex plus 
.2ex}{\noindent\reset@font\scshape\cssectioncolourh}}


% ****************************************
% *                LISTS                 *
% ****************************************     OK Jun 2011
%
% ITEMIZE (Dirr)
   
\def\csbullet{\leavevmode\cssectioncolour{\rule[0.14em]{0.24em}{0.24em}}\kern
0.33em} % my coloured rule (not a bullet any more)

\newenvironment{Strich}{\begin{list}{\textthreequartersemdash}{%
\labelwidth 9pt % from 9pt, on Sep 2009
\labelsep 6pt 
\leftmargin 15pt %cs
\rightmargin0pt \parsep0pt \topsep0pt
\partopsep 7pt % cs 
\listparindent 13pt % cs 
\itemsep0pt
\def\makelabel##1{##1\hss}}\normalfont}{\end{list}}

% CURIOSITY (Dirr)
% Use: to start without two stars in the first line, do the following:
% \begin{curiosity}
%      \itemÆ’[] Is there ...

\newenvironment{curiosity}{%
    \begin{list}{%
        {\hbox to\linewidth{\hfill\raisebox{5.9pt}[0pt][0pt]{% CS 0 to 4, Jan 
                                                             % 2010: to 5.9
% Aug 2009: my new double stars:
            \textcolor{black}{{\normalsize $*\,*$}}%   
	    %
	    }\hfill}}%
               }%
    {\labelwidth0pt \labelsep0pt \leftmargin0pt \rightmargin0pt \parsep0pt
    \topsep0pt \partopsep13pt 
    \listparindent0pt % Dirr
    \listparindent 13pt % cs
    \itemsep13pt
    \def\makelabel##1{##1\hss}}\normalfont}{\end{list}}

	
% ****************************************
% *            QUOTATIONS                *
% ****************************************     OK May 2020

% uso: \begin{quotation} Gia` Ulisse disse ... \end{quotation}

\def\quotation{\list{}{\listparindent 13pt     %cs Sept 2009, was 1.5 em
    \itemindent\listparindent
    \rightmargin\leftmargin\parsep \z@ plus\p@}\item[]}
\let\endquotation=\endlist

% Added Aug 2009
\let\rhd\vartriangleright  %  
\def\csrhd{\hbox to 0 pt{\hss\hbox to 13 pt{$\rhd$\hss}}}
% Added Oct 2016
\def\npcsrhd{\noindent \hbox to 0 pt{\hss\hbox to 13 pt{$\rhd$\hss}}}


% ****************************************
% *                QUOTES                *
% ****************************************     OK Jun 2011
% For epigraphs above and below sections
% uso: \begin{quote} Text \\ Author \end{quote} e simili

\newlength\csquotelen
\setlength\csquotelen{62.75mm} % is ok (Apr 2006)
% 65 is around 3 mm too much
% 62 is half an n to little
% 62.6 is on n-leg thickness too little
\newsavebox\csleftquoteb
\newsavebox\csrightquoteb

\sbox{\csleftquoteb}{\makebox[0pt][r]{\raisebox{-27pt}[0pt][0pt]%
{{\bfseries\fontsize{48pt}{48pt}\usefont{T1}{MinionPro-TLF}{b}{n}\selectfont\textcolor{grayten}{``}}}}}
% \sbox{\csrightquoteb}{\makebox[0pt][l]{\raisebox{-27pt}[0pt][0pt]% 
\sbox{\csrightquoteb}{\makebox[0pt][l]{\raisebox{-27pt}[0pt][0pt]% 2010  (OK)  may 2010
{{\bfseries\fontsize{48pt}{48pt}\usefont{T1}{MinionPro-TLF}{b}{n}\selectfont\textcolor{grayten}{''}}}}}

% Apr 2006, Dirr
\renewenvironment{quote}{\samepage
    \gdef\csquotenotehelp{\relax}% cs
    \begin{list}{}{%
        \setlength{\leftmargin}{.5\linewidth}\setlength{\rightmargin}{18pt}%
        \setlength{\topsep}{0pt}\setlength{\partopsep}{0pt}%
        \setlength{\parskip}{0pt}\setlength{\parsep}{0pt}%
        \setlength{\itemsep}{0pt}\setlength{\listparindent}{13pt}%
                  }%
    \item[]%\makebox[0pt][r]{\raisebox{-24pt}[0pt][0pt]{%
           % \bfseries\fontsize{48pt}{48pt}\selectfont\textcolor{grayten}{``}}}%
% next lines commented out in Feb 2010    
%   \def\strutdepth{\dp\strutbox}% dal TeXbook, pagina 316
%     \def\citefmp##1{% if I do not redefine this, I get many floats lost
%         \strut\vadjust{\kern-\strutdepth\vtop to
%             \strutdepth{\baselineskip\strutdepth\vss%
%             \llap{%
%               \scriptsize\sf##1\ \ \ \ \ \hspace*{\csquotelen}\hspace*{\columnsep}}%
%             \null}}%
%         }%
    \begin{minipage}{\linewidth}
    \footnotesize%   
    \selectfont\raggedright\ignorespaces%
    \long\def\footnote##1{\footnotemark{}\gdef\csquotenotehelp{\footnotetext{##1}}}% cs
    \def\\{\hfill\hfill\usebox{\csrightquoteb}\par\noindent\leavevmode\raggedleft}% cs, May 2010 
    \usebox{\csleftquoteb}\ignorespaces%
    }%
    {\end{minipage}% cs, May 2010
%     \unskip\makebox[0pt][l]{\raisebox{-24pt}[0pt][0pt]{\bfseries%
%             \fontsize{48pt}{48pt}\selectfont\textcolor{grayten}{''}}}%
    \end{list}\selectlanguage{british}% language added June 2011
    \csquotenotehelp% cs
    \vspace{.5\baselineskip}\noindent\ignorespaces\@afterheading%
    }

\newenvironment{widerquote}{\samepage  % just .45 instead of .5
    \gdef\csquotenotehelp{\relax}% cs
    \begin{list}{}{%
        \setlength{\leftmargin}{.45\linewidth}\setlength{\rightmargin}{18pt}%
        \setlength{\topsep}{0pt}\setlength{\partopsep}{0pt}%
        \setlength{\parskip}{0pt}\setlength{\parsep}{0pt}%
        \setlength{\itemsep}{0pt}\setlength{\listparindent}{13pt}%
                  }%
    \item[]%
    \begin{minipage}{\linewidth}
    \footnotesize%   
    \selectfont\raggedright\ignorespaces%
    \long\def\footnote##1{\footnotemark{}\gdef\csquotenotehelp{\footnotetext{##1}}}% cs
    \def\\{\hfill\hfill\usebox{\csrightquoteb}\par\noindent\leavevmode\raggedleft}% cs, May 2010 
    \usebox{\csleftquoteb}\ignorespaces%
    }%
    {\end{minipage}% cs, May 2010
    \end{list}\selectlanguage{british}% language added June 2011
    \csquotenotehelp% cs
    \vspace{.5\baselineskip}\noindent\ignorespaces\@afterheading%
    }
  
\newenvironment{reallywiderquote}{\samepage  % just .2 instead of .5
    \gdef\csquotenotehelp{\relax}% cs
    \begin{list}{}{%
        \setlength{\leftmargin}{.2\linewidth}\setlength{\rightmargin}{18pt}%
        \setlength{\topsep}{0pt}\setlength{\partopsep}{0pt}%
        \setlength{\parskip}{0pt}\setlength{\parsep}{0pt}%
        \setlength{\itemsep}{0pt}\setlength{\listparindent}{13pt}%
                  }%
    \item[]%
    \begin{minipage}{\linewidth}
    \footnotesize%   
    \selectfont\raggedright\ignorespaces%
    \long\def\footnote##1{\footnotemark{}\gdef\csquotenotehelp{\footnotetext{##1}}}% cs
    \def\\{\hfill\hfill\usebox{\csrightquoteb}\par\noindent\leavevmode\raggedleft}% cs, May 2010 
    % !!!2 I need more blank at the left of the author after the quote (see p. 80 of vol 6)
    % !!!2 I need 1pt more horizontal space before the author name
    \usebox{\csleftquoteb}\ignorespaces%
    }%
    {\end{minipage}% cs, May 2010
    \end{list}\selectlanguage{british}% language added June 2011
    \csquotenotehelp% cs
    \vspace{.5\baselineskip}\noindent\ignorespaces\@afterheading%
    }
    
\newenvironment{quoteunder}{\samepage\medskip % quote after text, instead of after title
    \gdef\csquotenotehelp{\relax}% cs
    \begin{list}{}{%
        \setlength{\leftmargin}{.5\linewidth}\setlength{\rightmargin}{18pt}%
        \setlength{\topsep}{0pt}\setlength{\partopsep}{0pt}%
        \setlength{\parskip}{0pt}\setlength{\parsep}{0pt}%
        \setlength{\itemsep}{0pt}\setlength{\listparindent}{13pt}%
                  }%
    \item[]%
    \begin{minipage}{\linewidth}
    \footnotesize%   
    \selectfont\raggedright\ignorespaces%
    \long\def\footnote##1{\footnotemark{}\gdef\csquotenotehelp{\footnotetext{##1}}}% cs
    \def\\{\hfill\hfill\usebox{\csrightquoteb}\par\noindent\leavevmode\raggedleft}% cs, May 2010 
    \usebox{\csleftquoteb}\ignorespaces%
    }%
    {\end{minipage}% cs, May 2010
%     \unskip\makebox[0pt][l]{\raisebox{-24pt}[0pt][0pt]{\bfseries%
%             \fontsize{48pt}{48pt}\selectfont\textcolor{grayten}{''}}}%
    \end{list}\selectlanguage{british}% language added June 2011
    \csquotenotehelp% cs
    \vspace{.5\baselineskip}%\noindent\ignorespaces\@afterheading%
    }
 
\newenvironment{widerquoteunder}{\samepage\medskip  % just .45 instead of .5
    \gdef\csquotenotehelp{\relax}% cs
    \begin{list}{}{%
        \setlength{\leftmargin}{.45\linewidth}\setlength{\rightmargin}{18pt}%
        \setlength{\topsep}{0pt}\setlength{\partopsep}{0pt}%
        \setlength{\parskip}{0pt}\setlength{\parsep}{0pt}%
        \setlength{\itemsep}{0pt}\setlength{\listparindent}{13pt}%
                  }%
    \item[]%
    \begin{minipage}{\linewidth}
    \footnotesize%   
    \selectfont\raggedright\ignorespaces%
    \long\def\footnote##1{\footnotemark{}\gdef\csquotenotehelp{\footnotetext{##1}}}% cs
    \def\\{\hfill\hfill\usebox{\csrightquoteb}\par\noindent\leavevmode\raggedleft}% cs, May 2010 
    \usebox{\csleftquoteb}\ignorespaces%
    }%
    {\end{minipage}% cs, May 2010
    \end{list}\selectlanguage{british}% language added June 2011
    \csquotenotehelp% cs
    \vspace{.5\baselineskip}\noindent\ignorespaces\@afterheading%
    }

\newenvironment{reallywiderquoteunder}{\samepage\medskip  % just .2 instead of .5
    \gdef\csquotenotehelp{\relax}% cs
    \begin{list}{}{%
        \setlength{\leftmargin}{.2\linewidth}\setlength{\rightmargin}{18pt}%
        \setlength{\topsep}{0pt}\setlength{\partopsep}{0pt}%
        \setlength{\parskip}{0pt}\setlength{\parsep}{0pt}%
        \setlength{\itemsep}{0pt}\setlength{\listparindent}{13pt}%
                  }%
    \item[]%
    \begin{minipage}{\linewidth}
    \footnotesize%   
    \selectfont\raggedright\ignorespaces%
    \long\def\footnote##1{\footnotemark{}\gdef\csquotenotehelp{\footnotetext{##1}}}% cs
    \def\\{\hfill\hfill\usebox{\csrightquoteb}\par\noindent\leavevmode\raggedleft}% cs, May 2010 
    \usebox{\csleftquoteb}\ignorespaces%
    }%
    {\end{minipage}% cs, May 2010
    \end{list}\selectlanguage{british}% language added June 2011
    \csquotenotehelp% cs
    \vspace{.5\baselineskip}\noindent\ignorespaces\@afterheading%
    }

	
% ****************************************
% *          ARRAY and TABULAR           *
% ****************************************     OK Jun 2011, Feb 2015

\def\cstabhlinedown{\rule[-1.5ex]{0mm}{2ex}} % lo spazio sopra e sotto \hline
\def\cstabhlineup{\rule{0mm}{3.5ex}}
\def\cstabhlineshift{\rule{0mm}{0.5ex}}

\def\dirrtabular{%
\rowcolors{1}{white}{greylight}\arrayrulecolor{hks15}%
\setlength{\tabcolsep}{0.5mm}\setlength{\extrarowheight}{2bp}}

\def\dirrtabularnolines{\arrayrulecolor{hks15}%
\setlength{\tabcolsep}{0.5mm}\setlength{\extrarowheight}{2bp}}

\def\dirrtabularstar{%
\rowcolors{1}{white}{greylight}\arrayrulecolor{hks15}%
\setlength{\tabcolsep}{0.5mm}\setlength{\extrarowheight}{2bp}}

\def\dirrtabularstartwo{%
\rowcolors{3}{white}{greylight}\arrayrulecolor{hks15}%
\setlength{\tabcolsep}{0.5mm}\setlength{\extrarowheight}{2bp}}

\def\dirrtabularstarnolines{\arrayrulecolor{hks15}%
\setlength{\tabcolsep}{0.5mm}\setlength{\extrarowheight}{2bp}}

\def\dirrlongtable{%
\rowcolors{1}{white}{greylight}\arrayrulecolor{hks15}%
\setlength{\tabcolsep}{0.5mm}\setlength{\extrarowheight}{2bp}}

\def\dirrlongtabletwo{%
\rowcolors{3}{white}{greylight}\arrayrulecolor{hks15}%
\setlength{\tabcolsep}{0.5mm}\setlength{\extrarowheight}{2bp}}

\def\dirrlongtablenolines{\arrayrulecolor{hks15}%
\setlength{\tabcolsep}{0.5mm}\setlength{\extrarowheight}{2bp}}


% ****************************************
% *             EQUATIONS                *
% ****************************************

%----- \subsection{Radici} ---- 
%                     uso: \sqrt{x-1} e \cstesqrt{x-1}
%                     non usare \sqrt[n]{xxx} , ma usa { \root n \of {xxx} }
\let\oldsqrt\sqrt

\def\sqrt#1{\mathchoice  % !.!3 height -0.7 is not the same for all
                         % Aug 2005: -0.5 is ok with cmr fonts
                         % Sep 2005: -0.7 is almost ok with Minion
% 
 {\setbox0=\hbox{$\oldsqrt{\displaystyle{#1}\,}$}  \copy0
  \raise \ht0 \hbox{\vrule width 0.4 pt height -0.7 pt depth 3 pt}}
% 
 {\setbox0=\hbox{$\oldsqrt{  \textstyle{#1}\,}$}  \copy0
  \raise \ht0 \hbox{\vrule width 0.4 pt height -0.7 pt depth 3 pt}}
% 
 {\setbox0=\hbox{$\oldsqrt{\scriptstyle{#1}\,}$}  \copy0
  \raise \ht0 \hbox{\vrule width 0.4 pt height -0.7 pt depth 3 pt}}
% 
 {\setbox0=\hbox{$\oldsqrt{\scriptscriptstyle{#1}\,}$}  \copy0
  \raise \ht0 \hbox{\vrule width 0.4 pt height -0.7 pt depth 3 pt}}
}  % 4 pt is too long, says Zedler, width 0.3 pt is too thin, he says

% The square roots for certain textstyle situations are separate; the ones
% defined in \sqrt are not good.  So I added \smallsqrt in the files in such 
% situations.

% Code originally from the web, modified to ignore extra height and depth.
% Dec 2013
\def\smallsqrt{\mathpalette\DHLhksqrt}
% This is brutal: it ignores ANY extra height and depth of the smallsqrt!
\def\DHLhksqrt#1#2{\setbox0=\hbox{$#1\oldsqrt{#2\,}$}\dimen0=\ht0
\setbox3=\hbox{\smash{\hbox{$#1\oldsqrt{#2\,}$}}}%
\advance\dimen0-0.2\ht0
\setbox2=\hbox{\vrule width 0.4pt height\ht0 depth -\dimen0}%cs: negative depth!
\setbox4=\hbox{\smash{\hbox{\vrule width 0.4pt height\ht0 depth -\dimen0}}}%
{\box3\lower0.45pt\box4}}% cs: original from the web was 0.4pt

%----- \subsection{Matematica - equazioni} -----

% By Robin Fairbairns, July 2003
\renewcommand\textbraceleft{\def\@tempa{cmtt}%
  \ifx\@tempa\f@family
    \char`\{
  \else
    \PackageWarning{libro}% (invece di somepackage)
		   {\string\textbraceleft\space not in \string\sffamily}%
    \texttt{\char`\{}%
  \fi
  }

%----- \subsection{Matematica - sistemi numerici} ----

% version 22, needs amsmath, Oct 2008
\def\csoctonions{{\hbox{$\mathbb{O}$}}}
\def\csintegers{{\hbox{$\mathbb{Z}$}}}
\def\csnaturals{{\hbox{$\mathbb{N}$}}}
\def\csrationals{{\hbox{$\mathbb{Q}$}}}
\def\csreell{{\hbox{$\mathbb{R}$}}}
\def\cscomp{{\hbox{$\mathbb{C}$}}}   \let\cscompl\cscomp \let\cscomplex\cscomp
\def\csquater{{\hbox{$\mathbb{H}$}}}

\def\csmink{{\hbox{\bf M}}}
\def\cseucl{{\hbox{\bf E}}}

%----- \subsection{Altre abbreviazioni per formule} ----

\def\diffd{{\rm d}} % marzo 2002 - differenziali in roman
\def\sech{\mathop{\operator@font sech}\nolimits} % not in latex.ltx

\def\facult{!}

\let\d\partial   
\let\s\sigma
\let\r\rho 
\let\varrho\rho 
\let\phi\varphi \let\e\varepsilon    \let\epsilon\varepsilon
  
% Commented out Aug 2009
% \def\Alpha{{A}}\def\Beta{{B}}\def\Eta{{H}}\def\Zeta{{Z}}\def\Epsilon{{E}}
% \def\Iota{{I}}\def\Kappa{{K}}\def\Mu{{M}}
% \def\Nu{{N}} \def\Omicron{{O}}\def\omicron{{o}}\def\Rho{{R}}
% \def\Tau{{T}} \def\Chi{{X}}

\def\const{{\rm const}}
\def\mod{\,\hbox{mod}}
%\def\weq{{\;\widehat{=}\;}} % Nov 2007: non bello in minion
\let\weq\equiv
\let\prop\sim

\def\cssunsymbol{\hbox{\small$\odot$}} % accettabile

% March 2014
\let\csoldemptyset\emptyset 
\def\emptyset{{\raise 0.01ex\hbox{\rotatebox{20}{$\varnothing$}}}}

%----- \subsection{Macro matematici} ---- uso: evidente

\def\qhbox#1{{\quad\hbox{#1}\quad}}
\def\qqhbox#1{{\quad\quad\hbox{#1}\quad\quad}}
%cs \def\eref#1{(\ref{#1})}  % equation-ref
\def\mapr#1{\,\,\smash{\mathop{\longrightarrow}\limits^{#1}}\,\,}

\ifx\geqslant\@undefined
  \else
     \let\geq\geqslant % much nicer
  \fi
\ifx\leqslant\@undefined
  \else
     \let\leq\leqslant % much nicer
  \fi

%----- \subsection{Matrici} -----
%      uso: \csmatl{cc} a & b \\ c & d \csmatr
%           do not use array or pmatrix: they give wrong bracket spacings

\def\csmatl#1{\left(\hskip -\arraycolsep\begin{array}{{#1}}}
\def\csmatr{\end{array}\hskip -\arraycolsep\right)}  % Dec 08: added hskip to 
                                                     % simulate {pmatrix}
\def\diag{{\rm diag}}
\def\str{{\rm str}}
\def\tr{{\rm tr}}

%----- \subsection{Overline/bar} -----
% NO:
%\def\Psibar{{\Psi^{\kern-0.55em\raise0.4em\hbox to 0.6em{\hrulefill }} }}

% usa sempre \overline per i simboli matematici, non \bar
\def\psibar{{\overline\psi}} 

%---- ALIGN ------------------------ 
%     uso:
%        \begin{align} 
%           .. &= .. \non      % anche senza i `&'
%           .. &= .. \\        % qui viene messo un numero
%           l'ultima riga e`
%           .. &= .. \nonumber % senza numero
%           oppure
%           .. &= ..           % con un numero
%           e poi
%         \label{lala}          % deve essere all'interno dell'equazione !
%        \end{align}  

%----- come numerotare le equazioni: -----------------
\def\theequation{\arabic{equation}}     %cs \@addtoreset{equation}{chapter}

\def\non{\nonumber\\ \relax}
\let\te\textstyle % useful for smaller numbers in fractions


% ****************************************
% *         TABLE OF CONTENTS            *
% ****************************************

%      uso: \tableofcontentsshort    nel testo li` dove vuoi la tavola corta
%      uso: \tableofcontents         nel testo li` dove vuoi la tavola grande

%   these macros produce the content of the table of contents (.toc) file;
%   the .toc file contains a list of \contentsline
%
%   \addcontentsline{TABLE}{TYPE}{ENTRY}
%      User command for adding his own entry to a table of contents, etc.
%      It adds the entry
%         \contentsline{TYPE}{ENTRY}{page}
%      to the .TABLE file.
%
%   \addtocontents{TABLE}{TEXT} : Adds TEXT to the .TABLE file, with no
%      page number.
%
%  Note: When used in the ENTRY or TEXT of one of the above commands,
%  \protect causes the following control sequence to be written
%  on the file without being expanded.  The sequence will be expanded
%  when the table of contents entry is processed.
%
%  SURPRISE: \index and \label are no-ops inside an \addcontentsline
%  or \addtocontents command argument.  This could cause a problem if
%  the user puts an \index or \label into one of the commands he writes,
%  or into the optional "short version" argument of a \section or
%  \caption command.

% in this cls, the argument of numberline is "XI" or "A" or "First Part"
%\def\numberline#1{\hb@xt@\@tempdima{#1\hfil}}  % cs from latex.ltx

\newlength\csinttocwi
\newlength\csinttocwihelp
\newlength\csshitrepair
\setlength\@tempdima{1.5em}%

%----- \subsection{The overview contents table} -------
% 2019: still used in first 5 volumes

% per la tavola delle materie  
\def\@sCORTAchapter#1{%
  \@makesCORTAchapterhead{#1}\@afterheading}

% per la tavola delle materie  
\def\@makesCORTAchapterhead#1{\leavevmode{\parindent\z@\centering%cs
\huge\selectfont\textsc%\textcolor{hks15}
{#1}\par\nobreak\vskip 5\p@}}

% per la tavola delle materie  (is used in the 6 volumes)
\let\cscortachapterhelp\@sCORTAchapter  

%----- \subsection{The overview contents table in the full book only} -------
% 2019: not used any more since many years
%
\def\tableofcontentsshort{\clearpage\thispagestyle{plain}\normalsize
%                       
\global\@topnum\z@ \@afterindentfalse 
\@sCORTAchapter{\textcolor{hks15}{Content Overview}}% Dirr; July 2005
\small \let\protect\relax%
\pdfbookmark[0]{Content overview}{ssttoocc}
\begingroup%
\parindent 0em%
\figureversion{tabular}% for MinionPro
%
\def\l@part##1##2{\pagebreak[3] %cs #1 titolo #2 pagina; il #2 non e` stampato
  \vskip 1.5 em plus\p@                                 
  \begingroup
    \parindent \z@ \rightskip \@pnumwidth
    \leftskip 0em 
    \parfillskip -\@pnumwidth 
    \def\numberline####1{{\hbox {\textsc{####1 :}\quad}}}
    \let\newline\relax\def\\{\ -- }%
    \leavevmode
    \textsc{##1}\hfill 
    \nobreak
    \global\@nobreaktrue \everypar{\global\@nobreakfalse\everypar{}}%
  \endgroup\vskip 1em plus \p@}%
%
\def\l@chapter##1##2{\pagebreak[3]  %cs ##1 titolo ##2 pagina
  \par
  \addpenalty{-\@highpenalty} 
  \vskip 0.0em \@plus\p@  % 0.2 in Oct 2008, was 0.4 in Sep 2008
  \begingroup
    \parindent \z@ \rightskip \@pnumwidth
    \leftskip 0em  
    \parfillskip -\@pnumwidth
    \def\numberline####1{{\hbox to 
         2em{{\figureversion{tabular}\oldstylenums{####1}\ \hss}}}}% 2em in Dec 2008
    \leavevmode  
    {##1}\nobreak\hfil 
    \nobreak{\figureversion{tabular}\oldstylenums{##2}\figureversion{tabular}}\par% cs Dec 2008
    \penalty\@highpenalty
  \endgroup
  \vskip 0.1em plus \p@}%
%
\def\l@stchapter##1##2{\pagebreak[3]  %cs ##1 titolo ##2 pagina
  \par
  \addpenalty{-\@highpenalty} 
  \vskip 0.0em \@plus\p@  % Oct 2008, was 0.4 in Sep 2008
  \begingroup
    \parindent \z@ \rightskip \@pnumwidth
    \leftskip 0em 
    \parfillskip -\@pnumwidth
    \def\numberline####1{\relax}% for security only 
    \leavevmode  
    {##1}\nobreak\hfil 
    \nobreak{\figureversion{tabular}\oldstylenums{##2}\figureversion{tabular}}\par%cs
    \penalty\@highpenalty
  \endgroup
  \vskip 0.1em plus \p@}%
%
\def\l@paragraph{\@dottedtocline{1}{0em}{0em}}%cs (Preface etc.)
%
\def\@dottedtocline##1##2##3##4##5{\ifnum ##1>\c@tocdepth \else%
  \vskip \z@ plus .2\p@\leftskip 0em \rightskip 0em%
  {\hangindent ##2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
  \parindent ##2\relax\@afterindenttrue \interlinepenalty\@M  \leavevmode
  \@tempdima ##3\relax% questo e` il formato della riga :
  {\def\special####1{\relax}%contro i titoli colorati
  ##4}\hfill\hbox to\@pnumwidth{%
  \figureversion{tabular}\hfil\oldstylenums{##5}\figureversion{tabular}}\par}\fi}%
%
\def\csshort@dottedtocline##1##2##3##4##5{\relax}% this is a trick for
% simplifying the overview toc table; nothing is printed of these:
\def\l@section{\csshort@dottedtocline{1}{0em}{1.5em}}%cs Dec 2008
\def\l@subsection{\csshort@dottedtocline{2}{3.7em}{1.3em}}%cs Dec 2008
\def\l@subsubsection{\csshort@dottedtocline{3}{3.7em}{1.3em}}%cs Dec 2008
%
\makeatletter
\small\zeroparindent 
\figureversion{tabular}% % per MinionPro
\renewcommand\familydefault{MinionPro-TLF}%
\@starttoc{toc}%   Nov 2007
%\@input{\jobname.toc}%
\endgroup
\figureversion{proportional} % for MinionPro
\vfill\normalsize}

%----- \subsection{The part/partial contents table} -------

\let\csprintcontents\printcontents % prints the partial toc 

\newboolean{csfirstsss}  % true if the next subsubsection is the first
\setboolean{csfirstsss}{true}% initialization

%  \@starttoc{EXT} : Used to define \tableofcontents, \listoffigures, etc.
%      e.g., \@starttoc{lof} is used in \listoffigures.  This command reads
%      the .EXT file and sets up to write the new .EXT file.

%  \contentsline{TYPE}{ENTRY}{PAGE}
%       Macro to produce a TYPE entry in a table of contents, etc.
%       It will appear in the .TOC or other file.  For example,
%       the entry for subsection 1.4.3 in the table of contents might
%       be produced by:
%       \contentsline{subsection}{\makebox{30pt}[r]{1.4.3} Gnats and Gnus}{22}
%       The \protect command causes command sequences to be written
%       without expanding them.
%  \contentsline appears unexpanded in the .aux file, 
%                 as argument of \@writefile
%  \contentsline appears unexpanded in the .toc file
%  \contentsline is defined in latex as :
%       \def\contentsline#1{\csname l@#1\endcsname}

%  \numberline{NUMBER} : For use in a \contentsline command.
%       It puts NUMBER flushleft in a box of width \@tempdima .
%  \numberline appears unexpanded in the .aux file
%  \numberline appears unexpanded in the .toc file, 
%                 as argument of \contentsline
%  \numberline is defined in latex.tex
%       \def\numberline#1{\hbox to\@tempdima{#1\hfil}}

%  \l@TYPE{ENTRY}{PAGE}
%       Macro defined by document style for making an entry of
%       type TYPE in a table of contents, etc.
      
% \def\l@part#1#2{\pagebreak[3]                         %cs #1 titolo #2 pagina
% % \vskip 0.6em plus\p@                                 %cs il #2 non e` usato
%  \vskip 2em plus\p@                                 %cs il #2 non e` usato
%  \begingroup
%    \parindent \z@ \rightskip \@pnumwidth
%    \leftskip 0em               %cs
%    \parfillskip -\@pnumwidth
% %    \def\numberline####1{{\hbox to\csinttocwi{\textsc{####1\space Part\ :}\hss}}}
%     \def\numberline##1{{\hbox {\textsc{##1 :}\quad}}}
%     \let\newline\relax\def\\{\ -- }%
% %    \leavevmode \advance\leftskip\@tempdima \hskip -\leftskip 
%     \leavevmode
%     \textsc{#1}\hfill 
% % % %  % Taken out Sep 2008:
% % % %    \def\numberline##1{\textsc{##1\ :\ \ \ \ }} \hfil %cs
% % % %    \leavevmode %\ \hfil 
% % % %    \begin{center}{\let\newline\par 
% % % %    \textsc{#1}}\end{center}
% % % %    %\hfil%\par
% % % % %    \leavevmode \ \hfil \let\newline\par \textsc{#1} \hfil
% % % % %    \item[bbb]huhuhu\par
%    \nobreak 
%    \global\@nobreaktrue \everypar{\global\@nobreakfalse\everypar{}}%
%    \setboolean{csfirstsss}{true}%
%  \endgroup}
 
% Oct 2008, version 22: I have no part line in the part content table
\def\l@part#1#2{\relax}

% Tested and debugged in Dec 2008
\renewcommand\l@chapter[2]{%  %cs #1 titolo #2 pagina
  \par% added feb 2001 in order that it works after subsection
  \addpenalty{-\@highpenalty}% 
  \vskip 0.4em \@plus\p@
  \begingroup
    \parindent \z@ \rightskip 0em% \@pnumwidth
    \leftskip 0em  % 
    \setlength{\csinttocwihelp}{1.5 em}% this is the width PX for the chapter 
                                       % number, which is left aligned inside 
    \global\csinttocwi\csinttocwihelp
    \hangindent 4.2em  % should be pnumwidth (2.7 em) plus the number PX 
    \def\numberline##1{% this formats the chapter number
      % Dec 2008: \csinttocwi is used again for l@section, in dottedsecline
    {\hbox to \csinttocwihelp{\MakeLowercase{% for typesetting the chapter 
                                             % number ##1
     \figureversion{tabular}\oldstylenums{##1}\figureversion{tabular}}\hss}}%
    }% ##1 is either the chapter number or the appendixletter
    %
    % now comes the full chapter line:
    \leavevmode%\bfseries % out in Dec 2008
    \hb@xt@\@pnumwidth{% this formats the page number #2
    \figureversion{tabular}\oldstylenums{#2}\figureversion{tabular}%
    \hss}{\textsc{#1}}\hfil\par %cs Dec 2008: no space in between, all in 
                                % boxes, #1 has chapter number and title
    \penalty\@highpenalty
  \endgroup%
  \setboolean{csfirstsss}{true}% Dec 2008: put outside previous group
  \vskip 0.1em plus \p@}%

% Tested and debugged in Dec 2008
\newcommand\l@stchapter[2]{%  %cs #1 titolo #2 pagina
  \par% added feb 2001 in order that it works after subsection
  \addpenalty{-\@highpenalty}% 
  \vskip 0.4em \@plus\p@
  \begingroup
    \parindent \z@ \rightskip 0em % \@pnumwidth
    \leftskip 0em 
    %\parfillskip -\@pnumwidth
    \def\numberline##1{\relax}% for security
    \leavevmode %\bfseries % out in Dec 2008
%    \textsc{#1}\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss {#2}}\par % cs
    \hb@xt@\@pnumwidth{%
    \figureversion{tabular}\oldstylenums{#2}\figureversion{tabular}%
    \hss}{\textsc{#1}}\hfil\par % cs
    \penalty\@highpenalty
  \endgroup%
  \setboolean{csfirstsss}{true}% Dec 2008: put outside previous group
  \vskip 0.1em plus \p@}%

\def\l@section{\setboolean{csfirstsss}{true}\@dottedsectocline{1}{0em}{0em\bfseries}}%cs
% the second em value is the left indent after the page number

\def\l@subsection{\cs@dottedtocline{2}{5.4em}{2em}}  %Sep 2009
% DEC 2008: 4.7

% \def\l@subsubsection{\cs@dottedtocline{3}{4.7em}{1.3em}}  % out in Dec 
% 2008, no subsubs in my text any more

\def\l@paragraph{\@dottedtocline{1}{0em}{0em}}        %cs
% per preface

% \@dottedtocline{LEVEL}{INDENT}{NUMWIDTH}{TITLE}{PAGE} :
%   Macro to produce a table of contents line with the following
%   parameters:
%     LEVEL    : If LEVEL > \c@tocdepth, then no line produced.
%     INDENT   : Total indentation from the left margin.
%     NUMWIDTH : Width of box for number if the TITLE has a
%                \numberline command.
%     TITLE    : Contents of entry.
%     PAGE     : Page number.
%  Uses the following parameters, which must be set by the document style.
%  They should be defined with \def's.
%    \@pnumwidth : Width of box in which page number is set.
%    \@tocrmarg  : Right margin indentation for all but last line of
%                  multiple-line entries.
%    \@dotsep    : Separation between dots, in mu units.  Should be \def'd to
%                  a number like 2 or 1.7

\def\@pnumwidth{2.7em} % Dec 2008: changed to accept 4 digit page numbers 
                       % plus subsequent spacing
\def\@tocrmarg {3.0em} 
\def\@dotsep{6000.0}  % niente puntini nella tavola delle materie
\setcounter{tocdepth}{5}
                  % decide quanti titoli vanno nella tavola delle  materie

\def\@dottedtocline#1#2#3#4#5{% for paragraphs (Preface etc.) in part tocs
 \ifnum #1>\c@tocdepth \else
   \vskip \z@ \@plus.2\p@
   {\leftskip #2\relax \rightskip 0em %\parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
    \interlinepenalty\@M
    \leavevmode
    \@tempdima #3\relax
    %\advance\leftskip \@tempdima 
    \null\nobreak\hskip -\leftskip
%    \def\special##1{\relax}%cs contro i titoli colorati
%     {{\def\special##1{\relax}#4}}\nobreak
%     \leaders\hbox{$\m@th
%        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
%        mu$}\hfill
%     \nobreak
%     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
    \hb@xt@\@pnumwidth{\normalfont \normalcolor
       \figureversion{tabular}\oldstylenums{#5}\figureversion{tabular}\hfil}%
    {{\def\special##1{\relax}#4}}\hfill
    \par}%
 \fi}

\def\@dottedsectocline#1#2#3#4#5{% for sections in part tocs
 \ifnum #1>\c@tocdepth \else
   \vskip \z@ \@plus.2\p@
   {\leftskip #2\relax \rightskip 0em %\parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
    \interlinepenalty\@M
    \leavevmode
    \@tempdima #3\relax
    %\advance\leftskip \@tempdima 
    \null\nobreak\hskip -\leftskip
    % Dec 2008: made same as l@chapter
    \hb@xt@\@pnumwidth{% this formats the page number #2
    \figureversion{tabular}\oldstylenums{#5}\figureversion{tabular}%
    \hss}\hspace*{\csinttocwi}%
    % #4 is the title of the section:
    {{\def\special##1{\relax}#4}}\hfill
    \par}%
 \fi}

% this is the def for subsections, which should give a typeset paragaph.
% Dec 2008: still has a bug:  the dot sometimes appears at the start of the 
% line despite extensive tests % !!!3
\def\cs@dottedtocline#1#2#3#4#5{%\ifnum #1>\c@tocdepth\else 
\leftskip #2\rightskip 0 em\parindent \z@\leavevmode
% Sep 2005: the leavemode is essential (lack of it turns the
% copyrightline by 90 degrees)
%%\@afterindentfalse\interlinepenalty\@M \leavevmode
{\def\numberline##1{}%cs added Jan 99
\ifthenelse{\boolean{csfirstsss}}% 
{{\def\special##1{\relax}#4}}% case of first subsection,  #4 is the title
{% case of subsequent subsection:
\nobreak\hbox to 0.5em{\ \textbullet\hss}\hspace{0.4em}{\def\special##1{\relax}#4}}%
% now the page number #5 formating:
~~\figureversion{proportional}\oldstylenums{#5}\figureversion{tabular}}%
%\par % out in Dec. 2004  (no separate lines)
\def\numberline##1{\hb@xt@\@tempdima{##1\hfil}}%cs added Jan 99  
\setboolean{csfirstsss}{false}%cs added Apr 2006
%\fi
} 
      

% ****************************************
% *         LIST OF FIGURES              *
% ****************************************

%  uso: \listoffigures , but not used since version 22
      
\newlength\cstableindent
\newcounter{cshehef} % counts my figures, used in CAppendix

\def\listoffigures{\chapter{List of Illustrations}%
\markright{\thechapter\ \ list of illustrations}%
\pagestyle{nomovieheadings}%
% 
\let\protect\relax       % per latexe
\setlength\@tempdima{8mm}% % cs
\def\l@figure{\@cstabdottedtocline{0}{0em}{10mm}}%        %cs
%        \@dottedtocline{LEVEL}{INDENT}{NUMWIDTH}{TITLE}{PAGE} :
\def\@cstabdottedtocline##1##2##3##4##5{%
  \ifnum ##1>\c@tocdepth \else
     \vskip \z@ % Aug 2005: % \@plus.2\p@
     \leftskip ##2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent 0em\relax\@afterindenttrue
     \interlinepenalty\@M
     \advance\leftskip \@tempdima \advance\leftskip ##3
     \leavevmode
     \hskip -\leftskip
     \figureversion{tabular}% for MinionPro
%    this is a nasty trick of mine, writing one over the other:     
     \hbox to 0pt{\hspace{\@tempdima}\normalfont\normalcolor{##5}\hss}% PAGE
     \def\numberline####1{\ifthenelse{\equal{####1}{0}}%
         {\hb@xt@\@tempdima{\ \hss}\hspace{##3}}%cs NUMWIDTH
	 %
         {\hb@xt@\@tempdima{####1\hss}% FIGNUM
	 \setcounter{cshehef}{####1}\hspace{##3}}}%cs FIGNUM and NUMWIDTH
     {{\def\special####1{\relax}##4\hfill}}\hfill\par%% TITLE
  \fi}%
% 
\par
\vspace*{4mm}
\leavevmode
\hbox to \@tempdima{\scshape{Nr.}\hss}%
\hbox to 10mm{\scshape{Page}\hss}%
\hbox to 5cm{\scshape{Figure}\hss}%
\par\ \par
\figureversion{tabular}% for MinionPro
\renewcommand\familydefault{MinionPro-TLF}%
\figureversion{tabular}% for MinionPro
\small
% Dec 2005
\label{illustrationlist}
\@starttoc{lof}%       % le figure di tutto il libro
}
    

% ****************************************
% *         LIST OF TABLES               *
% ****************************************
      
% uso: \listoftables, but not used since version 22

\newcounter{cshehet}

\def\listoftables{\chapter{List of Tables}%
\markright{\thechapter\ \ list of tables}%
\pagestyle{nomovieheadings}%
% 
\let\protect\relax       % per latexe
\setlength\@tempdima{7mm}% % cs
\def\l@table{\@cstabdottedtocline{0}{0em}{10mm}}%        %cs
%        \@dottedtocline{LEVEL}{INDENT}{NUMWIDTH}{TITLE}{PAGE} :
\def\@cstabdottedtocline##1##2##3##4##5{%
  \ifnum ##1>\c@tocdepth \else
     \vskip \z@ % Aug 2005: % \@plus.2\p@
     \leftskip ##2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent 0em\relax\@afterindenttrue
     \interlinepenalty\@M
     \advance\leftskip \@tempdima \advance\leftskip ##3
     \leavevmode
     \hskip -\leftskip
%    this is a nasty trick of mine, writing one over the other:     
     \hbox to 0pt{\hspace{\@tempdima}\normalfont\normalcolor{##5}\hss}%
     \def\numberline####1{\hb@xt@\@tempdima{####1\hss}%
	 \setcounter{cshehet}{####1}\hspace{##3}}%cs
     {{\def\special####1{\relax}##4\hfill}}\hfill\par
  \fi}%
% 
\par
\vspace*{4mm}
\leavevmode
\hbox to \@tempdima{\scshape{Nr.}\hss}%
\hbox to 10mm{\scshape{Page}\hss}%
\hbox to 5cm{\scshape{Table}\hss}%
\par\ \par
\figureversion{tabular}% % per MinionPro
\renewcommand\familydefault{MinionPro-TLF}%
\small\@starttoc{lot}%   % le tavole del libro completo
} 


% ****************************************
% *             BIBLIOGRAPHY             *
% ****************************************

%      uso:
%            \begin{thebibliography}{99}  OR {999}
%            \au[biblabel][2] P.A.M. Dirac, N.O. Body / 
%                \jo PRL./ \vo 10/ \pp 10-12/ \yr 1990/ a very good article...
%      oppure:
%            \auetal[biblabel] A. B, al./   
%            \isa[biblabel]/ This can be seen ... in \asi PAM/ ...
%
%      Between pragraphs, use :
%            \hfill\break{}\hspace*{\parindent}\relax 
%
%      e alla fine
%            \end{thebibliography}

\newcounter{csbibcount}

\def\thebibliography#1{%
%----- formato delle referenze nella bibliografia
   \list{{\reset@font\footnotesize\sffamily\bfseries\arabic{enumi}}}% 
         {\small\labelsep 0.5em\parindent 0em%cs, giugno 2003
          \settowidth\labelwidth{{\small\sffamily\bfseries{#1}}}\leftmargin\labelwidth%
          \frenchspacing\parindent=0pt\parskip=0pt%cs, giugno 2003
          \renewcommand{\scdefault}{ssc}%      
          \advance\leftmargin\labelsep%
          \itemindent \z@ \listparindent=13pt%cs  
 	 \parsep \z@%
          \itemsep 0.3em plus \p@ minus \p@ %cs, giugno 2003
          \usecounter{enumi}\setcounter{enumi}{\value{csbibcount}}%
         \let\makelabel\bibliographylabel}% Dec 2008
%----- fine della bibliografia
   \def\endthebibliography{%cs luglio 2002
         \renewcommand{\scdefault}{ssc}%      
         \setcounter{csbibcount}{\value{enumi}}%
	 \endlist\par%
%          \vignette{book} %cs, giugno 2003
         \vignette{logo-30}}%cs, Feb 2010
%----- gli spazi bianchi
   \sfcode`.=1000 \sfcode`,=1000 \sfcode`:=1000 \sfcode`;=1000
   \sfcode`?=1000 \sfcode`!=1000 \sfcode`\.=1000}
      
%-----------------------------------------------------------------------------
% Further bibliography formatting details:

\newcommand\bibliographylabel[1]{#1\hfil} % Dec 2008 

% item senza autore, cioe` senza la virgola
% uso: \isa[biblabel] This is explained in \ldots
\def\isa[#1]{\bibitem{#1}}          

% Aug 2009: \asi needs no be used WITHOUT A PRECEDING BLANK!
% autore con bibitem et alii
\def\auetal[#1] #2/{\bibitem{#1}\asietal#2/} % lascia gli spazi
% autore con un nome solo e bibitem 
\def\aualone[#1] #2/{\bibitem{#1}\asialone#2/}

% autore senza bib-item, con ``et al.''
\def\asietal#1 #2, #3/{{\textsc{#1 {#2}}} 
{\textsc{\& }}al.,\index[names]{#2, #1}} % autore et al.

% autore con un solo nome
\def\asialone#1/{{\textsc{{#1}}},\index[names]{#1}} 

% nomi con bibitem e nel indice
\def\au[#1]#2/{\bibitem{#1}\asi#2/} 
% senza virgola
\def\ausim[#1]#2/{\bibitem{#1}\asisim#2/}   

% nomi senza bibitem ma nel indice
\def\asi{\@ifnextchar[{\@csasibr}{\csasinew}} 
\def\@csasibr[#1] #2/{\csasinew#2/}    % this ignores a possible [n]
\def\csasinew #1/{\ifhmode\unskip\fi\litmacro{#1},}
% the unskip corrects a bug in \litmacro 

\newcommand*\niceandsign{\textsc{\&} }   % With blank behind it
\newcommand*\niceandsignsim{\textsc{\&}} % This one has no blank after it
\newcommand*\niceseparator{\textsc{,}}   %%%%%%%%%%%%%%%%%%%% Aug 2009

%-----------------------------------------------------------------------------
% Giugno 2011
% comandi per mettere a posto l'indice dei nomi
% uso: \asix[nome intero]{nome abbreviato}  NOTE: THIS ADDS A COMMA!
% per esempio: \asix[Einstein, Albert]{A. Einstein}
%
% uso secondario, permesso: \asix A. Einstein/ NOTE: THIS ADDS A COMMA!
%
\def\asix{\@ifnextchar[{\asixhelpone}{\asixhelptwo}}
\def\asixhelpone[#1]#2/{%
\ifhmode\unskip\fi\litformatnoindex{#2}\niceseparator\index[names]{#1}}
\def\asixhelptwo #1/{\asixhelpthree#1/} 
\def\asixhelpthree#1 #2/{%
\ifhmode\unskip\fi\litformatnoindex{#1 #2}%
\niceseparator\index[names]{#2, #1}}
% misses the \& - need to be added!

% NOTE: I have no comamnd yet for people with a SINGLE name.
% \asix and \asixm assume (at least) TWO names

% Same WITHOUT comma
\def\asixm{\@ifnextchar[{\asixmhelpone}{\asixmhelptwo}}
\def\asixmhelpone[#1]#2/{%
\ifhmode\unskip\fi\litformatnoindex{#2}\index[names]{#1}}
\def\asixmhelptwo #1/{\asisim #1/}
% misses the \& - need to be added!

% nomi senza bibitem ma nel indice, senza virgola
\def\asisim{\@ifnextchar[{\@csasibrxx}{\csasinewxx}} 
\def\@csasibrxx[#1] #2/{\csasinewxx#2/}    % this ignores a possible [n]
\def\csasinewxx #1/{\ifhmode\unskip\fi\litmacro{#1}} % senza virgola

% these two are copied from below and modified for \asix and \asixm
\def\litformatnoindex#1{%
  \begingroup
    \@setnames@loop\^^?\^^ff
    \scantokens{\setnameinnernoindex{#1}\noexpand}%
  \endgroup
  \textsc{%\sfcode`.=700% tried Sep 2009, does not work
   \scantokens\expandafter\expandafter\expandafter{%
     \expandafter\makeatletter\wwwname\noexpand}}}

\def\setnameinnernoindex#1{%
  \global\let\wwwname\empty
  \let\wwwindname\empty
  \@getname#1 \@empty}
%-----------------------------------------------------------------------------

% The litmacro was defined by Ulrich Diez - new in Sep 2007
% It allows that \asi has ANY number of arguments

\begingroup
\makeatletter
\newcommand\Definelitmacro[2]{%
  \@ifdefinable\lm@remtrailspace{%
    \long\def\lm@remtrailspace##1##2#1#2##3#2#1{%
      \begingroup
      \toks@{##3}%
      \edef\@tempa{\the\toks@}%
      \expandafter\endgroup
      \ifx\@tempa\@empty
        \expandafter\@firstoftwo
      \else
        \expandafter\@secondoftwo
      \fi%
      {%
        {\toks@{##2}\edef\@tempa{\the\toks@}%
         \toks@{#2}\edef\@tempb{\the\toks@}%
         \expandafter}%
        \ifx\@tempa\@tempb
          \expandafter\@firstoftwo
        \else
          \expandafter\@secondoftwo
        \fi
        {\lm@iterate{##1}#1}%
        {\lm@remleadspace{##1}#2##2#1#2#2}%
      }%
      {\lm@remtrailspace{##1}##2#2#1#2#2#1}%
    }%
  }%
  \@ifdefinable\lm@remleadspace{%
    \long\def\lm@remleadspace##1##2#2#1##3#2#2{%
      \begingroup
      \toks@{##2}%
      \edef\@tempa{\the\toks@}%
      \expandafter\endgroup
      \ifx\@tempa\@empty
        \expandafter\@firstoftwo
      \else
        \expandafter\@secondoftwo
      \fi
      {\lm@remleadspace{##1}#2##3#2#2}%
      {%
       \@tempa{\niceseparator}##1%
       \lm@iterate{##2#2}#1%
      }%
    }%
  }%
  \@ifdefinable\lm@iterate{%
    \long\def\lm@iterate##1##2#2{%
      \begingroup
      \toks@{##2}%
      \edef\@tempa{\the\toks@}%
      \toks@{#1\@nil}%
      \edef\@tempb{\the\toks@}%
      \expandafter\endgroup\ifx\@tempa\@tempb
        \expandafter\@firstoftwo
      \else
        \expandafter\@secondoftwo
      \fi
      {%
%         \@tempa{ {\niceandsignsim} }##1%
        \@tempa{ {\niceandsignsim}}##1%%%%%%%%%%%% improved Aug 2009
      }%
      {%
        \lm@remtrailspace{##1}##2#2#1#2#2#1%
      }%
    }%
  }%
  \@ifdefinable\litmacro{%
    \DeclareRobustCommand\litmacro[1]{%
      {%
        \@temptokena{}%
        \long\def\@tempa####1#2####2#2{%
            \long\def\@tempa########1#2########2#2{%
            \@temptokena\expandafter{%
              \the\@temptokena\litformat{########2}%
            }%
            \long\def\@tempa################1#2%
                            ################2#2{%
              \@temptokena\expandafter{%
                \the\@temptokena################1%
                \litformat{################2}%
              }%
            }%
          }%
        }%
        \lm@iterate{#2#2}#1##1#2\@nil#2%
        %%%%%%%%%%%%%%%%%%%%%
        %\showthe\@temptokena
        %%%%%%%%%%%%%%%%%%%%%
      \expandafter}\the\@temptokena
    }%
  }%
}%

\expandafter\endgroup\Definelitmacro{ }{,}% taking out the space blocks the 
                                          % macro

%-----------------------------------------------------------------------------
% The following macro is due to William Robertson (comp.text.tex), Sep 2007
% it was improved completely by Enrico Gregorio in Nov 2007;
% it adds many microtypographic details that I did not have so far.
%
% use:  \litformat{A.B.C. Miller} % any number of initials
%    or \litformat{John M. Bower}
%    or \litformat{John van Something}

% !!!3 add \, also in the name index between double initials:
%     ``D. A.''  instead of ``D.A.''

\def\litformat#1{%
  \begingroup
    \@setnames@loop\^^?\^^ff
    \scantokens{\setnameinner{#1}\noexpand}%
  \endgroup
  \textsc{%\sfcode`.=700% tried Sep 2009, does not work
   \scantokens\expandafter\expandafter\expandafter{%
     \expandafter\makeatletter\wwwname\noexpand}}}

\def\@setnames@loop#1#2{% Every char in the 128-255 range is "other"
  \@tempcnta`#1\relax
  \loop
    \catcode\@tempcnta 12
  \ifnum\@tempcnta<`#2\relax
     \advance\@tempcnta\@ne
  \repeat}

\def\indexnames{\index[names]}

\def\setnameinner#1{%
  \global\let\wwwname\empty
  \let\wwwindname\empty
  \@getname#1 \@empty
  \expandafter\indexnames\expandafter{\wwwindname}}

% Sep 2009
\let\name@bspace\;
\let\name@ubspace\;
% original:
% \let\name@bspace\space 
% \let\name@ubspace~

% % diagnostic:
% \catcode`\~=11
% \def\name@bspace{--}
% \def\name@ubspace{~}
% %%%%%

\def\@getname#1 #2{%
  \ifx#2\@empty
    \xdef\wwwname{\wwwname\name@space#1}% last
    \edef\wwwindname{#1,\wwwindname}%
  \else
    \let\inits\empty
    \@getinit#1.\@empty
    \ifx\wwwname\empty
      \xdef\wwwname{\inits}% first
    \else
      \xdef\wwwname{\wwwname\name@space\inits}% not last
    \fi
    \edef\wwwindname{\wwwindname\space#1}%
    \expandafter\@getname
  \fi#2}

\def\@getinit#1.#2{%
  \ifx#2\@empty
    \@ifmtarg{#1}%  added the % in Nov 2008
      {\edef\inits{\inits.}%
       \let\name@space\name@ubspace}% after
      {\edef\inits{#1}%
       \let\name@space\name@bspace}% no dot
  \else
    \ifx\inits\empty
      \edef\inits{#1}% first
    \else
      \edef\inits{\inits .\,#1}% not first
    \fi
    \expandafter\@getinit
  \fi#2}

%-----------------------------------------------------------------------------

% \def\ti #1#2/{{\uppercase{#1}#2},}% titolo 
% \def\tisim #1#2/{{\uppercase{#1}#2}}% titolo simple, senza virgola
\def\ti #1#2/{{\it \uppercase{#1}#2},}% titolo 
\def\tisim #1#2/{{\it \uppercase{#1}#2}}% titolo simple, senza virgola
\def\bt #1/{{\it #1},}           % booktitle
\def\btsim #1/{{\it #1}}         % booktitle senza virgola
\def\btend #1/{{\it #1}.}        % booktitle con punto
% \def\jo #1/{{\it #1}}            % journal
% \def\josim #1/{{\it #1}}         % journal
% \def\jotext #1/{{\it #1},}       % journal, appendix E
% \def\jotextsim #1/{{\it #1}}     % journal, appendix E
% \def\jotextend #1/{{\it #1}.}    % journal, appendix E
\def\jo #1/{{#1}}            % journal
\def\josim #1/{{#1}}         % journal
\def\jotext #1/{{#1},}       % journal, appendix E
\def\jotextsim #1/{{#1}}     % journal, appendix E
\def\jotextend #1/{{#1}.}    % journal, appendix E
\def\vo #1/{{{\bf #1},}}         % volume
\def\pu #1/{#1,}                 % publisher
\def\puend #1/{#1.}              % publisher con punto
%\def\olo #1{{\oldstylenums{#1}}} % per scrivere in oldstyle
\def\olo #1{#1} % tolto, nov 2004

\def\yrsim #1/{{\olo{#1}}}       % year, no point, no comma
\def\yr #1/{{\olo{#1}},}         % year with comma
\def\yrend #1/{{\olo{#1}}.}      % year at the end - con un punto
% \def\yysim #1-#2/{{\olo{#1}}\lower 0.2ex\hbox{--}{}{\olo{#2}}}
% \def\yyend #1-#2/{{\olo{#1}}\lower 0.2ex\hbox{--}{}{\olo{#2}}.}

\def\pg #1/{p.~{\olo{#1}},}      % pagina 
\def\pgsim #1/{p.~{\olo{#1}}}    % pagina senza virgola
\def\pgend#1/{p.~{\olo{#1}}.}    % pagina alla fine - con punto

% % \def\pp #1-#2/{pp.~{\olo{#1}}\lower 0.2ex\hbox{--}{}{\olo{#2}},}
% % \def\ppsim #1-#2/{pp.~{\olo{#1}}\lower 0.2ex\hbox{--}{}{\olo{#2}}}
% % \def\ppend #1-#2/{pp.~{\olo{#1}}\lower 0.2ex\hbox{--}{}{\olo{#2}}.}
% % \lower non serve se \olo e` tolto:
% \def\pp #1-#2/{pp. {{#1}}\hbox{--}{}{{#2}},}     % pagine
% \def\ppsim #1-#2/{pp. {{#1}}\hbox{--}{}{{#2}}}   % pagine senza virgola
% \def\ppend #1-#2/{pp. {{#1}}\hbox{--}{}{{#2}}.}  % pagine senza punti

% Dirr, Apr 2006:
\def\pp #1-#2/{pp.~{{#1}}\hbox{--}\linebreak[0]{}{{#2}},}
\def\ppsim #1-#2/{pp.~{{#1}}\hbox{--}{}{{#2}}}
\def\ppend #1-#2/{pp.~{{#1}}\hbox{--}{}{{#2}}.}


% ****************************************
% *              THE INDEX               *
% ****************************************

\def\csigobble#1 {} % for use in \seealso

%----- \subsection{Per collezionare il contenuto dell'indice} -----------
%      questi comandi mettono \indexentry{xxx}{pag} % {stile}
%               usati solo per il debugging:    {filename}{line number}
%      nel file \jobname.idx
%
%  uso:
%   la parola non appare nel testo, solo nell'indice:
%     bla\index{xxx}  bla:   non appare nel testo, tipografia abituale
%     bla\indexs{xxx} bla:   non appare nel testo, tipografia  `speciale'
%
%   la parola appare normale nel testo, e normale nell'indice:
%     bla\iin[yyy]{xxx} bla: yyy nell'indice, xxx nel testo
%             ^ opzionale, p.e. per evitare maiuscole
%
%   la parola appare in corsivo nel testo, e "speciale" nell'indice:
%     bla\ii[yyy]{xxx} bla: yyy nell'indice, xxx nel testo
%            ^ opzionale, p.e. per evitare maiuscole

% Trucco che evita guai con utf-8
% Aksel Ã–sterlÃ¶f\protect\index[names]{Oesterloef@Ã–sterlÃ¶f, Aksel}

% nomi doppi di persone, prima il prenome, poi il nome di famiglia (testo e 
% nell'indice dei nomi - non nell'indice dei soggetti)
\def\iinn#1{\iinnhelp#1/} 
\def\iinnhelp#1 #2/{#1\index[names]{#2, #1} #2} 

% nomi doppi di persone, prima il prenome, poi il nome di famiglia (testo e 
% DUE indici) % Mar 2011
\def\iinnq{\@ifnextchar[{\iinhelpqwa}{\iinhelpqwb}}
\def\iinhelpqwb#1{\iinnqhelp#1/} 
\def\iinnqhelp#1 #2/{#1\index[names]{#2, #1}\index{#2, #1} #2} 
\def\iinhelpqwa[#1]#2{\iinnqhelpa[#1]#2/} 
\def\iinnqhelpa[#1]#2 #3/{#2\index[names]{#1}\index{#1} #3} 

% nomi doppi di persone speciali, testo e indice dei nomi
\def\iinns#1{\iinnshelp#1/} 
\def\iinnshelp#1 #2/{#1\index[names]{#2, #1!life} #2} 
% nomi doppi di persone speciali, prima il prenome, poi il nome di famiglia
% (testo e DUE indici)
\def\iinnqs#1{\iinnqshelp#1/} 
\def\iinnqshelp#1 #2/{#1\index[names]{#2, #1!life}\index{#2, #1} #2} 
% nomi semplici (un solo nome) nel testo e nell'indice, con opzioni
 \def\iname{\@ifnextchar[{\iinhelponename}{\iinhelptwoname}}
\def\iinhelptwoname#1{\iinhelponename[#1]{#1}}
\def\iinhelponename[#1]#2{#2\index[names]{#1}}
% nomi semplici (un solo nome) nel testo e IN DUE indici, con opzioni
 \def\inameq{\@ifnextchar[{\iinhelponenameq}{\iinhelptwonameq}}
\def\iinhelptwonameq#1{\iinhelponenameq[#1]{#1}}
\def\iinhelponenameq[#1]#2{#2\index[names]{#1}\index{#1}}
% nomi semplici speciali, nel testo e nell'indice, con opzioni
 \def\inames{\@ifnextchar[{\iinhelponenames}{\iinhelptwonames}}
\def\iinhelptwonames#1{\iinhelponenames[#1]{#1}}
\def\iinhelponenames[#1]#2{#2\index[names]{#1!life}}
% nomi semplici speciali, nel testo e IN DUE indici, con opzioni
 \def\inameqs{\@ifnextchar[{\iinhelponenameqs}{\iinhelptwonameqs}}
\def\iinhelptwonameqs#1{\iinhelponenames[#1]{#1}}
\def\iinhelponenameqs[#1]#2{#2\index[names]{#1!life}\index{#1}}
% nomi, SOLO indice, senza farlo apparire nel testo, semplici o doppi
\def\indname#1{\index[names]{#1}}
% nomi speciali, SOLO indice, senza farlo apparire nel testo, semplici o doppi
\def\indnames#1{\index[names]{#1!life}}

% --- comandi che collezionano soggetti per l'indice (OK Giugno 2011) ----

% soggetto normale, che va nell'indice ``IN INDEX''
\def\iin{\@ifnextchar[{\iinhelpone}{\iinhelptwo}}
\def\iinhelptwo#1{\iinhelpone[#1]{#1}}
\def\iinhelpone[#1]#2{\leavevmode\index{#1}#2}

% soggetto corsivo, che va nell'indice  ``ITALIC & INDEX''
\def\ii{\@ifnextchar[{\iihelpone}{\iihelptwo}}
\def\iihelptwo#1{\iihelpone[#1]{#1}}
\def\iihelpone[#1]#2{\leavevmode\indexs{#1}\emph{#2}}

% soggetto speciale, solo indice EFFECTIVELY ELIMINATED in MAR 2011
% \def\indexs#1{\index{#1|bbb}}
\def\indexs#1{\index{#1}}  % used to make italic page numbers in the past

% per la storia dell'universo ``IN INDEX & BOLD''
\def\iib{\@ifnextchar[{\iibhelpone}{\iibhelptwo}}
\def\iibhelptwo#1{\iibhelpone[#1]{#1}}
\def\iibhelpone[#1]#2{\leavevmode\indexs{#1}{\bf#2}}

% May 2009, volume 6: definizione di concetto in bold italic
\def\textbfcs{\@ifnextchar[{\textbfcshelptwo}{\textbfcshelpone}}
\def\textbfcshelptwo[#1]#2{{\itshape\bfseries #2}\index{#1}}
\def\textbfcshelpone#1{{\itshape\bfseries #1}\index{#1}}

% soggetto in corsivo sia nel testo e nell'indice, pagina normale
% per i nomi latini di piante e animali
\def\iie#1{\leavevmode\index{#1@\textit{#1}}\emph{#1}} 
% soggetto in corsivo solo nell'indice, pagina normale
% per i nomi latini di piante e animali, solo indice
\def\indexe#1{\index{#1@\textit{#1}}}       

%\proofmodetrue      % shows index terms

%----- \section{I miei due indici} --------------------------------------

% This is the first index, for  subjects:
%\renewindex{default}{idx}{ind}{Subject Index} % this is the default anyway

\newindex{names}{nax}{nad}{Name Index} % this is my second index:  names

%----- \section{Gli indici stampati} ------------------------------------

% This prints the SUBJECT index, first page WITH symbols
\def\printsubjectindex{%\index{glossary}% Do I get the term `glossary' into this index
                       % with this pagenumber? NO - but I do not need it
 \begingroup
 \typeout{----------------------------------------subject-index---} 
 \message{Assumo che hai gia` usato Makeindex per trasformare}
 \message{\jobname.idx in \jobname.ind .} 
 \message{Ora leggo il file \jobname.ind con tutti i soggetti (con simb).} 
 \typeout{--------------------------------------------------------} 
 \stchapter{Subject index} 
 \thispagestyle{subjectindexstart}% <---- WITH SYMBOL GRAPHICS
 %
 \par \small \noindent 
%  Page numbers in \emph{italic}
%  typeface refer to pages where the keyword is defined or presented in detail.
%  The subject index thus acts as a glossary.
 %
 \def\foreignlanguage##1##2{##2}% % Sep 2005 
 \def\@idxitem##1 {\par\par\figureversion{osf}%\typeout{--##1} 
 \hangindent 12.5pt ##1%
 %------ Nov 2008, to avoid crashing latex at the index
 {\def\textsmaller####1{####1}\def\textit####1{####1}%
 \def\textsc####1{####1}\def\csgreekok####1{####1}\let\sc\relax
 \def~{\ }% Nov 2008: avoids problems with ~, which stops latex
 \let\protect\relax\def\foreignlanguage####1####2{####2}%
 \def\cshelpx{##1}% with \edef it bombs at most subjects (opposite to nameindex)
% % %  \def\cshelpx{\trimcomma{##1}}% Out in Dec 2008
% \protected@edef\cshelpxtwo{\cshelpx}%
% \typeout{----   ##1    ----- \cshelpx  ------}%
\markright{\cshelpx}} }% leave the space, defines rightmark in index
 %------
%  \show\item
%  \show\H@item
 \@input{\jobname.ind}\endgroup%
\typeout{---------------------------------end-of-subject-index---}%
}
% nei file jobname.nad/ind, il primo comando e` \begin{theindex}

% This prints the SUBJECT index, first page WITHOUT symbols
\def\printsubjectindexnosym{%\index{glossary}% Do I get the term `glossary' into this index
                       % with this pagenumber? NO - but I do not need it
 \begingroup
 \typeout{----------------------------------------subject-index---} 
 \message{Assumo che hai gia` usato Makeindex per trasformare}
 \message{\jobname.idx in \jobname.ind .} 
 \message{Ora leggo il file \jobname.ind con tutti i soggetti (senza simb.).} 
 \typeout{--------------------------------------------------------} 
 \stchapter{Subject index}
 \thispagestyle{nameindexstart}% <---- NO SYMBOLS
 %
 \par \small \noindent 
%  Page numbers in \emph{italic}
%  typeface refer to pages where the keyword is defined or presented in detail.
%  The subject index thus acts as a glossary.
 %
 \def\foreignlanguage##1##2{##2}% % Sep 2005 
 \def\@idxitem##1 {\par\par\figureversion{osf}%\typeout{--##1} 
 \hangindent 12.5pt ##1%
 %------ Nov 2008, to avoid crashing latex at the index
 {\def\textsmaller####1{####1}\def\textit####1{####1}%
 \def\textsc####1{####1}\def\csgreekok####1{####1}\let\sc\relax
 \def~{\ }% Nov 2008: avoids problems with ~, which stops latex
 \let\protect\relax\def\foreignlanguage####1####2{####2}%
 \def\cshelpx{##1}% with \edef it bombs at most subjects (opposite to nameindex)
% % %  \def\cshelpx{\trimcomma{##1}}% Out in Dec 2008
% \protected@edef\cshelpxtwo{\cshelpx}%
% \typeout{----   ##1    ----- \cshelpx  ------ \cshelpxtwo }%
 \markright{\cshelpx}} }% leave the spaces, defines rightmark in index
 %------
 \@input{\jobname.ind}\endgroup%
\typeout{---------------------------------end-of-subject-index"--}%
}
% nei file jobname.nad/ind, il primo comando e` \begin{theindex}

% This prints the NAME index
\def\printnameindex{% 
%
 \typeout{-------------------------------------------name-index---} 
 \message{Assumo che hai gia` usato Makeindex per trasformare}
 \message{\jobname.nax in \jobname.nad .} 
 \message{Ora leggo il file \jobname.nad con tutti i NOMI.} 
 \typeout{--------------------------------------------------------} 
 \stchapter{Name index}
 \thispagestyle{nameindexstart}
 %
 \par \small \noindent 
%  Page numbers in \emph{italic} typeface refer to pages
%  where the person is presented in more detail.
 %
 \begingroup%
 %
 \def\foreignlanguage##1##2{##2}% % Sep 2005
 \def\@idxitem##1 {\par\par\figureversion{osf}%
 \hangindent 12.5pt ##1%
 %------ Nov 2008, to avoid crashing latex at the index
 {\def\textsmaller####1{####1}\def\textit####1{####1}%
 \def\textsc####1{####1}\def\csgreekok####1{####1}\let\sc\relax
 \def~{\ }% Nov 2008: avoids problems with ~, which stops latex
 \let\protect\relax\def\foreignlanguage####1####2{####2}%
 \edef\cshelpx{##1}% Dec 2008: with \def it bombs at Names with Ã¼
% does not work: \protected@edef\cshelpxtwo{##1}%
% \typeout{----   ##1    ----- \cshelpx  ------}%
 \markright{\cshelpx}} }% leave the spaces, defines rightmark inside index
                        % used for the large capitals and key words
 \@input{\jobname.nad}\endgroup%
\typeout{------------------------------------end-of-name-index---}%
}
  
%---- i dettagli degli indici

\def\indexspace{\par \vskip 12\p@  minus 0\p@\relax} %cs non cambiare,
%                                                    %cs fa colonne uguali
%
% \def\@idxitem{\par\par\hangindent 1em}     %cs    do not change to \item!
%                                
%\def\@idxitem#1 {\par\par\hangindent 1em{\markright{#1}}#1 }   
%
\def\subitem{\par\hangindent 12.5pt \hspace*{12.5pt}}     %  must be 
                                                          %  linespacing,
\def\subsubitem{\par\hangindent 12.5pt \hspace*{12.5pt}}  %  says Dirr

\def\bbb#1{\emph{{\hyperpage{#1}}}}         % cs, per Makeindex
\def\see#1#2{{\em see\/} #1}  %cs
\def\seealso#1#2{{\em see also\/} #1}  %cs, Feb 2011, Mar 2011: added \par

\def\theindex{\relax% called by \begin{theindex} in the *.ind file
 \vskip 5ex minus 2 pt
 %
 \let\item\@idxitem
 %----- l'estetica dell'indice
 \premulticols 50pt \postmulticols 50pt
 \multicolsep 12.0pt plus 4.0pt minus 3.0pt
 \columnsep 10.0 pt \columnseprule 0.0pt
 % \setcounter{\unbalance}{1}     % lines more on the left, at the end
 % \flushcolumns 
 \raggedcolumns 
 \raggedright      % much nicer
 %
 \parindent\z@    \parskip\z@ plus .3\p@
 %
 \begin{multicols}{3}[][0pt] %   {column number}[preface][skip space]
}   

\def\endtheindex{\end{multicols}}


% ****************************************
% *             FOOTNOTES                *
% ****************************************

%      uso: bla bla\footnote{A proposito ..} bla bla
%
%      non usare MAI niente con \marginpar all'interno di \footnote !
%      ci sono casini senza fine : figure che spariscono ecc. ecc.
%      usa sempre, ma solo in libro.cls \citefmp (che e`diverso 
%      nei footnotes e floats)

%%%%% Apr 2006   \@addtoreset{footnote}{page}
%\skip\footins 30\p@ plus 4\p@ minus 2\p@
\setlength{\skip\footins}{13pt plus13pt minus6.5pt}
%\setlength\footnotesep{6.5pt}

\renewcommand\footnoterule{%
   \vspace*{-4pt}%
   \hrule width .33\textwidth height 0.4pt%
   \vspace*{3.6pt}}

\renewcommand{\thefootnote}{\fnsymbol{footnote}}

\renewcommand{\@makefnmark}{%
%\raisebox{0.5mm}[0mm]{
\mbox{%\sffamily % cs
\@thefnmark}}%}%

\def\@fnsymbol#1{\ifcase#1\or
{*}\or
{**}\or
{***}\or
{****}\or
{*****}\or
{******}\or
{*******}\or
{********}\or
{*********}\or
\else{* * *}\fi} % fewer errors

%\long\def\@makefntext#1{\parindent 1em\noindent
%            \hbox to 1.8em{\hss$\m@th^{\@thefnmark}$}#1}
\long\def\@makefntext#1{\parindent 11pt\noindent%
% In bk11.clo, footnotesize is {9pt}{11pt}
%
\def\bibitem##1{}%     % per sicurezza; evita molti guai
%
% %\def\strutdepth{\dp\strutbox}% dal TeXbook, pagina 316
% % \def\citefmp##1{%\ifodd\c@page%
% % %  \strut\vadjust{\kern-\strutdepth\vtop to 
% % %  \strutdepth{\baselineskip\strutdepth\vss%
% % %  \rlap{\hspace{\textwidth}\hspace{\the\marginparsep}%
% % %  \scriptsize\sf##1\ \ \ \ \ }\null}}%
% % %  \else 
% %  \strut\vadjust{\kern-\strutdepth\vtop to
% %  \strutdepth{\baselineskip\strutdepth\vss%
% %  \llap{%
% %  \scriptsize\sf##1\ \ \ \ \ }\null}}%
% % % \fi
% % }%
%                                     
{%\sffamily % cs
\@thefnmark}\ #1}

\def\circa{\textit{c.}\,} % Dirr, July 2005 - optimized for a subsequent 
                          % number- British style
% Dirr, July 2005
% uso: Newton \lived(1642-1278)                   output Newton (1642--1278)
% uso: \livedca(\circa 540-\circa 480 {\bce})     output Heraclitus (c. 540 to c. 480 BCE)
% uso: \livedplace(1881 Overschie-1966 Blaricum)  output (b. 1881 Overschie, d. 1966 Blaricum)

% June 2011: added proportionl figures, as requested by Dirr
\def\lived(#1-#2){{%
\hbox{(\hspace{0.06em}\figureversion{proportional}\oldstylenums{#1}}\hspace{0.04em}--%
\hbox{\figureversion{proportional}\oldstylenums{#2}\hspace{0.06em})}}}
% checked the above and the two below with Dirr in July 2005; /, is too large as spacing

\def\livedca(#1-#2){{\figureversion{proportional}(\oldstylenums{#1} to 
\hbox{\oldstylenums{#2}\hspace{0.06em})}}}         % 

% !!!3 June 2017: these macros give a "fmy not found" warning in captions:

\def\livedplace(#1-#2){{\figureversion{proportional}(b.~\oldstylenums{#1},
d.~\hbox{\oldstylenums{#2}\hspace{0.06em})}}}  % added tildes in Feb 2014

\def\livingplace(#1-#2){{\figureversion{proportional}(b.~\oldstylenums{#1}
\hbox{\oldstylenums{#2}\hspace{0.06em})}}}  % added tildes in Feb 2014 

% % Jun 2013
% \let\livedfig\lived % this gives font errors in figures

% Jun 2011, again in Jun 2013
\def\livedfig(#1-#2){{% gives no error messages, but proportional is 
%                     % impossible ... !!!3
\hbox{(\hspace{0.06em}{#1}}\hspace{0.08em}--\hbox{{#2}\hspace{0.06em})}}}


% ****************************************
% *             CAPTIONS                 *
% ****************************************     OK Jun 2011
% New in Dec 2015
\usepackage{capt-of}
\usepackage{caption} % [2005/06/28] 
                     % must be after french/babel, moved here in Dec 2014

\DeclareCaptionFormat{default}{#1#2#3}

\DeclareRobustCommand\lfseries
   {\not@math@alphabet\lfseries\relax
    \fontencoding{T1}\fontfamily{fmy}\fontseries{l}\selectfont}
\DeclareCaptionFont{lf}{\lfseries}

\DeclareCaptionLabelFormat{tabcoloured}{%
   \textcolor{hks15}{{\tabcapso{TABLE}}~~{#2}}}
%   \usefont{T1}{fmy}{n}{sc}#2}}
\DeclareCaptionLabelFormat{figcoloured}{%
   \textcolor{hks15}{{\tabcapso{FIGURE}}~~{#2}}}
%    \usefont{T1}{fmy}{n}{sc}#2}}
\DeclareCaptionLabelSeparator{enspace}{\hspace{0.5em}}
\DeclareCaptionLabelSeparator{emspace}{\hspace{1.0em}}

\newlength{\csfigurewidth} % April 2020

\DeclareCaptionStyle{schillerfig}%
   {labelfont={sf,scriptsize},textfont={sf,lf,footnotesize},
   singlelinecheck=false, strut=1, % June 2011, but has no effect
   % but strut MUST be 1; it affects above- and belowcaptionskip
   labelsep=enspace,justification=raggedright,width=\csfigurewidth}
\DeclareCaptionStyle{schillertab}%
   {labelfont={sf,scriptsize},textfont={sf,lf,footnotesize},
   singlelinecheck=false, strut=1, % June 2011, but has no effect
   % but strut MUST be 1; it affects above- and belowcaptionskip
   labelsep=enspace,justification=raggedright,%
    width=\textwidth} % added textwidth in Sep 2015, still have overfull hbox
\DeclareCaptionStyle{schillerlongtab}%
   {labelfont={sf,scriptsize},textfont={sf,lf,footnotesize},
   singlelinecheck=false, strut=1, % June 2011, but has no effect
   % but strut MUST be 1; it affects above- and belowcaptionskip
   labelsep=enspace,justification=raggedright,%
    width=\textwidth} % added textwidth in Sep 2015, still have overfull hbox

\captionsetup[table]{style=schillertab,labelformat=tabcoloured}
\captionsetup[longtable]{style=schillerlongtab,labelformat=tabcoloured}
% \captionsetup[minipage]{style=schillerfig,labelformat=figcoloured}
\captionsetup[figure]{style=schillerfig,labelformat=figcoloured}
\captionsetup[wrapfigure]{style=schillerfig,labelformat=figcoloured}

\setlength{\belowcaptionskip}{0pt}  
\setlength{\abovecaptionskip}{4pt} % June 2011 - BELOW the caption for tables
                                   %             ABOVE caption for figures

% Apr 2008: should be \belowskip in caption package


% ****************************************
% *             FIGURES                  *
% ****************************************     OK Jun 2011

%      use \protect\iinn and the like in Figure captions
%      use \protect\url in Figure captions
 
% New in Dec 2015
\def\floatpagefraction{0.55}  % New in Dec 2015, seems ok
  
\def\dblfloatpagefraction{.5} % Vedi il libro a pag 177-178 o anche latex.tex

\def\topfraction{1}   % Max fraction of page for floats at top of page

\setcounter{totalnumber}{3}   % max number of floats per page
\setcounter{topnumber}{3}     % max number of floats on top of page

\def\textfraction{0.0} % Jul 2005  % min fraction of page with text
% If set to 0.1, large tables (like the velocity table) lead to ``too
% many unprocessed floats''

\setlength{\@fptop}{0pt} % New in Nov 2008, to make PURE float pages prettier

% File grafici      uso: \csepsffile{filename}
\def\csepsffile{\@ifnextchar[{\cs@grhimit}{\csincludeps}}
\def\csincludeps#1{{\def\message##1{\relax}\includegraphics{Images/#1}}}
\def\cs@grhimit[#1]#2{{\def\message##1{\relax}\includegraphics[#1]{Images/#2}}}
% 1. non voglio dire sempre ``.eps'' (il nome fa anche da label) o ``.jpg''
% 2. il \relax serve ad avere meno messaggi nel logfile

\@removefromreset{figure}{chapter}
\def\thefigure{\@arabic\c@figure}

% Vignette alla fine dei capitoli     uso: \vignette{filename}
\def\vignette#1{\vskip 11mm{\hbox to \textwidth{\hss
\href{http://www.motionmountain.net}{\csepsffile{o-#1}}\hss}}}
  
% Ora le mie figure in eps. Comincio con alcuni dettagli
% \newlength{\csfigurewidth} moved upwards, in this file, in April 2020
\newlength{\csfigurewidthhelp}
\newlength{\csfigurewidthone}
\newlength{\csfigurewidthtwo}
\newlength{\csfigurewidththree} % I need this in the text

%  uso:   \csepsf{filename}{scale=0.5}{Questa e` la descrizione della figura.}[opzionale:psfrag]
% oppure: \csepsf[h]{filename}{scale=0.5}{descrizione}[opzionale:psfrag]
%          per averla qui (h= here)
%          nota: label=filename
%  versione del dic 2006
\def\csepsf{\@ifnextchar[{\@cssepsf}{\@cssepsf[t]}} 
\def\@cssepsf[#1]#2#3#4{\@ifnextchar[{\@cssepsfqq[#1]{#2}{#3}{#4}}{\@cssepsfqq[#1]{#2}{#3}{#4}[]}} 
\def\@cssepsfqq[#1]#2#3#4[#5]{% #3 is assumed to be like ``scale=0.3''
  \begin{figure}[#1]%
  \capstart% July 2005, to make hyperref jump here  
  \begin{psfrags}%
     #5% is assumed to look like  \psfrag{g}{$g$}\psfrag{q}{$q$}
  \settowidth{\csfigurewidth}{\hbox{\csepsffile[#3]{#2}}}%    
  \setlength{\fboxsep}{0mm}%
  \ifdim\csfigurewidth>\textwidth
  \setlength{\csfigurewidth}{\textwidth}%  
  \hbox to \textwidth{\hss\colorbox{figurebackgroundcolor}{\csepsffile[#3]{#2}}}%
  \else
  \hbox to \textwidth{\hss\colorbox{figurebackgroundcolor}{\csepsffile[#3]{#2}}\hss}%
  \fi
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
  \caption{#4}%
  \protect\label{#2}%
  \end{psfrags}%
\end{figure}}%

% (OK) do not know why [p] makes skewed running heads - Dec 2015
% (OK) do not know any more why volume 6 is ok...
%
\def\csepsfnb{\@ifnextchar[{\@cssepsfnb}{\@cssepsfnb[t]}} % no grey background
\def\@cssepsfnb[#1]#2#3#4{\@ifnextchar[{\@cssepsfnbqq[#1]{#2}{#3}{#4}}%
{\@cssepsfnbqq[#1]{#2}{#3}{#4}[{\relax}]}} % \relax does not help for the
                                % running title issue
\def\@cssepsfnbqq[#1]#2#3#4[#5]{% #3 is assumed to be like ``scale=0.3''
  \begin{figure}[#1]%
  \capstart% July 2005, to make hyperref jump here  
  \begin{psfrags}%
     #5% is assumed to look like  \psfrag{g}{$g$}\psfrag{z}{$z$}
  \settowidth{\csfigurewidth}{\hbox{\csepsffile[#3]{#2}}}%  
  \ifdim\csfigurewidth>\textwidth
    \setlength{\csfigurewidth}{\textwidth}%  
    \hbox to \textwidth{\hss\csepsffile[#3]{#2}}%
  \else
    \hbox to \textwidth{\hss\csepsffile[#3]{#2}\hss}%
  \fi
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
  \caption{#4}%
  \protect\label{#2}%
  \end{psfrags}%
\end{figure}}

% Used only once, corrects an Illustrator bug for that figure
\def\csepsfnbr{\@ifnextchar[{\@cssepsfnbr}{\@cssepsfnbr[t]}} % no grey background
\def\@cssepsfnbr[#1]#2#3#4{\@ifnextchar[{\@cssepsfnbqqr[#1]{#2}{#3}{#4}}{\@cssepsfnbqqr[#1]{#2}{#3}{#4}[]}} 
\def\@cssepsfnbqqr[#1]#2#3#4[#5]{% #3 is assumed to be like ``scale=0.3''
  \begin{figure}[#1]%
  \capstart% July 2005, to make hyperref jump here  
  \begin{psfrags}%
     #5% is assumed to look like  \psfrag{g}{$g$}\psfrag{q}{$q$}
  \settowidth{\csfigurewidth}{\hbox{\csepsffile[#3]{#2}}}%  
  \ifdim\csfigurewidth>\textwidth
    \setlength{\csfigurewidth}{\textwidth}%  
    \hbox to \textwidth{\csepsffile[#3]{#2}\hss}%
  \else
    \hbox to \textwidth{\csepsffile[#3]{#2}\hss}%
  \fi
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
  \caption{#4}%
  \protect\label{#2}%
  \end{psfrags}%
\end{figure}}

% New in July 2016, used in Vol. 1 and 6
\def\csepsfnbcenter{\@ifnextchar[{\@cssepsfnbc}{\@cssepsfnbc[t]}} % no grey background
\def\@cssepsfnbc[#1]#2#3#4{\@ifnextchar[{\@cssepsfnbqqc[#1]{#2}{#3}{#4}}%
{\@cssepsfnbqqc[#1]{#2}{#3}{#4}[{\relax}]}} 

\def\@cssepsfnbqqc[#1]#2#3#4[#5]{% #3 is assumed to be like ``scale=0.3''
  \begin{figure}[#1]%
  \capstart% to make hyperref jump here  
  \begin{psfrags}%
     #5% is assumed to look like  \psfrag{g}{$g$}\psfrag{z}{$z$}
  \setlength{\csfigurewidth}{\textwidth}%  
    \hbox to \textwidth{\hss\csepsffile[#3]{#2}\hss}%
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
  \caption{#4}%
  \protect\label{#2}%
  \end{psfrags}%
\end{figure}}


%      uso: \csepsftw{filename}{Questa e` la descrizione della figura.}
%      per figure larghe esattamente come textwidth o piu` larghe
\def\csepsftw{\@ifnextchar[{\@cssepsftw}{\@cssepsftw[t]}} 
\def\@cssepsftw[#1]#2#3#4{%
  \begin{figure}[#1]%
  \capstart% July 2005, to make hyperref jump here  
  \setlength{\csfigurewidth}{\textwidth}%    
  \setlength\fboxsep{0mm}%
  % changed: grey box of textwidth size
  \hbox to 
  \textwidth{\hss\colorbox{figurebackgroundcolor}{\csepsffile[#3]{#2}}}% Dirr
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
  \caption{#4}%
  \protect\label{#2}%
\end{figure}}%

\let\csepsfxx\csepsftw % for the timeline of antiquity in pdf, differs in print

%      uso: \csepsftwfull{filename}{Questa e` la descrizione della figura.}
%      per DISEGNI che prendono tutta una pagina, con il fondo grigio;
%      used only for dutch bird graph  
\def\csepsftwfull#1#2#3{%
\begin{figure}[p]%
  \capstart% July 2005, to make hyperref jump here  
  \setlength{\csfigurewidth}{\textwidth}%    
  \vbox to 0.90\textheight{%
    \hbox to 
    \textwidth{\colorbox{figurebackgroundcolor}{\csepsffile[#2]{#1}}\hss}%   
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
    \caption{#3}%
    \protect\label{#1}%
  \vss}
  \vss% <----  
\end{figure}}%

\def\csepsftwfullnbpowell{\@ifnextchar[{\@cssepsftwfull}{\@cssepsftwfull[p]}} 
\def\@cssepsftwfull[#1]#2#3#4{% Used once only, for one figure
  \begin{figure}[#1]%
  \capstart% July 2005, to make hyperref jump here  
  \setlength{\csfigurewidth}{\textwidth}%    
%  \vbox to 0.95\textheight{
  \hbox to 
  \textwidth{\hss{\csepsffile[#3]{#2}}}% Dirr
%  \smallskip
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
  \caption{#4}%
  \protect\label{#2}%
  \vfill% <----  
\end{figure}}%

% --- Comandi per DUE figure:

\def\cstepsfnb{\@ifnextchar[{\@csstepsf}{\@csstepsf[t]}} 
% fa DUE figure una vicino all'altra con UNA leggenda sola
% fa la leggenda larga esattamente textwidth
%      uso: \cstepsf{filename}{scale}{secondfile}{scale}{Questa e` 
%                 la descrizione delle figure}  con filename=label
%   oppure: \cstepsf[h]{filename}{scale}{secondfile}{scale}{descrizione} 
%                  per averle qui (h= here)
\def\@csstepsf[#1]#2#3#4#5#6{%
  \begin{figure}[#1]%
  \capstart% July 2005, to make hyperref jump here  
    \setlength{\csfigurewidth}{\textwidth}%    
    % used in makecaption
    \hbox to 
    \textwidth{{\csepsffile[#3]{#2}}\hss%
    {\csepsffile[#5]{#4}}}%
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
    \caption{#6}%
    \protect\label{#2}%
  \end{figure}}%  

\def\cstftlepsf{\@ifnextchar[{\@cstftlepsf}{\@cstftlepsf[t]}} 
% fa DUE figure con DUE leggende: `tftl = two figs two legends'
%    uso: \cstftlepsf[p]{primofilename}{scale}{Questa e` la prima}[distance]
%                {secondfilenam}{scale}{la seconda leggenda}  
\def\@cstftlepsf[#1]#2#3#4[#5]#6#7#8{%
  \begin{figure}[#1]%
   \capstart% July 2005, to make hyperref jump here  
   \centering
    %
   \settowidth{\csfigurewidth}{\hbox{\csepsffile[#3]{#2}}}%    
   \begin{minipage}[t]{\csfigurewidth}
    \setlength\fboxsep{0mm}%
    \colorbox{figurebackgroundcolor}{\csepsffile[#3]{#2}}   
    \setlength{\belowcaptionskip}{0pt}%  June 2011
    \setlength{\abovecaptionskip}{6pt}%  
    \caption{#4}%    
    \protect\label{#2}%
   \end{minipage} 
    %
    \hfill % Nov 2008  parammeter 5 is now ignored
    %
    \settowidth{\csfigurewidth}{\hbox{\csepsffile[#7]{#6}}}%    
   \begin{minipage}[t]{\csfigurewidth}
    \setlength\fboxsep{0mm}%
    \colorbox{figurebackgroundcolor}{\csepsffile[#7]{#6}}   
    \setlength{\belowcaptionskip}{0pt}%  June 2011
    \setlength{\abovecaptionskip}{6pt}%  
    \caption{#8}%     
    \protect\label{#6}%
   \end{minipage} 
  \end{figure}}%  

% APRIL 2014
  \def\cstftlepsfpsfragboth{\@ifnextchar[{\@cstftlepsfaab}{\@cstftlepsfaab[t]}} 
% fa DUE figure con DUE leggende: `tftl = two figs two legends' con psfrag 
%      uso: \cstftlepsf{primofilename}{scale}{Questa e` la prima}[distance]
%           {secondfilenam}{scale}{la seconda leggenda}  
\def\@cstftlepsfaab[#1]#2#3#4[#5]#6#7#8[#9]{%
  \begin{figure}[#1]%
  \capstart% July 2005, to make hyperref jump here  
    \centering
    %
   \settowidth{\csfigurewidth}{\hbox{\csepsffile[#3]{#2}}}%    
   \begin{minipage}[t]{\csfigurewidth}
  \begin{psfrags}%
    #5  % new in August 2013, is assumed to look like  \psfrag{g}{$g$}\psfrag{q}{$q$}
    \setlength\fboxsep{0mm}%
    \colorbox{figurebackgroundcolor}{\csepsffile[#3]{#2}}   
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
    \caption{#4}%    
    \protect\label{#2}%
  \end{psfrags}%
   \end{minipage} 
    %
    \hfill % Nov 2008  
    %
    \settowidth{\csfigurewidth}{\hbox{\csepsffile[#7]{#6}}}%    
   \begin{minipage}[t]{\csfigurewidth}
  \begin{psfrags}%
    #9  % new in April 2014, is assumed to look like  \psfrag{g}{$g$}\psfrag{q}{$q$}
    \setlength\fboxsep{0mm}%
    \colorbox{figurebackgroundcolor}{\csepsffile[#7]{#6}}   
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
    \caption{#8}%     
    \protect\label{#6}%
  \end{psfrags}%
   \end{minipage} 
  \end{figure}}%  

% Mar 2012
  \def\cstftlepsfpsfragone{\@ifnextchar[{\@cstftlepsfaa}{\@cstftlepsfaa[t]}} 
% fa DUE figure con DUE leggende: `tftl = two figs two legends' con psfrag 1
%      uso: \cstftlepsf{primofilename}{scale}{Questa e` la prima}[distance]
%           {secondfilenam}{scale}{la seconda leggenda}  
\def\@cstftlepsfaa[#1]#2#3#4[#5]#6#7#8[#9]{%
  \begin{figure}[#1]%
  \capstart% July 2005, to make hyperref jump here  
    \centering
    %
   \settowidth{\csfigurewidth}{\hbox{\csepsffile[#3]{#2}}}%    
   \begin{minipage}[t]{\csfigurewidth}
  \begin{psfrags}%
    #9  % new in August 2013, is assumed to look like  \psfrag{g}{$g$}\psfrag{q}{$q$}
    \setlength\fboxsep{0mm}%
    \colorbox{figurebackgroundcolor}{\csepsffile[#3]{#2}}   
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
    \caption{#4}%    
    \protect\label{#2}%
  \end{psfrags}%
   \end{minipage} 
    %
    \hfill % Nov 2008  parammeter 5 is now ignored
    %
    \settowidth{\csfigurewidth}{\hbox{\csepsffile[#7]{#6}}}%    
   \begin{minipage}[t]{\csfigurewidth}
    \setlength\fboxsep{0mm}%
    \colorbox{figurebackgroundcolor}{\csepsffile[#7]{#6}}   
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
    \caption{#8}%     
    \protect\label{#6}%
   \end{minipage} 
   \end{figure}}


\def\cstftlepsfnb{\@ifnextchar[{\@cstftlepsfnb}{\@cstftlepsfnb[t]}} 
% fa DUE figure con DUE leggende: `tftl = two figs two legends' no background
%      uso: \cstftlepsf{primofilename}{scale}{Questa e` la prima}[distance]
%           {secondfilenam}{scale}{la seconda leggenda}  
\def\@cstftlepsfnb[#1]#2#3#4[#5]#6#7#8{%
  \begin{figure}[#1]%
  \capstart% July 2005, to make hyperref jump here  
    \centering
    %
   \settowidth{\csfigurewidth}{\hbox{\csepsffile[#3]{#2}}}%    
   \begin{minipage}[t]{\csfigurewidth}
    \hbox{\csepsffile[#3]{#2}}   
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
    \caption{#4}%    
    \protect\label{#2}%
   \end{minipage} 
    % 
    \hfill % Nov 2008  parammeter 5 is now ignored
    %
   \settowidth{\csfigurewidth}{\hbox{\csepsffile[#7]{#6}}}%    
   \begin{minipage}[t]{\csfigurewidth}
    \hbox{\csepsffile[#7]{#6}}   
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
    \caption{#8}%     
    \protect\label{#6}%
   \end{minipage} 
  \end{figure}}%  
  
\def\cstftlepsfnbsecond{\@ifnextchar[{\@cstftlepsfns}{\@cstftlepsfns[t]}} 
% fa DUE figure con DUE leggende: `tftl = two figs two legends'
%      uso: \cstftlepsf{primofilename}{scale}{Questa e` la prima}[distance]
%           {secondfilenam}{scale}{la seconda leggenda}  
\def\@cstftlepsfns[#1]#2#3#4[#5]#6#7#8{%
  \begin{figure}[#1]%
  \capstart% July 2005, to make hyperref jump here  
   \centering
    %
   \settowidth{\csfigurewidth}{\hbox{\csepsffile[#3]{#2}}}%    
   \begin{minipage}[t]{\csfigurewidth}
    \setlength\fboxsep{0mm}%
    \colorbox{figurebackgroundcolor}{\csepsffile[#3]{#2}}   
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
    \caption{#4}%    
    \protect\label{#2}%
   \end{minipage} 
    %
    \hspace*{#5}
    % 
   \settowidth{\csfigurewidth}{\hbox{\csepsffile[#7]{#6}}}%    
   \begin{minipage}[t]{\csfigurewidth}
    \setlength\fboxsep{0mm}%
    \colorbox{white}{\csepsffile[#7]{#6}}   
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
    \caption{#8}%     
    \protect\label{#6}%
   \end{minipage} 
  \end{figure}}%  
  
% --- Figure per i cristalli:
  
\def\cstextfoto#1{\vbox to 1em{\csepsffile{#1}\vss}\protect\label{#1}}
% not sure whether this one counts the figures
 
\def\crystaltwofoto#1#2[#3]#4#5{% fa DUE figure con DUE leggende
% uso: \crystaltwofoto{primofilename}{Questa e` la prima}[distance]
%      {secondfilenam}{la seconda leggenda}  
  \begin{figure}[h]% "t" is added by latex anyway ...
   \capstart% to make hyperref jump here  
   \centering
   %
   \settowidth{\csfigurewidth}{\hbox{\csepsffile[scale=1]{#1}}}%    
   \begin{minipage}[t]{\csfigurewidth}
    \hbox{\csepsffile[scale=1]{#1}}   
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
    \caption{#2}%    
    \protect\label{#1}%
   \end{minipage} 
   % 
   \hspace*{#3}
   %
   \settowidth{\csfigurewidth}{\hbox{\csepsffile[scale=1]{#4}}}%    
   \begin{minipage}[t]{\csfigurewidth}
    \hbox{\csepsffile[scale=1]{#4}}   
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
    \caption{#5}%     
    \protect\label{#4}%
   \end{minipage} 
  \end{figure}}%  
  
\def\crystalthreefoto#1#2[#3]#4#5[#6]#7#8{% fa TRE figure con TRE leggende
% uso: \crystalhrteefoto{primofilename}{Questa e` la prima}[distance]
%      {secondfilenam}{la seconda leggenda}[distance]  
%      {thirdfilenam}{la terzy leggenda}  
  \begin{figure}[h]% "t" is added by latex anyway ...
   \capstart% to make hyperref jump here  
   \centering
   %
   \settowidth{\csfigurewidth}{\hbox{\csepsffile[scale=0.9]{#1}}}%    
   \begin{minipage}[t]{\csfigurewidth}
    \hbox{\csepsffile[scale=0.9]{#1}}   
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
    \caption{#2}%    
    \protect\label{#1}%
   \end{minipage} 
   % 
   \hspace*{#3}
   %
   \settowidth{\csfigurewidth}{\hbox{\csepsffile[scale=0.9]{#4}}}%    
   \begin{minipage}[t]{\csfigurewidth}
    \hbox{\csepsffile[scale=0.9]{#4}}   
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
    \caption{#5}%     
    \protect\label{#4}%
   \end{minipage} 
   % 
   \hspace*{#6}
   %
   \settowidth{\csfigurewidth}{\hbox{\csepsffile[scale=0.9]{#7}}}%    
   \begin{minipage}[t]{\csfigurewidth}
    \hbox{\csepsffile[scale=0.9]{#7}}   
  \setlength{\belowcaptionskip}{0pt}%  June 2011
  \setlength{\abovecaptionskip}{6pt}%  
    \caption{#8}%     
    \protect\label{#7}%
   \end{minipage} 
  \end{figure}}%  
  
%----- \section{Figure piccole, sistema Springer } ---------------------------
%      uso :    
%        \cssmallepsf{i-file}{scale=0.5}{....caption....}[optional:psfrag]
%        \cssmallepsfnb{i-file}{scale=0.5}{....caption....} 
%        \cssmallepsfnonum{i-file}{scale=0.5}{....caption....} 
%      updated Jun 2011

\newsavebox{\picturebox}

% Sep 2007
\def\cssmallepsf#1#2#3{\@ifnextchar[%
{\@cssmallepsfcshelp{#1}{#2}{#3}}{\@cssmallepsfcshelp{#1}{#2}{#3}[]}}
% Sep 2007
\def\@cssmallepsfcshelp#1#2#3[#4]{
\begin{figure}[t]  % Added in Nov 2008, to avoid p!
  \capstart% July 2005, to make hyperref jump here  
  \sbox{\picturebox}{#4\colorbox{figurebackgroundcolor}%
  {\def\message##1{\relax}\includegraphics[#2]{Images/#1}}}
  \setlength{\csfigurewidthtwo}{\wd\picturebox}%
  \setlength\columnsep{8pt}
  \setlength{\csfigurewidth}{\textwidth-\columnsep-\csfigurewidthtwo}%
  \begin{center}
    \begin{minipage}[t]{\csfigurewidthtwo}
      #4\relax{\usebox{\picturebox}}
    \end{minipage}
    \hfill
    \begin{minipage}[b]{\csfigurewidth}
      \setlength{\belowcaptionskip}{0pt}%
      \setlength{\abovecaptionskip}{-5.95pt}% positions (DIFF.!) the side caption
      \caption{#3\relax\label{#1}\relax}% caption uses csfigurewidth  
    \end{minipage}
  \end{center}
\end{figure}
}

% positions the side captions, ``-large value'' is DEEPER than ``-small value''
\def\csnbabovecaptionskip{\setlength{\abovecaptionskip}{-3.7pt}\setlength{\belowcaptionskip}{0pt}}

% small epsf  NO grey BACKGROUND 
% uso:      per le figure delle persone o per foto piccole
\def\cssmallepsfnb#1#2#3{\@ifnextchar[%
{\@csnbsmallepsfcshelp{#1}{#2}{#3}}{\@csnbsmallepsfcshelp{#1}{#2}{#3}[]}}
\def\@csnbsmallepsfcshelp#1#2#3[#4]{
\begin{figure}[t]  % Added in Nov 2008, to avoid p!
  \capstart% July 2005, to make hyperref jump here  
   \sbox{\picturebox}{{\def\message##1{\relax}\includegraphics[#2]{Images/#1}}}
  \setlength{\csfigurewidthtwo}{\wd\picturebox}%
  \setlength\columnsep{8pt}
  \setlength{\csfigurewidth}{\textwidth-\columnsep-\csfigurewidthtwo}%
  \begin{center}
    \begin{minipage}[t]{\csfigurewidthtwo}
       \begin{psfrags}%
        #4\relax%
     \hbox to \csfigurewidthtwo{\csepsffile[#2]{#1}\hss}% NEW IN APR 2014
%      {\usebox{\picturebox}}
       \end{psfrags}%
    \end{minipage}
    \hfill
    \begin{minipage}[b]{\csfigurewidth}
      \csnbabovecaptionskip% positions the side caption 
      \caption{#3\relax\label{#1}\relax}% caption uses csfigurewidth  
    \end{minipage}
  \end{center}
\end{figure}
}

% Oct 2016: NARROW epsf, NO grey BACKGROUND, FULL PAGE
% uso:      solo una volta, per la foto alta e stretta dei pianeti
\def\cssmallepsfnbfp#1#2#3{\@ifnextchar[%
{\@csnbsmallepsfcshelpfp{#1}{#2}{#3}}{\@csnbsmallepsfcshelpfp{#1}{#2}{#3}[]}}
\def\@csnbsmallepsfcshelpfp#1#2#3[#4]{
\begin{figure}[p]% Changed Oct 2016
  \capstart% July 2005, to make hyperref jump here  
   \sbox{\picturebox}{{\def\message##1{\relax}\includegraphics[#2]{Images/#1}}}
  \setlength{\csfigurewidthtwo}{\wd\picturebox}%
  \setlength\columnsep{8pt}
  \setlength{\csfigurewidth}{\textwidth-\columnsep-\csfigurewidthtwo}%
  \begin{center}
    \vspace*{-21 mm}% New Oct 2016 - FIXED PARAMETER!
    \begin{minipage}[b]{\csfigurewidthtwo} % Changed Oct 2016
       \begin{psfrags}%
        #4\relax%
     \hbox to \csfigurewidthtwo{\csepsffile[#2]{#1}\hss}% NEW IN APR 2014
       \end{psfrags}%
    \end{minipage}
    \hfill
    \begin{minipage}[b]{\csfigurewidth}
      \csnbabovecaptionskip% positions the side caption 
      \caption{#3\relax\label{#1}\relax}% caption uses csfigurewidth  
    \end{minipage}
  \end{center}
\end{figure}
}


% ****************************************
% *        FILMS/MOVIES                  *
% ****************************************
% WATCH OUT: 
% (Distiller needs absolute file names, else it bombs)
% (ps2pdf needs relative file names, else it bombs)

\newbox\csmoviebox

% Feb 2015: I define an extra command that allows to take movies out
\def\csincludemovie#1#2#3{\includemovie[#1,text={#2}]{}{}{#3}}
% use: #1: other settings, #2: image file, #3: movie file

% uso: {epsphoto}{scale=1}{5mm}{film}{scale=1}{caption}   -  Dec 2006
\newcommand{\csepsfandfilmofatom}[6]{% used only once, in vol 4 
  \begin{figure}[t]%
  \setlength{\csfigurewidth}{\textwidth}%
  \capstart% July 2005, to make hyperref jump here  
  \centering%
  \includegraphics[#2]{Images/#1.eps}%
%
\hskip #3
%
% \includemovie[playerid=AAPL_QuickTime,autoplay,controls,repeat,
% text={\includegraphics[#5]{\filmfolder/#4.eps}}]{}{}{\filmfolder/#4.mov}
\csincludemovie{playerid=AAPL_QuickTime,autoplay,controls,repeat}%
{\includegraphics[#5]{\filmfolder/#4.eps}}{\filmfolder/#4.mov}
\bigskip % room for controls
%
  \caption{#6}\protect\label{#1}%
  \end{figure}%
}

% uso: {epsphoto}{scale=1}{5mm}{film}{scale=1}{caption}  -  Dec 2006
\newcommand{\csepsfandfilmofmuscle}[6]{% used only once, in vol 5
  \begin{figure}[t]%
  \setlength{\csfigurewidth}{\textwidth}%
  \capstart% July 2005, to make hyperref jump here  
\centering\hbox to \textwidth{\hss%
\includegraphics[#2]{Images/#1.eps}%
%
\hskip #3%
%
%\includemovie[playerid=AAPL_QuickTime,autoplay,controls,repeat,
%text={\includegraphics[#5]{\filmfolder/#4.eps}}]{}{}{\filmfolder/#4.mov}%
\csincludemovie{playerid=AAPL_QuickTime,autoplay,controls,repeat}%
{\includegraphics[#5]{\filmfolder/#4.eps}}{\filmfolder/#4.mov}%
\hss}%
\bigskip % room for controls
%
  \caption{#6}\protect\label{#1}%
  \end{figure}%
}

% !!!1 Dec 2016: not good
% NEW IN NOV 2007
%  uso: \csmpgfilm{filename}{scale=1}{Questa e` la descrizione del film.} 
\def\csmpgfilm{\@ifnextchar[{\@csmpgmovie}{\@csmpgmovie[t]}} 
\def\@csmpgmovie[#1]#2#3#4{% 
\begin{figure}[t]  % Changed from tp to t in Dec 2016
  \capstart% July 2005, to make hyperref jump here  
  \setbox\csmoviebox\hbox{\includegraphics[#3]{\filmfolder/#2.eps}}
  \setlength{\csfigurewidthtwo}{\wd\csmoviebox}
  \setlength{\csfigurewidth}{\textwidth-\columnsep-\csfigurewidthtwo}%
  \begin{center}
    \begin{minipage}[t]{\csfigurewidthtwo}
       \hbox to \csfigurewidthtwo{\hss%
%             \includemovie[playerid=AAPL_QuickTime,autoplay,controls,%
%             text={\box\csmoviebox}]{}{}{\filmfolder/#2.mpg}%
             \csincludemovie{playerid=AAPL_QuickTime,autoplay,controls}%
             {\box\csmoviebox}{\filmfolder/#2.mpg}%
             \hss}%
       \bigskip  % room for controls
    \end{minipage}
    \hfill
    \begin{minipage}[b]{\csfigurewidth}
      \csnbabovecaptionskip% positions the side caption 
      \caption{#4\relax\label{#2}\relax}% caption uses csfigurewidth  
    \end{minipage}
  \end{center}
%
\end{figure}}%

% NEW IN MAR 2013
%  uso: \csmp4filmwide{filename}{scale=1}{Questa e` la descrizione del film.} 
\def\csmp4filmwide{\@ifnextchar[{\@csmp4moview}{\@csmp4moview[t]}} 
\def\@csmp4moview[#1]#2#3#4{% 
\begin{figure}[tp]
  \capstart% July 2005, to make hyperref jump here  
  \setbox\csmoviebox\hbox{\includegraphics[#3]{\filmfolder/#2.eps}}
  \setlength{\csfigurewidthtwo}{\textwidth}
  \setlength{\csfigurewidth}{\textwidth}%
  \begin{center}
    \begin{minipage}[t]{\csfigurewidthtwo}
       \hbox to \csfigurewidthtwo{\hss%
%             \includemovie[playerid=AAPL_QuickTime,autoplay,controls,%
%             text={\box\csmoviebox}]{}{}{\filmfolder/#2.mp4}%
             \csincludemovie{playerid=AAPL_QuickTime,autoplay,controls}%
             {\box\csmoviebox}{\filmfolder/#2.mp4}%
             \hss}%
       \bigskip  % room for controls
    \end{minipage}
    \hfill
    \begin{minipage}[b]{\csfigurewidth}
      \csnbabovecaptionskip% positions the side caption 
      \caption{#4\relax\label{#2}\relax}% caption uses csfigurewidth  
    \end{minipage}
  \end{center}
%
\end{figure}}%


% NEW IN NOV 2007
%  uso: \csmpgfilmrepeat{filename}{scale=1}{Questa e` la descrizione del film.} 
\def\csmpgfilmrepeat{\@ifnextchar[{\@csmpgmovierep}{\@csmpgmovierep[t]}} 
\def\@csmpgmovierep[#1]#2#3#4{% 
\begin{figure}[tp]
  \capstart% July 2005, to make hyperref jump here  
  \setbox\csmoviebox\hbox{\includegraphics[#3]{\filmfolder/#2.eps}}
  \setlength{\csfigurewidthtwo}{\wd\csmoviebox}
  \setlength{\csfigurewidth}{\textwidth-\columnsep-\csfigurewidthtwo}%
  \begin{center}
    \begin{minipage}[t]{\csfigurewidthtwo}
       \hbox to \csfigurewidthtwo{\hss%
%             \includemovie[playerid=AAPL_QuickTime,autoplay,controls,repeat,%
%             text={\box\csmoviebox}]{}{}{\filmfolder/#2.mpg}%
             \csincludemovie{playerid=AAPL_QuickTime,autoplay,controls,repeat}%
             {\box\csmoviebox}{\filmfolder/#2.mpg}%
             \hss}%
       \bigskip % room for controls
    \end{minipage}
    \hfill
    \begin{minipage}[b]{\csfigurewidth}
      \csnbabovecaptionskip% positions the side caption 
      \caption{#4\relax\label{#2}\relax}% caption uses csfigurewidth  
    \end{minipage}
  \end{center}
%
\end{figure}}%

% Nov 2007: for .mov=quicktime films
\def\csmovfilm{\@ifnextchar[{\@csmovmovie}{\@csmovmovie[t]}} 
\def\@csmovmovie[#1]#2#3#4{% 
\begin{figure}[tp] % Aug 2010
  \capstart% July 2005, to make hyperref jump here  
  \setbox\csmoviebox\hbox{\includegraphics[#3]{\filmfolder/#2.eps}}
  \setlength{\csfigurewidthtwo}{\wd\csmoviebox}
  \setlength{\csfigurewidth}{\textwidth-\columnsep-\csfigurewidthtwo}%
  \begin{center}
    \begin{minipage}[t]{\csfigurewidthtwo}
       \hbox to \csfigurewidthtwo{\hss%
%             \includemovie[playerid=AAPL_QuickTime,autoplay,controls,%
%             text={\box\csmoviebox}]{}{}{\filmfolder/#2.mov}%
             \csincludemovie{playerid=AAPL_QuickTime,autoplay,controls}%
             {\box\csmoviebox}{\filmfolder/#2.mov}%
             \hss}%
       \bigskip % room for controls
    \end{minipage}
    \hfill
    \begin{minipage}[b]{\csfigurewidth}
      \csnbabovecaptionskip% positions the side caption 
      \caption{#4\relax\label{#2}\relax}% caption uses csfigurewidth  
    \end{minipage}
  \end{center}
%
\end{figure}}%

% Oct 2011: for WIDE .mov=quicktime films  % used for ESO black hole film
\def\csmovfilmwide{\@ifnextchar[{\@csmovmovie}{\@csmovmovie[t]}} 
\def\@csmovmovie[#1]#2#3#4{% 
\begin{figure}[tp] % Aug 2010
  \capstart% July 2005, to make hyperref jump here  
  \setbox\csmoviebox\hbox{\includegraphics[#3]{\filmfolder/#2.eps}}
  \setlength{\csfigurewidthtwo}{\textwidth}
  \setlength{\csfigurewidth}{\textwidth}%
  \begin{center}
    \begin{minipage}[t]{\csfigurewidthtwo}
       \hbox to \csfigurewidthtwo{\hss%
%             \includemovie[playerid=AAPL_QuickTime,autoplay,controls,%
%             text={\box\csmoviebox}]{}{}{\filmfolder/#2.mov}%
             \csincludemovie{playerid=AAPL_QuickTime,autoplay,controls}%
             {\box\csmoviebox}{\filmfolder/#2.mov}%
             \hss}%
     %  \bigskip % room for controls
    \end{minipage}
  \end{center}
%
  \csnbabovecaptionskip% positions the side caption 
  \caption{#4\relax\label{#2}\relax}% caption uses csfigurewidth  
%
\end{figure}}%

% Aug 2010: for .mov=quicktime films in for volume 6 ... (belt trick)
\def\csmovfilmtt{\@ifnextchar[{\@csmovmoviett}{\@csmovmoviett[t]}} 
\def\@csmovmoviett[#1]#2#3#4{% 
\begin{figure}[t] % Aug 2010: changed tp to t for volume 6 ... (belt trick)
  \capstart% July 2005, to make hyperref jump here  
  \setbox\csmoviebox\hbox{\includegraphics[#3]{\filmfolder/#2.eps}}
  \setlength{\csfigurewidthtwo}{\wd\csmoviebox}
  \setlength{\csfigurewidth}{\textwidth-\columnsep-\csfigurewidthtwo}%
  \begin{center}
    \begin{minipage}[t]{\csfigurewidthtwo}
       \hbox to \csfigurewidthtwo{\hss%
%             \includemovie[playerid=AAPL_QuickTime,autoplay,controls,%
%             text={\box\csmoviebox}]{}{}{\filmfolder/#2.mov}%
             \csincludemovie{playerid=AAPL_QuickTime,autoplay,controls,repeat}%
             {\box\csmoviebox}{\filmfolder/#2.mov}%
             \hss}%
       \bigskip % room for controls
    \end{minipage}
    \hfill
    \begin{minipage}[b]{\csfigurewidth}
      \csnbabovecaptionskip% positions the side caption 
      \caption{#4\relax\label{#2}\relax}% caption uses csfigurewidth  
    \end{minipage}
  \end{center}
%
\end{figure}}%

% NEW IN NOV 2007: only for infinite .mov=quicktime films
\def\csmovfilmrepeat{\@ifnextchar[{\@csmovmovierep}{\@csmovmovierep[t]}} 
\def\@csmovmovierep[#1]#2#3#4{% 
\begin{figure}[t] % ``p'' taken out in Dec 2013; not wanted.
  \capstart% July 2005, to make hyperref jump here  
  \setbox\csmoviebox\hbox{\includegraphics[#3]{\filmfolder/#2.eps}}%
  \setlength{\csfigurewidthtwo}{\wd\csmoviebox}%
  \setlength\columnsep{8pt}%
  \setlength{\csfigurewidth}{\textwidth-\columnsep-\csfigurewidthtwo}%
  \begin{center}
    \begin{minipage}[t]{\csfigurewidthtwo}
       \hbox to \csfigurewidthtwo{\hss%
%             \includemovie[playerid=AAPL_QuickTime,autoplay,controls,repeat,%
%             text={\box\csmoviebox}]{}{}{\filmfolder/#2.mov}%
             \csincludemovie{playerid=AAPL_QuickTime,autoplay,controls,repeat}%
             {\box\csmoviebox}{\filmfolder/#2.mov}%
             \hss}%
       \bigskip % room for controls
    \end{minipage}
    \hfill
    \begin{minipage}[b]{\csfigurewidth}
      \csnbabovecaptionskip% positions the side caption 
      \caption{#4\relax\label{#2}\relax}% caption uses csfigurewidth  
    \end{minipage}
  \end{center}
%
\end{figure}}%

% NEW in Mar 2013: only for full width infinite .mov=quicktime films
\def\csmovfilmrepeatwide{\@ifnextchar[{\@csmovmovierepwide}{\@csmovmovierepwide[t]}} 
\def\@csmovmovierepwide[#1]#2#3#4{% 
\begin{figure}[t] % ``p'' taken out in Dec 2013; not wanted.
  \capstart% July 2005, to make hyperref jump here  
  \setbox\csmoviebox\hbox{\includegraphics[#3]{\filmfolder/#2.eps}}
  \setlength{\csfigurewidthtwo}{\textwidth}
  \setlength{\csfigurewidth}{\textwidth}%
  \begin{center}
    \begin{minipage}[t]{\csfigurewidthtwo}
       \hbox to \csfigurewidthtwo{\hss%
%             \includemovie[playerid=AAPL_QuickTime,autoplay,controls,repeat,%
%             text={\box\csmoviebox}]{}{}{\filmfolder/#2.mov}%
            \csincludemovie{playerid=AAPL_QuickTime,autoplay,controls,repeat}%
                   {\box\csmoviebox}{\filmfolder/#2.mov}%
            \hss}%
       \bigskip % room for controls
    \end{minipage}
    \hfill
    \begin{minipage}[b]{\csfigurewidth}
      \csnbabovecaptionskip% positions the side caption 
      \caption{#4\relax\label{#2}\relax}% caption uses csfigurewidth  
    \end{minipage}
  \end{center}
%
\end{figure}}%

% AUG 2009: only for infinite .swf=shockwave flash films
\def\csswffilmrepeat{\@ifnextchar[{\@csswfmovierep}{\@csswfmovierep[t]}} 
\def\@csswfmovierep[#1]#2#3#4{% 
\begin{figure}[tp]
  \capstart% July 2005, to make hyperref jump here  
  \setbox\csmoviebox\hbox{\includegraphics[#3]{\filmfolder/#2.eps}}
  \setlength{\csfigurewidthtwo}{\wd\csmoviebox}
  \setlength{\csfigurewidth}{\textwidth-\columnsep-\csfigurewidthtwo}%
  \begin{center}
    \begin{minipage}[t]{\csfigurewidthtwo}
       \hbox to \csfigurewidthtwo{\hss%
             % no Quicktime, as it cannot play swf files; shockwave is inside 
             % Adobe Reader
%             \includemovie[autoplay,controls,repeat,%
%             text={\box\csmoviebox}]{}{}{\filmfolder/#2.swf}%
             \csincludemovie{autoplay,controls,repeat}%
             {\box\csmoviebox}{\filmfolder/#2.swf}%
             \hss}%
       \bigskip % room for controls
    \end{minipage}
    \hfill
    \begin{minipage}[b]{\csfigurewidth}
      \csnbabovecaptionskip% positions the side caption 
      \caption{#4\relax\label{#2}\relax}% caption uses csfigurewidth  
    \end{minipage}
  \end{center}
%
\end{figure}}%

% Mar 2014: for u3d files -revised, only used once!
% Jan 2018: Now ok
%                I have read the movie15.pdf manual (Appendix A)
%                and did what is written there!
%
% File da rotare con il mouse     uso: \csuuudfile{filename}
\def\csuuudfile{\@ifnextchar[{\@csuuud}{\@csuuud[t]}} % no grey background
%
\def\@csuuud[#1]#2#3#4{% 
\begin{figure}[tp]
  \capstart% July 2005, to make hyperref jump here  
  \setbox\csmoviebox\hbox{\includegraphics[#3]{\filmfolder/#2.eps}}
  \setlength{\csfigurewidthtwo}{\wd\csmoviebox}
  \setlength{\csfigurewidth}{\textwidth-\columnsep-\csfigurewidthtwo}%
  \begin{center}
    \begin{minipage}[t]{\csfigurewidthtwo}
       \hbox to \csfigurewidthtwo{\hss%
%             \includemovie[poster,toolbar, %label=#2,
%              text={\box\csmoviebox}]{}{}{\filmfolder/#2.u3d}%
             \csincludemovie{poster,toolbar,label=justonce,% watch out with
                                             % the label: it is fixed!
% "Parameter Sichtfeld": Camera angle in degrees
3Daac=30.0,%
% Rollwinkel, 0= senkrecht / normal
% 3Droll=0.60,%
% "Ziel":
3Dcoo=-0.10466662049293518 -0.005163189955055714 0.12729299068450928,
%
3Droo=0.6077027042477956,
% 
3Dc2c=-0.9743406176567078 0 0.22507867217063904,
%
3Dlights=Cube
}%
%
%
%                      3Dc2c=-0.11 -0.99 0.15,
%                       % "Ziel":
%                       3Dcoo=-0.46 9.88 0.38}%
{\box\csmoviebox}{\filmfolder/#2.u3d}%
\hss}%
       \bigskip  % room for controls
    \end{minipage}
    \hfill
    \begin{minipage}[b]{\csfigurewidth}
      \csnbabovecaptionskip% positions the side caption 
      \caption{#4\relax\label{#2}\relax}% caption uses csfigurewidth  
    \end{minipage}
  \end{center}
%
\end{figure}}%

%  uso: \cselectrowavefilm[t]{folie7}{folie8}{folie9}{scale=0.8}{3mm}{caption}
%  used in file 3, just once
\def\cselectrowavefilm[#1]#2#3#4#5#6#7{\begingroup% 
\setlength{\csfigurewidth}{\textwidth}
\begin{figure}[#1]%
  \capstart% July 2005, to make hyperref jump here  
  \hbox to \textwidth{\hss%
%\includemovie[playerid=AAPL_QuickTime,autoplay,controls,%repeat,%
%text={\includegraphics[#5]{\filmfolder/#2.eps}}%
%]{}{}{\filmfolder/#2.mpg}%
\csincludemovie{playerid=AAPL_QuickTime,autoplay,controls}%
{\includegraphics[#5]{\filmfolder/#2.eps}}{\filmfolder/#2.mpg}%
\hskip #6%
%
%\includemovie[playerid=AAPL_QuickTime,autoplay,controls,%repeat,%
%text={\includegraphics[#5]{\filmfolder/#3.eps}}%
%]{}{}{\filmfolder/#3.mpg}%
\csincludemovie{playerid=AAPL_QuickTime,autoplay,controls}%
{\includegraphics[#5]{\filmfolder/#3.eps}}{\filmfolder/#3.mpg}%
\hskip #6%
%
%\includemovie[playerid=AAPL_QuickTime,autoplay,controls,%repeat,%
%text={\includegraphics[#5]{\filmfolder/#4.eps}}%
%]{}{}{\filmfolder/#4.mpg}%
\csincludemovie{playerid=AAPL_QuickTime,autoplay,controls}%
{\includegraphics[#5]{\filmfolder/#4.eps}}{\filmfolder/#4.mpg}%
\hss}%  
  \bigskip % room for controls
  \caption{#7}%
  \label{#2}%
\end{figure}\endgroup}

%  uso: \cselectro-rotpolfilm[t]{lin-pol}{cir-pol}{scale=0.8}{3mm}{caption} 
\def\cselectrorotpolfilm[#1]#2#3#4#5#6{\begingroup% 
%  used in file 3, just once
\setlength{\csfigurewidth}{\textwidth}
\begin{figure}[#1]%
  \capstart% July 2005, to make hyperref jump here  
  \hbox to \textwidth{\hss%
%\includemovie[playerid=AAPL_QuickTime,autoplay,controls,%repeat,%
%text={\includegraphics[#4]{\filmfolder/#2.eps}}%
%]{}{}{\filmfolder/#2.mov}%
\csincludemovie{playerid=AAPL_QuickTime,autoplay,controls}%
{\includegraphics[#4]{\filmfolder/#2.eps}}{\filmfolder/#2.mov}%
%
\hskip #5%
%
%\includemovie[playerid=AAPL_QuickTime,autoplay,controls,%repeat,%
%text={\includegraphics[#4]{\filmfolder/#3.eps}}%
%]{}{}{\filmfolder/#3.mov}%
\csincludemovie{playerid=AAPL_QuickTime,autoplay,controls}%
{\includegraphics[#4]{\filmfolder/#3.eps}}{\filmfolder/#3.mov}%
\hss}%  
  \bigskip % room for controls
  \caption{#6}%
  \protect\label{#2}%
\end{figure}\endgroup}
   

% ****************************************
% *             TABLES                   *
% ****************************************

%      uso:  
% {\small
% \begin{table}[t] % [] is optional
% \small
% \centering
% \caption{Books about motion found in a public library}
% \label{molitab}
% \dirrtabular
% \begin{tabular}{|l|c|r|} % anche { @{}c c c@{}}
% OR
% \dirrtabularstar
% \begin{tabular*}{\textwidth}{@{} p{65mm} @{\extracolsep{\fill}} p{70mm} @{}}
%
% \toprule
% %
% \tabheadf{Motion topics} & \tabhead{Something else} \\[0.5mm]
% %
% \midrule
%               ... \cstabhlinedown\\  % per spazio tra il testo e la hline
%               \hline\cstabhlineup    % per spazio tra la hline e il testo
%               ... & ... &  \\
%               \multicolumn{2}{c}{item}
% \bottomrule
% \end{tabular*}
% \end{table}
% }
%
% OR
% \tablenotetotextsep
%
% Blabla ..bnlabla ..
% }
%
% NEVER start a table line or a column with a \hbox ! That gives empty lines!
% NEVER start a table line or a column with a \iin ! That gives empty lines!
% (the second, but not the first `never' is now corrected (Sep 2005))

% % % \heavyrulewidth=0.075em%.08em   % Dirr
% % % \lightrulewidth=0.04em%.05em    % Dirr

% (OK) TESTING (Apr 2006)
\heavyrulewidth=0.03em%.08em   % Dirr
\lightrulewidth=0.01em%.05em    % Dirr

% % March 2014:
% Nachdem Du jetzt drucken lÃ¤sst, kÃ¶nnten wir auch absolute Werte nehmen. Gibt
% es vom Dienstleister irgendwelche Angaben zu LinienstÃ¤rken? Im Offset-Druck
% wÃ¼rde ich 0,17 mm und 0,3 mm empfehlen. Evtl. muss aber die feinere Linie
% stÃ¤rker sein, also 0,2 mm (0,01 em entspricht bei 10 pt genau 0,1 mm). Dann
% wÃ¤re zu Ã¼berlegen, ob der Unterschied zu 0,3 mm ausreicht oder ob man nicht
% sicherheitshalber auf 0,35 mm erhÃ¶ht, aber Gefahr lÃ¤uft, dass die Linie zu
% fett erscheint.
% 
% Einen Drucktest kann man nicht machen, oder?
% 
% Ciao
% Ulrich
% 
% P.S. die "klassische" stumpffeine Linie ist 0,15 mm, eine 1 Punkt fette
% Linie entspricht 0,376 mm.

% These are for booktabs, but Dirr does not like the values
% \abovetopsep=5pt     % default=0
% \aboverulesep=1.2 ex % default=0.4 ex (above mid and bott rules)
% \belowrulesep=1.5 ex % default=0.65 ex (above top and mid rules)
% \belowbottomsep=5pt  % default=0

\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp} 
% from latex companion p.  108
\let\PBS=\PreserveBackslash

% \tabhead is defined above
\def\tabheadf#1{\multicolumn{1}{@{}l@{}}{\tabhead{#1}}} % p does not work
\def\tabheadfp#1{\tabhead{#1}}
% Aug 2017: it seems that I can drop the use of these two. 

\newsavebox{\cshelpbox}   % used for narrow tables in the text

\renewcommand{\table}{%   
% no need for \capstart here - is done automatically
\def\citefmp##1{{\scriptsize\sf ##1}}%cs
%\let\@makecaption\@maketablecaption%
\@float{table}}

\def\tablenotetotextsep{{\vspace{3mm}}}
\def\tableboxtonotesep{{\vspace{3mm}}}   

\@removefromreset{table}{chapter} %cs not resetting table numbers at every
                                  %chapter
\def\thetable{\arabic{table}}     %cs no chapter numbers

%\def\fnum@table{{Table~\thetable}} %cs

%----- per longtable ---- attenzione alle parentesi quadre qui sotto:
%                         il [l] Ã¨ necessario per evitare errori!
% uso: 
%     {\small
%     \begin{longtable}[l]{|l|c|r|} % anche { \zz c c c \zz}
%        \caption[...]{...} \\
%           {\bf interaction}   &  size   & observed  \\
%        \hline\cstabhlineshift 
%        \endfirsthead
%           {\bf interaction}   &  size   & observed  \\
%        \hline\cstabhlineshift 
%        \endhead
%        \label{..} % sempre dopo \endhead, se no multiple labels ...
%           ... \cstabhlinedown\\  % per spazio tra il testo e la hline
%           \hline\cstabhlineup    % per spazio tra la hline e il testo
%           ... & ... &  \\
%           \multicolumn{2}{c}{item}
%     \end{longtable}
%     %
%     \tablenotetotextsep
%     \np $a$. Note text
%     %
%     \tablenotetotextsep
%     } % end of small

% Tried to comment out in Sep 2015, but left in:

\def\longtable{\par
  \ifx\multicols\@undefined
  \else
     \ifnum\col@number>\@ne
       \@twocolumntrue
     \fi
  \fi
  \if@twocolumn
    \LT@err{longtable not in 1-column mode}\@ehc
  \fi
  %cs:
    \def\citefmp##1{{\scriptsize\sf ##1}}           
  %cs
  \begingroup
  \@ifnextchar[\LT@array{\LT@array[x]}}

%----- per colori nelle tavole ----

%% Define \arrayrulecolor identical to colortbl defs.
   \AtBeginDocument{%
   \ifx\arrayrulecolor\@undefined
      \def\arrayrulecolor#1#{\CT@arc{#1}}
      \def\CT@arc#1#2{%
         \ifdim\baselineskip=\z@\noalign\fi
         {\gdef\CT@arc@{\color#1{#2}}}}
      \let\CT@arc@\relax
   \fi}
   
\def\toprule{\arrayrulecolor{hks15}\noalign{\ifnum0=`}\fi
  \@aboverulesep=\abovetopsep
  \global\@belowrulesep=\aboverulesep %global cos for use in the next noalign
  \global\@thisruleclass=\@ne
  \@BTrule[\heavyrulewidth]}
\def\bottomrule{\arrayrulecolor{hks15}\noalign{\ifnum0=`}\fi
  \@aboverulesep=\aboverulesep
  \global\@belowrulesep=\belowbottomsep
  \global\@thisruleclass=\@ne
  \@BTrule[\heavyrulewidth]}
\def\midrule{\arrayrulecolor{hks15}\noalign{\ifnum0=`}\fi
  \@aboverulesep=\aboverulesep
  \global\@belowrulesep=\belowrulesep
  \global\@thisruleclass=\@ne
  \@BTrule[\lightrulewidth]}
  
%% Add color support to the three booktabs drawing
%% routines, using the colortbl mechanism.

\def\@BTnormal{%
      {\CT@arc@\hrule\@height\@thisrulewidth}%
      \futurenonspacelet\@tempa\@BTendrule}
\def\@cmidrulea{%
      \multispan\@cmidla&\multispan\@cmidlb
      \unskip\hskip\cmrkern@l%
      {\CT@arc@\leaders\hrule \@height\@thisrulewidth\hfill}%
      \hskip\cmrkern@r\cr}
\def\@cmidruleb{%
     \multispan\@cmidlb
     \unskip\hskip \cmrkern@l%
     {\CT@arc@\leaders\hrule \@height\@thisrulewidth\hfill}%
     \hskip\cmrkern@r\cr}


% ****************************************
% *     CROSS  REFERENCES                *
% ****************************************

%      uso:     It is well known\cite{pamdir,einst} that ...

%cs from latex: \def\@cite#1#2{[{#1\if@tempswa , #2\fi}]}
\renewcommand{\@cite}[2]{\citefmp{#1}\if@tempswa{, #2}\else\fi}
% No Ref. here!

\def\citen#1{{%
\def\@cite##1##2{{##1\if@tempswa , ##2\fi}}%
\cite{#1}%
% le mie note sul margine; secondo il latex companion, pagina 373
% attenzione: sono diverse nelle captions e nelle tavole.
\renewcommand{\@cite}[2]{\citefmp{\MM@ref~##1}\if@tempswa{, ##2}\else\fi}%
}}

\def\citecs #1-#2/{{%
\def\@cite##1##2{{##1\if@tempswa , ##2\fi}}
\citefmp{\MM@ref~\cite{#1}--\cite{#2}}%
% le mie note sul margine; secondo il latex companion, pagina 373
% attenzione: sono diverse nelle captions e nelle tavole.
\renewcommand{\@cite}[2]{\citefmp{\MM@ref~##1}\if@tempswa{, ##2}\else\fi}%
}}

% per il testo; \citefmp e` diverso nelle \footnote e nei floats:
% \def\citefmp#1{\mbox{}\marginpar[\raggedleft\hspace{0pt}\scriptsize\sf 
% #1]{\raggedright\hspace{0pt}\scriptsize\sf #1}} 

% % I had to copy this, because \@mparswitchfalse does not work
% % with  marginnote.sty: 
% \renewcommand*{\@mn@margintest}{%
%   \expandafter\ifx\csname @mn@thispage\endcsname\@empty
%     \gdef\@mn@atthispage{1}%
%   \else\expandafter\ifnum \@mn@thispage=\value{mn@abspage}%
%       \begingroup
%         \@tempcnta\@mn@atthispage\advance\@tempcnta by \@ne
%         \xdef\@mn@atthispage{\the\@tempcnta}%
%       \endgroup
%     \else
%       \gdef\@mn@atthispage{1}%
%     \fi
%   \fi
%   \xdef\@mn@thispage{\themn@abspage}%
%   \let\@mn@currpage\relax
%   \let\@mn@currxpos\relax
%   \if@mn@pdfmode
%     \pdfsavepos
%     \protected@write\@auxout{\let\themn@abspage\relax}{%
%       \string\newmarginnote{note.\@mn@thispage.\@mn@atthispage}{%
%         {\themn@abspage}{\noexpand\number\pdflastxpos sp}}%
%     }%
%   \else
%     \protected@write\@auxout{\let\themn@abspage\relax}{%
%       \string\newmarginnote{note.\@mn@thispage.\@mn@atthispage}{%
%         {\themn@abspage}{}}%
%     }%
%   \fi
%   \expandafter\ifx\csname mn@note.\@mn@thispage.\@mn@atthispage\endcsname\relax
%     \if@twoside
%       \if@mn@verbose
%         \PackageInfo{marginnote}{Suggest that margin
%           note \@mn@thispage.\@mn@atthispage\space will be on\MessageBreak
%           absolute page \themn@abspage.\MessageBreak
%           This may be wrong}%
%       \fi
%       \ifodd\value{mn@abspage}\@tempswatrue\else\@tempswafalse\fi
%     \else
%       \if@mn@verbose
%         \PackageInfo{marginnote}{right page because not two side mode}%
%       \fi
%       \@tempswatrue
%     \fi
%   \else
%     \edef\@mn@currpage{\csname
%       mn@note.\@mn@thispage.\@mn@atthispage\endcsname}%
%     \edef\@mn@currxpos{\expandafter\@secondoftwo\@mn@currpage}%
%     \edef\@mn@currxpos{\the\dimexpr \@mn@currxpos -\hoffset\relax}%
%     \begingroup\expandafter\expandafter\expandafter\endgroup
%     \expandafter\ifx\csname pdfhorigin\endcsname\relax\else
%       \begingroup\expandafter\expandafter\expandafter\endgroup
%       \expandafter\ifx\csname pdfoutput\endcsname\relax\else
%         \ifnum \pdfoutput=1 %
%           \edef\@mn@currxpos{\the\dimexpr \@mn@currxpos -\pdfhorigin
%             +1in\relax}%
%         \fi
%       \fi
%     \fi
%     \edef\@mn@currpage{\expandafter\@firstoftwo\@mn@currpage}%
%     \if@mn@verbose
%       \PackageInfo{marginnote}{Margin note \@mn@thispage.\@mn@atthispage\space
%         is on absolute page \@mn@currpage\MessageBreak}%
%     \fi
%     \if@twoside
%       \ifodd\@mn@currpage\relax
%         \@tempswatrue
%       \else
%         \@tempswafalse
%       \fi
%     \else
%       \if@mn@verbose
%         \PackageInfo{marginnote}{right page because not two side mode}%
%       \fi
%       \@tempswatrue
%     \fi
%   \fi
% % cs: always left = tempswafalse if normalmarginpar
%       \@tempswafalse
% % cs: always left = tempswatrue if reversemarginpar
% }

% April 2020: new macros from marginnote hacked:
\renewcommand*{\@mn@margintest}{%
  \expandafter\ifx\csname @mn@thispage\endcsname\@empty
    \gdef\@mn@atthispage{1}%
  \else\expandafter\ifnum \@mn@thispage=\value{mn@abspage}%
      \begingroup
        \@tempcnta\@mn@atthispage\advance\@tempcnta by \@ne
        \xdef\@mn@atthispage{\the\@tempcnta}%
      \endgroup
    \else
      \gdef\@mn@atthispage{1}%
    \fi
  \fi
  \xdef\@mn@thispage{\themn@abspage}%
  \let\@mn@currpage\relax
  \let\@mn@currxpos\relax
  \mn@savepos
  \protected@write\@auxout{\let\themn@abspage\relax}{%
    \string\newmarginnote{note.\@mn@thispage.\@mn@atthispage}{%
      {\themn@abspage}{\noexpand\number\mn@lastxpos sp}}%
  }%
  \expandafter\ifx\csname mn@note.\@mn@thispage.\@mn@atthispage\endcsname\relax
    \if@twoside
      \if@mn@verbose
        \PackageInfo{marginnote}{Suggest that margin
          note \@mn@thispage.\@mn@atthispage\space will be on\MessageBreak
          absolute page \themn@abspage.\MessageBreak
          This may be wrong}%
      \fi
      \ifodd\value{mn@abspage}\@tempswatrue\else\@tempswafalse\fi
    \else
      \if@mn@verbose
        \PackageInfo{marginnote}{right page because not two side mode}%
      \fi
      \@tempswatrue
    \fi
  \else
    \edef\@mn@currpage{\csname
      mn@note.\@mn@thispage.\@mn@atthispage\endcsname}%
    \edef\@mn@currxpos{\expandafter\@secondoftwo\@mn@currpage}%
    \ifx\@mn@currxpos\@empty\else
      \edef\@mn@currxpos{\the\dimexpr \@mn@currxpos -\hoffset\relax}%
      \begingroup\expandafter\expandafter\expandafter\endgroup
      \expandafter\ifx\csname pdfhorigin\endcsname\relax\else
        \begingroup\expandafter\expandafter\expandafter\endgroup
        \expandafter\ifx\csname pdfoutput\endcsname\relax
          \begingroup\expandafter\expandafter\expandafter\endgroup
          \expandafter\ifx\csname outputmode\endcsname\relax\else
            \ifnum \outputmode=1 %
              \edef\@mn@currxpos{\the\dimexpr \@mn@currxpos -\pdfhorigin
                +1in\relax}%
            \fi
          \fi
        \else
          \ifnum \pdfoutput=1 %
            \edef\@mn@currxpos{\the\dimexpr \@mn@currxpos -\pdfhorigin
              +1in\relax}%
          \fi
        \fi
      \fi
      \ifdefined\mn@pagewidth
        \@mn@if@RTL{%
          \PackageInfo{marginnote}{Margin note
            \@mn@thispage.\@mn@atthispage\space in RTL mode}%
          \edef\@mn@currxpos{%
            \the\dimexpr\mn@pagewidth-\@mn@currxpos\relax
          }%
        }{}%
      \fi
    \fi
    \edef\@mn@currpage{\expandafter\@firstoftwo\@mn@currpage}%
    \if@mn@verbose
      \PackageInfo{marginnote}{Margin note \@mn@thispage.\@mn@atthispage\space
        is on absolute page \@mn@currpage}%
    \fi
    \if@twoside
      \ifodd\@mn@currpage\relax
        \@tempswatrue
        \if@twocolumn
          \ifdim \@mn@currxpos
                 < \dimexpr\oddsidemargin+\columnwidth+\columnsep\relax
            \@tempswafalse
          \fi
        \fi
      \else
        \@tempswafalse
        \if@twocolumn
          \ifdim\@mn@currxpos>\dimexpr\evensidemargin+\columnwidth\relax
            \@tempswatrue
          \fi
        \fi
      \fi
    \else
      \if@mn@verbose
        \PackageInfo{marginnote}{right page because not two side mode}%
      \fi
      \@tempswatrue
      \if@twocolumn
        \ifdim \@mn@currxpos
               < \dimexpr\oddsidemargin+\columnwidth+\columnsep\relax
          \@tempswafalse
        \fi
      \fi
    \fi
  \fi
% cs: always left = tempswafalse if normalmarginpar
       \@tempswafalse
% cs: always left = tempswatrue if reversemarginpar
}


% -----------------------------------------------------------------

% Feb 2010: makes marginal notes also in places where marginpar does not work
\edef\marginnotetextwidth{\the\textwidth}
\newsavebox\csmarginnotebox % Nasty trick used because marginnote is buggy

% Feb 2010: tricky. Defined in such a way that it can also be used in
% lulu.sty. Without lulu, only the second part of the marginnote,
% between *normal* brackets, is used, due to the       \@tempswafalse 
% added a few lines ago. (The % before the square br. is not necessary)
% With lulu.tex, also the part between *square* brackets is used:

% Watch out when you test this: it needs SEVERAL Latex passes to work 
% correctly.


\def\citefmp#1{\sbox{\csmarginnotebox}{\makebox{\scriptsize\sf #1}}%
\mbox{}\marginnote%[\raggedright\hspace{0pt}\usebox{\csmarginnotebox}]%
{\raggedleft\hspace{0pt}\usebox{\csmarginnotebox}}} 

%\def\citefmp#1{\marginnote{\sf #1}} % Dream definition ...


% -----------------------------------------------------------------
   
% These make links in the text - and depend on the LANGUAGE
\def\appendixref#1{{\hyperref[#1]{Appendix~\ref*{#1}}}}
\def\chapterref#1{{\hyperref[#1]{Chapter~\ref*{#1}}}}  % never used, Oct 2008, 2019: now used in vol6
  \def\tableref#1{{\hyperref[#1]{Table~\ref*{#1}}}}
 \def\figureref#1{{\hyperref[#1]{Figure~\ref*{#1}}}}
\def\figuresref#1{{\hyperref[#1]{Figures~\ref*{#1}}}}
 \def\cspageref#1{{\hyperref[#1]{page~\pageref*{#1}}}} 
 
% These make links in the margin - and depend on the LANGUAGE
% July 2005: Extra {} are needed (discovered by me), trick is by Oberdiek
\def\seepage#1{\citefmp{{\hyperref[#1]{Page~\pageref*{#1}}}}}
\def\seepaget#1#2{\citefmp{{\hyperref[#1]{Page~\pageref*{#1}},
       \hyperref[#2]{page~\pageref*{#2}}}}}
\def\seeapp#1{\citefmp{{\hyperref[#1]{Appendix~\ref*{#1}}}}} 
    % uso: As shown above,\seeapp{units} ..

% Oct 2011 - depends on the LANGUAGE
\def\seepagefivefootnote#1{\citefmpfootnote{{\hyperref[#1]{Page~\pageref*{#1}}}}}
% Oct 2011 % was not finished, must avoid higher line spacing
% Sep 2012 % added \smash below to see whether it improves the spacing OK
\def\citefmpfootnote#1{\sbox{\csmarginnotebox}{\makebox{\smash{\scriptsize\sf #1}}}%
\mbox{}\marginnote%[\raggedright\hspace{0pt}\usebox{\csmarginnotebox}]%
{\raggedleft\hspace{0pt}\usebox{\csmarginnotebox}}} 


% Jun 2010 Tricks by Ulrich Diez !.!3 testing - does not work
% Would allow to drop the macros \seepageone, seepagetwo etc and do it 
% automatically
%
% !-----------------------------------------------------------------!
% ! With this approach you need to attach the tokens                !
% ! \CSPageReferencePreludeInstructions and                         !
% ! \CSWriteOrProvidePageReferencePreludeStuff in front of the      !
% ! current definition-text of the \thepage-macro whenever \thepage !
% ! gets redefined e.g. by \frontmatter, \mainmatter, \backmatter,  !
% ! \appendix, \pagenumbering...                                    !
% !                                                                 !
% ! Doing this is the purpose of the \patchthepage-macro            !
% !                                                                 !
% !-----------------------------------------------------------------!

% \newcommand\patchthepage{%
%   \expandafter\renewcommand\expandafter*\expandafter\thepage
%   \expandafter{\expandafter\CSPageReferencePreludeInstructions\expandafter
%   \CSWriteOrProvidePageReferencePreludeStuff\thepage}%
%   \global\let\thepage\thepage
% }%
% \patchthepage

% \newcommand\CSWriteOrProvidePageReferencePreludeStuff{%
%   \ifx\protect\noexpand
%     \expandafter\@firstoftwo
%   \else
%     \expandafter\@secondoftwo
%   \fi
%   {\noexpand\CSPageReferencePreludeStuff}%
%   {\CSPageReferencePreludeStuff}%
% }%
% 
% \newcommand\CSPageReferencePreludeInstructions{%
%   \ifx\protect\noexpand
%     \expandafter\@secondoftwo
%   \else
%     \expandafter\@firstofone
%   \fi
%   {%
%     \ifx\protect\@unexpandable@protect
%       \expandafter\@secondoftwo
%     \else
%       \expandafter\@firstoftwo
%     \fi
%     {\@gobble}%
%   }%
%   {\noexpand\CSPageReferencePreludeInstructions}%
% }%

% \DeclareRobustCommand*\seepage{%
%   \@ifstar\@seepage@star\@seepage
% }
% \DeclareRobustCommand*\@seepage[1]{%
%   \begingroup
%   \let\CSPageReferencePreludeInstructions\@firstofone
%   \pageref{#1}%
%   \endgroup
% }
% \DeclareRobustCommand*\@seepage@star[1]{%
%   \begingroup
%   \let\CSPageReferencePreludeInstructions\@firstofone
%   \pageref*{#1}%
%   \endgroup
% }
% \newcommand\CSPageReferencePreludeStuff{}%
% \newcommand\CSsetPageReferencePrelude[1]{%
%   \renewcommand\CSPageReferencePreludeStuff{{#1}}
% }%

% Feb 2010: in last table of volume 6:
\def\seepageuu#1{\citefmpspecial{{\hyperref[#1]{Page~\pageref*{#1}}}}}%
\def\citefmpspecial#1{\sbox{\csmarginnotebox}{\makebox{\scriptsize\sf #1}}%
\mbox{}\marginnote%[\raggedright\hspace{0pt}\usebox{\csmarginnotebox}]%
{\raggedleft\hspace{0pt}\usebox{\csmarginnotebox}}}%

\def\seepagetoo#1#2{\citefmpspecial{{\hyperref[#1]{Page~\pageref*{#1}},
       \hyperref[#2]{page~\pageref*{#2}}}}}

% Aug 2009
\def\seepageone#1{\citefmp{{\hyperref[#1]{Vol. I, page~\pageref*{#1}}}}}
\def\seepagetwo#1{\citefmp{{\hyperref[#1]{Vol. II, page~\pageref*{#1}}}}}
\def\seepagethree#1{\citefmp{{\hyperref[#1]{Vol. III, page~\pageref*{#1}}}}}
\def\seepagefour#1{\citefmp{{\hyperref[#1]{Vol. IV, page~\pageref*{#1}}}}}
\def\seepagefive#1{\citefmp{{\hyperref[#1]{Vol. V, page~\pageref*{#1}}}}}
\def\seepagesix#1{\citefmp{{\hyperref[#1]{Vol. VI, page~\pageref*{#1}}}}}

%\def\present{\citefmp{time dependent statement\hss} }
\def\present{\relax}

%    uso: ... testo\challenge continua testo ...
%    uso: ... testo\challengn continua testo ...
% oppure: ... testo\challengenor{lab} continua testo ...

\newcounter {csanswercount} % answercounter
\newcounter {cschallengecount}   % total challenge counter

\newcounter {cschallengenycount} % not yet
\newcounter {cschallengrcount}   % research
\newcounter {cschallengdcount}   % difficult
\newcounter {cschallengscount}   % standard/normal
\newcounter {cschallengncount}   % easy
\newcounter {cschallengesolved}  % solved, see CAppendix.tex
\newcounter {cschallengetotal}   % defined in CAppendix.tex
\newcounter {cschallengeroot}    % defined as number near the square root 
                                 % of the total; must not divide total!
\setcounter{cschallengeroot}{17} % hand setting

% per i challenge ancora senza soluzione (ny) not yet
\def\challenge{\addtocounter{cschallengenycount}{1}%
\addtocounter{cschallengecount}{1}%
\refstepcounter{csanswercount}%
%\typeout{Not yet solved challenges (nycount) = \thecschallengenycount}%
\citefmp{\textcolor{cschallgraycolor}{{Challenge {\thecsanswercount} 
ny}}} } % lascia lo spazio

% per i challenge con soluzione, difficolta`  alta: (r) research
\def\challengeres#1{\addtocounter{cschallengrcount}{1}%
\addtocounter{cschallengecount}{1}%
\refstepcounter{csanswercount}%
%\typeout{Research challenges (rcount) = \thecschallengrcount}%
\label{c:#1}%
\citefmp{\hyperlink{sol:#1}{Challenge {\thecsanswercount}
r}}}

% per i challenge con soluzione, difficolta`  seria: (d) difficult
\def\challengedif#1{\addtocounter{cschallengdcount}{1}%
\addtocounter{cschallengecount}{1}%
\refstepcounter{csanswercount}%
%\typeout{Difficult challenges (dcount) = \thecschallengdcount}%
\label{c:#1}%
\citefmp{\hyperlink{sol:#1}{Challenge {\thecsanswercount}
d}}}

% per i challenge con soluzione, difficolta`  normale: (s) standard
\def\challengenor#1{\addtocounter{cschallengscount}{1}%%
\addtocounter{cschallengecount}{1}%
\refstepcounter{csanswercount}%
%\typeout{Standard challenges (scount) = \thecschallengscount}%
\label{c:#1}%
\citefmp{\hyperlink{sol:#1}{Challenge {\thecsanswercount}
s}}}

% per i challenge senza soluzione necessaria: (e) easy
\def\challengn{\addtocounter{cschallengncount}{1}%
\addtocounter{cschallengecount}{1}%
\refstepcounter{csanswercount}%
%\typeout{Easy challenges (ncount) = \thecschallengenycount}%
\citefmp{\textcolor{cschallgraycolor}{{Challenge \thecsanswercount\
e}}} } % lascia lo spazio


% ****************************************
% *            PAGE STYLES               *
% ****************************************

\def\bRM{\pdfliteral{0 0 0 1 k 0 0 0 1 K}}
\def\eRM{\pdfliteral{0 0 0 1 k 0 0 0 1 K}}

\newboolean{printermarks}
\setboolean{printermarks}{false}  % do NOT change it, it does not work
\newboolean{baselinegrid}
\setboolean{baselinegrid}{false}  % this DOES work, can be set to true

%\settimeformat{xxivtime}

% % needs count1to.sty - changed: doesn't work with hyperref
% %\newcommand\numpages{\ref{TotalPages}}
% % starred version for hyperref: won't create an active link
% \newcommand\numpages{\ref*{TotPages}}

% % % Apr 2006 commented out to save fontinfo
\def\ULIinfo{\relax}
% % \newcommand\Xhead{\fontsize{6pt}{6pt}\usefont{T1}{cmtt}{m}{n}}
% % \newcounter{pagecnt}            
% % \setcounter{pagecnt}{0}
% % \newcommand*\ULIinfo{%     % does NOT work with dvips
% %    \stepcounter{pagecnt}
% %    \unitlength1mm
% %    \begin{picture}(0,0)\thinlines
% %       \put(-100,-35){\makebox(0,0)[l]{\hbox to175mm{\bRM\Xhead
% %          \hbox to55mm{\Infoline\hss}\hfill
% %          \hbox to55mm{\hss\rcsInfoFile\ Rev.\rcsInfoRevision,\
% %             \rcsInfoDay.\rcsInfoMonth.\rcsInfoYear\ \rcsInfoTime\hss}\hfill
% %          \hbox to55mm{\hss Printed:\ \the\day.\the\month.\the\year\
% %             \currenttime}\eRM}}}
% %       \put(-100,245){\makebox(0,0)[l]{\hbox to175mm{\bRM\Xhead
% %          Art \& Satz \raise.5pt\hbox{\textbullet} Ulrich Dirr\hfill
% %          Seite \guillemotright\thepage\guillemotleft\
% %          \thepagecnt\ %\the\c@page\
% %          von \numpages\eRM}}}
% %    \end{picture}%
% % } 

%%% Headers and footers %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Have to be defined AFTER the page layout is setup. %%%%%%%%%%%%%%

\let\pdef\protected@edef

\newcommand\copyrightstring{{%  impr. & shortened Aug 2013
   \unitlength1mm%
   \begin{picture}(0,0)%
      \put(72,9){\rotatebox{-90}{\makebox(0,0)[rc]{% rechts unten platziert
	 \href{http://www.motionmountain.net}{%
	 \textcolor{graythirty}{\fontsize{6pt}{6pt}\selectfont\sffamily
	 Motion Mountain -- The Adventure of Physics
	 \quad copyright \textcopyright\ Christoph
	 Schiller 
         % November 1997 % corrected date in April 2012
	 June 1990--\csmonyea\quad free pdf file 
         available at {www.motionmountain.net}}}}}}%
   \end{picture}%
}}

% % % Apr 2006 commented out to save fontinfo (was by Ulrich Dirr)
\def\Grid{\relax}
% % \newcommand{\Grid}{%
% %    \unitlength1pt
% %    \begin{picture}(0,0)
% %       \thinlines
% % %     \footskip+\textheight+\topskip+\headsep 26+585+10+19.5=640.5
% %       \put(216,640.5){\color{graythirty}\line(-1,0){480}\color{black}}
% % %     \footskip+\textheight+\topskip 26+572+10=621
% %       \put(216,621){\color{graythirty}\line(-1,0){480}\color{black}}
% % %     \footskip + \textheight 26+585=611
% %       \put(216,611){\color{graythirty}\line(-1,0){480}\color{black}}
% %       \put(216,611){\Xhead1}
% % %     \footskip=26
% %       \put(216,26){\color{graythirty}\line(-1,0){480}\color{black}}
% %       \put(216,26){\Xhead46}
% %    \end{picture}
% % }

% uso: \pagestyle{plain}, oppure \thispagestyle{headings}, etc.
   
% Watch out: \paragraph contains a \thispagestyle{plain}!

\fancypagestyle{plain}{%                 cs: used for title pages
   \fancyhf{}% clear all header and footer fields
   \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}%
      \copyrightstring}}
   
\fancypagestyle{empty}{%
   \fancyhf{}% clear all header and footer fields
   \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}}}
          
%      film nell'angolo  
%      0   : niente
%      I   : i random patterns,
%      I   : il sasso che viene gettato contro un albero che si avvicina,
%      II  : l'elettrone che sbatte contro lo schermo e collassa,
%      III : il verme che si muove nella maglia.
%      Appendici: niente

\fancypagestyle{contheadings}{%            used for contents
   \fancyhf{}% clear all header and footer fields
   \fancyhead[RE]{\small\scshape contents}%
   \fancyhead[LO]{\small\scshape contents}%
   \fancyhead[RO]{{\figureversion{osf}\small\thepage}}
   \fancyhead[LE]{{\figureversion{osf}\small\thepage}}
   \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}\copyrightstring}}

\fancypagestyle{preface}{%                 used for preface
   \fancyhf{}% clear all header and footer fields
   \fancyhead[RE]{\small\scshape preface}%
   \fancyhead[LO]{\small\scshape preface}%
   \fancyhead[RO]{{\figureversion{osf}\small\thepage}}
   \fancyhead[LE]{{\figureversion{osf}\small\thepage}}
   \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}\copyrightstring}}

\fancypagestyle{advice}{%                 used for advice
   \fancyhf{}% clear all header and footer fields
   \fancyhead[RE]{\small\scshape advice for learners}%
   \fancyhead[LO]{\small\scshape advice for learners}%
   \fancyhead[RO]{{\figureversion{osf}\small\thepage}}
   \fancyhead[LE]{{\figureversion{osf}\small\thepage}}
   \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}\copyrightstring}}
   
\fancypagestyle{request}{%                 used for request
   \fancyhf{}% clear all header and footer fields
   \fancyhead[RE]{\small\scshape a request}%
   \fancyhead[LO]{\small\scshape a request}%
   \fancyhead[RO]{{\figureversion{osf}\small\thepage}}
   \fancyhead[LE]{{\figureversion{osf}\small\thepage}}
   \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}\copyrightstring}}
   
\fancypagestyle{acknowledgements}{%        used for ackno         
   \fancyhf{}% clear all header and footer fields
   \fancyhead[RE]{\small\scshape acknowledgements}%
   \fancyhead[LO]{\small\scshape acknowledgements}%
   \fancyhead[RO]{{\figureversion{osf}\small\thepage}}
   \fancyhead[LE]{{\figureversion{osf}\small\thepage}}
   \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}\copyrightstring}}
   
\fancypagestyle{appetizer}{%               used for appetizer
   \fancyhf{}% clear all header and footer fields
   \fancyhead[RE]{\small\scshape an appetizer}%
   \fancyhead[LO]{\small\scshape an appetizer}%
%    \fancyhead[RE]{\figureversion{osf}1.\ \scshape an appetizer}%
%    \fancyhead[LO]{\figureversion{osf}1.\ \scshape an appetizer}%
   \fancyhead[RO]{{\figureversion{osf}\small\thepage}}
   \fancyhead[LE]{{\figureversion{osf}\small\thepage}}
   \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}\copyrightstring}}
      
\newcommand\nouppercase[1]{{%
 \let\uppercase\relax
 \let\MakeUppercase\relax
 \expandafter\let\csname MakeUppercase \endcsname\relax
 #1}}%
      
\def\cssimplify#1{{%
 \def\foreignlanguage##1##2{##2}
 #1}}%
      
\fancypagestyle{nomovieheadings}{% default  - no movie, used e.g. in appendices
   \fancyhf{}% clear all header and footer fields
   \fancyhead[RE]{\small\figureversion{osf}\MakeLowercase{\scshape\leftmark}}
   \fancyhead[LO]{\small\figureversion{osf}\MakeLowercase{\scshape\rightmark}}
   \fancyhead[RO]{{\figureversion{osf}\small\thepage}}
   \fancyhead[LE]{{\figureversion{osf}\small\thepage}}
   \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}\copyrightstring}}       

\fancypagestyle{nomovienocopyheadings}{% used only in vol6 with wide table
   \fancyhf{}% clear all header and footer fields
   \fancyhead[RE]{\small\figureversion{osf}\MakeLowercase{\scshape\leftmark}}
   \fancyhead[LO]{\small\figureversion{osf}\MakeLowercase{\scshape\rightmark}}
   \fancyhead[RO]{{\figureversion{osf}\small\thepage}}
   \fancyhead[LE]{{\figureversion{osf}\small\thepage}}
   \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}}}       


\fancypagestyle{leftmovieheadings}{% left movie, used in C2A
   \fancyhf{}% clear all header and footer fields
   \fancyhead[RE]{\small\figureversion{osf}\MakeLowercase{\scshape\leftmark}}
   \fancyhead[LO]{\small\figureversion{osf}\MakeLowercase{\scshape\rightmark}}
   \fancyhead[RO]{{\figureversion{osf}\small\thepage}}
   \fancyhead[LE]{{\figureversion{osf}\small\thepage}}
   \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}\copyrightstring}}       
   
\fancypagestyle{fimovieheadings}{% used in the first part, file C2B, film bis
   \fancyhf{}% clear all header and footer fields
   \fancyhead[RE]{\small\figureversion{osf}\MakeLowercase{\scshape\leftmark}}
   \fancyhead[LO]{\small\figureversion{osf}\MakeLowercase{\scshape\rightmark}}
   \fancyhead[RO]{{\figureversion{osf}\small\thepage}}
   \fancyhead[LE]{{\figureversion{osf}\small\thepage}}
   \fancyfoot[L]{\cs@filmonebis}%  sasso e albero
   \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}\copyrightstring}}
 
% Dec 2008
\def\thesmallchapter{\MakeLowercase{\thechapter}}
  
\fancypagestyle{twoheadings}{% used in Volume IV
   \fancyhf{}% clear all header and footer fields
   \fancyhead[RE]{\small\figureversion{osf}\MakeLowercase{\scshape\leftmark}}
   \fancyhead[LO]{\small\figureversion{osf}\MakeLowercase{\scshape\rightmark}}
   \fancyhead[RO]{{\figureversion{osf}\small\thepage}}
   \fancyhead[LE]{{\figureversion{osf}\small\thepage}}
   \fancyfoot[L]{\cs@twofilm}%
   \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}%
      \copyrightstring}%
   \renewcommand{\headrulewidth}{0mm}}
  
\fancypagestyle{threeheadings}{% used in ... future
   \fancyhf{}% clear all header and footer fields
   \fancyhead[RE]{\small\figureversion{osf}\MakeLowercase{\scshape\leftmark}}
   \fancyhead[LO]{\small\figureversion{osf}\MakeLowercase{\scshape\rightmark}}
   \fancyhead[RO]{{\figureversion{osf}\small\thepage}}
   \fancyhead[LE]{{\figureversion{osf}\small\thepage}}
   \fancyfoot[L]{\cs@threefilm}%
   \fancyfoot[C]{{THREE}\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}%
      \copyrightstring}%
   \renewcommand{\headrulewidth}{0mm}}
     
% This is a cryptic trick by Arseneau (Sept 2005) to get rid of 
% an eventual comma at the end of a string
\long\def\trimcomma#1{\TrimComma.#1\TrimComma,\TrimComma\TrimCommA}
\long\def\TrimComma#1,\TrimComma{\TrimCommA#1\TrimComma}
\long\def\TrimCommA#1\TrimComma#2\TrimCommA{\TrimCoMMA#1}
\def\TrimCoMMA#1{}

% Nov 2007, Feb 2015: 
% This command is used only in motionmountain.ist (the index help file);
% it has limitations for exceptional index entries.
\def\csindexheading#1{{\sffamily\bfseries#1\hfil}\nopagebreak%
\edef\csindexfirstletter{#1}}
   
\def\csfirstletterof#1#2\delimiter{#1}

\fancypagestyle{nameindex}{\fancyhf{}% used in name index, of course
 \renewcommand\headrule{\relax}%  
 %%%%%%%% Left side or right/odd pages:
 \fancyhead[LO]{{\hbox to 0pt{\hss\vbox to 0pt{\vspace*{57mm}\hbox to
 0pt{\Huge\sffamily{% now the cleaning commands:
 \def\foreignlanguage####1####2{####2}\def\textit####1{####1}%
 \def\textsmaller####1{####1}\def\protect{}\def\bbb####1{}% 
 \edef\cshelpx{\firstrightmark}\edef\csdgfgsf{\cshelpx}% 
% \typeout{NISR: --- \firstrightmark ---- \csdgfgsf  -------- }%
\MakeUppercase{\expandafter\csfirstletterof\csdgfgsf\delimiter}%
}\hss}\hbox to 0pt{\rule[0.4mm]{10mm}{0.5mm}\hss}\hbox to
 0pt{{\def\foreignlanguage####1####2{####2}\def\textit####1{####1}%
 \def\textsmaller####1{####1}\def\protect{}\def\bbb####1{}% 
 \edef\cshelpx{\firstrightmark}\edef\csdgfgsf{\cshelpx}% 
 \scshape{\expandafter\trimcomma\expandafter{\csdgfgsf}}}\hss}\vss}\hspace{32mm}}%
 {\small\scshape name index}}}%
 %%%%%%%%
 \fancyhead[RO]{{\small\figureversion{osf}\thepage}}%   
 %%%%%%%% Left side on left/even pages:
 \fancyhead[LE]{{\hbox to 0pt{\hss\vbox to 0pt{\vspace*{57mm}\hbox to
 0pt{\Huge\sffamily{% now the cleaning commands:
 \def\foreignlanguage####1####2{####2}\def\textit####1{####1}%
 \def\textsmaller####1{####1}\def\protect{}\def\bbb####1{}% 
 \edef\cshelpx{\firstrightmark}\edef\csdgfgsf{\cshelpx}% 
% \typeout{NISL: --- \firstrightmark ---- \csdgfgsf  -------- }%
\MakeUppercase{\expandafter\csfirstletterof\csdgfgsf\delimiter}%
}\hss}\hbox to 0pt{\rule[0.4mm]{10mm}{0.5mm}\hss}\hbox to
 0pt{{\def\foreignlanguage####1####2{####2}\def\textit####1{####1}%
 \def\textsmaller####1{####1}\def\protect{}\def\bbb####1{}% 
 \edef\cshelpx{\firstrightmark}\edef\csdgfgsf{\cshelpx}% 
 \scshape{\expandafter\trimcomma\expandafter{\csdgfgsf}}}\hss}\vss}\hspace{32mm}}%
 \small\figureversion{osf}\thepage}}%
 %%%%%%%
 \fancyhead[RE]{\small\scshape name index}%
 %%%%%%%%
 \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}\copyrightstring}%
%
\renewcommand{\headrulewidth}{0mm}%  
}

% Dec 08: tested in detail
\fancypagestyle{subjectindex}{\fancyhf{}% used in subject index, of course
 \renewcommand\headrule{\relax}%
 % Left side, left/even pages:
 \fancyhead[LE]{{\hbox to 0pt{\hss\vbox to 0pt{\vspace*{57mm}\hbox to 
 0pt{\Huge\sffamily{% now the cleaning commands:
% % %  \def\protect{} \edef\cshelpx{\rightmark}% this is the first step
\def\foreignlanguage####1####2{####2}\def\textit####1{####1}%
\def\textsmaller####1{####1}\def\protect{}\def\bbb####1{}% 
\edef\cshelpx{\rightmark}%%%%%\edef\csdgfgsf{\cshelpx}% 
%%%%\typeout{SIL2: --- \cshelpx ---------- }%
%%%%\typeout{SIL22: --- \expandafter\csfirstletterof\cshelpx\delimiter ---------- }%
 \MakeUppercase{\expandafter\csfirstletterof\cshelpx\delimiter}%
}\hss}\hbox to 0pt{\rule[0.4mm]{10mm}{0.5mm}\hss}\hbox to
 0pt{{\def\foreignlanguage####1####2{####2}\def\textit####1{####1}%
 \def\textsmaller####1{####1}\def\protect{}\def\bbb####1{}% 
 \edef\cshelpx{\rightmark}%%%%%\edef\csdgfgsf{\cshelpx}% 
 \scshape{\expandafter\trimcomma\expandafter{\cshelpx}}}\hss}\vss}\hspace{32mm}}%
 \small\figureversion{osf}\thepage}}%
%
 \fancyhead[RE]{\small\scshape subject index}%
%Left side, right/odd pages
 \fancyhead[LO]{{\hbox to 0pt{\hss\vbox to 0pt{\vspace*{57mm}\hbox to 
 0pt{\Huge\sffamily{% now the cleaning commands:
%%%%\def\protect{} \def\cshelpx{\rightmark}% this is the first step
\def\foreignlanguage####1####2{####2}\def\textit####1{####1}%
\def\textsmaller####1{####1}\def\protect{}\def\bbb####1{}% 
\edef\cshelpx{\rightmark}%%%%%\edef\csdgfgsf{\cshelpx}% 
%%%%\typeout{SIR2: --- \cshelpx ---------- }%
%%%%\typeout{SIR22: --- \expandafter\csfirstletterof\cshelpx\delimiter ---------- }%
\MakeUppercase{\expandafter\csfirstletterof\cshelpx\delimiter}%
}\hss}\hbox to 0pt{\rule[0.4mm]{10mm}{0.5mm}\hss}\hbox to
 0pt{{\def\foreignlanguage####1####2{####2}\def\textit####1{####1}%
 \def\textsmaller####1{####1}\def\protect{}\def\bbb####1{}% 
 \edef\cshelpx{\rightmark}%%%%%%\edef\csdgfgsf{\cshelpx}% 
%%%%\typeout{SIR3: --- \cshelpx ---------- }%
%%%%\typeout{SIR33: --- \expandafter\csfirstletterof\cshelpx\delimiter ---------- }%
 \scshape{\expandafter\trimcomma\expandafter{\cshelpx}}}\hss}\vss}\hspace{32mm}}%
 \small\scshape subject index}}%
%
 \fancyhead[RO]{\small\figureversion{osf}\thepage}%   
%
% All pages:
 \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}\copyrightstring}%
%
\renewcommand{\headrulewidth}{0mm}%  
}

\fancypagestyle{nameindexstart}{\fancyhf{}%
 \renewcommand\headrule{\relax}%
 % Left, even pages:
 \fancyhead[LE]{{\hbox to 0pt{\hss\vbox to 0pt{\vspace*{57mm}%
 \hbox to 0pt{\Huge\sffamily{A}\hss}%
 \hbox to 0pt{\rule[0.4mm]{10mm}{0.5mm}\hss}%
 \hbox to 0pt{{%
 \scshape{\csnastynameindexthelp}}\hss}\vss}\hspace{32mm}}%  
 }}%
 % Right, odd pages: 
 \fancyhead[RO]{\hbox to 0pt{\hss\vbox to 0pt{\vspace*{57mm}%
 \hbox to 0pt{\Huge\sffamily{A}\hss}%
 \hbox to 0pt{\rule[0.4mm]{10mm}{0.5mm}\hss}%
 \hbox to 0pt{{%
 \scshape{\csnastynameindexthelp}}\hss}\vss}\hspace{32mm}}% 
 }%
   \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}\copyrightstring}%
%
\renewcommand{\headrulewidth}{0mm}%  
}

\fancypagestyle{subjectindexstart}{\fancyhf{}% no large letter, because of 
                                             % symbol graphics
 \renewcommand\headrule{\relax}%
 % Left, even pages:
 \fancyhead[LE]{{\hbox to 0pt{\hspace*{-32mm}\vbox to 0pt{\vspace*{57mm}%
 \hbox to 0pt{\csepsffile{i-udirrsym}\hss}%
 \vss}\hss}}}%
 % Left, odd pages: 
 \fancyhead[LO]{{\hbox to 0pt{\hspace*{-32mm}\vbox to 0pt{\vspace*{57mm}%
 \hbox to 0pt{\csepsffile{i-udirrsym}\hss}%
 \vss}\hss}}}%
 %
   \fancyfoot[C]{\ifthenelse{\boolean{baselinegrid}}{\Grid}{}%
      \ifthenelse{\boolean{printermarks}}{\ULIinfo}{}\copyrightstring}%
%
\renewcommand{\headrulewidth}{0mm}%  
}


% ****************************************
% *    FLIP CORNER MOVIES/FILMS          *
% ****************************************     OK Jun 2011, Dec 2014
   
% Nov 04: il primo film e` in motionmountain.tex, scritto in puro postscript;
% percio` non uso questo:
% \newcounter {cscornerone}[part]   % per il film, viene rimesso a zero in \part
% \def\cs@filmone{\addtocounter{cscornerone}{2}} % end of \cs@filmone
				 
% Nov 04: Il secondo film, del sasso con l'albero    
\newcounter {csy}
\newcounter {csxhelp}
\newcounter {csyhelp}
\newcounter {cscorner}[part] % conta le immagini, viene rimesso a zero in \part

% questo comando viene usato in alto
\def\cs@filmonebis{\addtocounter{cscorner}{1}% Il film con il sasso e l'albero
\ifnum\c@cscorner>45\relax\else  % the number 45 is the number of figures
	%                          at 45 it hits the tree
	\vbox to 0pt{\vskip 20mm\hbox{%
        \hbox to 0pt{\hskip -40mm\smash{%  must be 0.5 mm more than below
	% a parabola with the point (0, yz) and the maximum at (xm,ym)
	% has the form Y= ym - (x-xm)^2 * (ym-yz)/xm^2
	% and we have x=cscorner
        \psset{yunit=0.004cm,xunit=0.004cm}%
	\begin{pspicture}(0,0)(500,500)% but drawn also for higher numbers
        \parabola[linestyle=dashed,dash=2.5pt](0, 40)(300, 200)% (0,yz)(xm,ym)
        \setcounter{csxhelp}{10*\value{cscorner}}%
	\psframe[linestyle=none,fillstyle=solid,fillcolor=white](\the\c@csxhelp,0)(600,600)
	% was not perfect: integer calculation -- so I inserted a factor ten
	% everywhere ...
        \setcounter{csy}{200-(10*\value{cscorner}-300)*(10*\value{cscorner}-300)*%
                   %(20-4)/30/30  later: 200-40 / 300 / 300 %
                   16/9000}%
	\pscircle[linestyle=none,fillstyle=solid,fillcolor=black]%
	(\the\c@csxhelp,\the\c@csy){0.05}
        \end{pspicture}%
        }\hss}%
        %
        \hbox to 0pt{\hskip -40.5mm\smash{% must be 0.5 mm less than above
            \csepsffile{i-part1fig1}}\hss}%
			       }\vss}%end of vbox
\fi}

% Nov 04: il film del collasso quantistico:
\newcounter {csnfig}
\def\cs@twofilm{\addtocounter{cscorner}{1}%  
\psset{yunit=0.4cm,xunit=0.4cm}%
\setcounter{csnfig}{50}% the number is the number of figures
\ifnum\c@cscorner>\c@csnfig\relax% we draw nothing afterwards
\else% until then, we draw the movie
%
\def\cs@cscorner{\the\c@cscorner \space }% 
%
\ifnum\c@cscorner<40  % the first part of the movie: departing
% 
\vbox to 0pt{\vskip 3mm% postive is downwards (-5 is too high)
\hbox to 0pt{\hspace*{-33mm}\smash{% positive is to the right (-13 is too mtt r)
\rotatebox{270}{%
\begin{pspicture}(-3,0)(3,1)
  \psline[linecolor=black, linewidth=0.5pt](-3,6)(3,6)  % schermo
  \psplot[linecolor=black, linewidth=0.5pt]{-3}{3}{%
    /sigma 0.2 def
    /e 2.718282 def
    /cstim \cs@cscorner 20 div def
    /tta x cstim add dup mul def
    /ttb x cstim neg add dup mul def
    /curva e tta 2 div sigma dup mul div neg exp 1.1 mul def
    /curvb e ttb 2 div sigma dup mul div neg exp 1.1 mul def
    curva curvb add cstim 3 mul add
    }
  \pscircle[linecolor=black, linewidth=0.5pt](0,0){0.05} % sorgente
\end{pspicture}%
}}\hss}%
\vss}%end of vbox
%
\relax\else % the second part of the movie: collapsing   
% 
\vbox to 0pt{\vskip 1mm% postive is downwards (-5 is too high)
\hbox to 0pt{\hspace*{-33mm}\smash{% positive is to the right (-13 is too mtt r)
\rotatebox{270}{%
\begin{pspicture}(-3,0)(3,1)
  \psline[linecolor=black, linewidth=0.5pt](-3,6)(3,6)  % schermo
  \psplot[linecolor=blue, linewidth=0.5pt]{-3}{3}{%
    /sigma 0.2 def
    /e 2.718282 def
    /cstim \cs@cscorner 20 div def
    /tta x 2 add dup mul def
    /ttb x 2 neg add dup mul def
    /curva e tta 2 div sigma dup mul div neg exp 5 cstim -2 mul add mul def
    /curvb e ttb 2 div sigma dup mul div neg exp -3 cstim 2 mul add mul def
    curva curvb add 2 3 mul add
    }
  \pscircle[linecolor=black, linewidth=0.5pt](0,0){0.05} % sorgente
\end{pspicture}%
}}\hss}%
\vss}%end of vbox
% 
\fi\fi}
			   
% Il film della terza parte, il verme che si muove nella maglia, da fare? !.!4
\def\cs@threefilm{\addtocounter{cscorner}{1}%  
       \hbox to 0pt{\hskip 4mm\smash{%
       %{\csepsffile{i-part1leftfig1}}}
       \hss}}}
   
% ****************************************
% *        MICROTYPOGRAPHY               *
% ****************************************     OK Jun 2011, Dec 2014

%%% Spatien
\newcommand\spatium[1]{\kern#1em}
\def\thinspace{\kern.16667em}
\newcommand\tinyspace{\kern.1em}

\def\cp{\hbox to 0pt{\;{.}\hss}}      
\def\cvend{\hbox to 0pt{\;{,}\hss}}        
\def\csemi{\hbox to 0pt{\;{;}\hss}}        
\def\cv{\;{,}\;} 
\def\cscomma{\,} 

% I prefer this kind of ellipsis
\def\dots{...}\def\ldots{...} %cs overwrites the TeX definition

% OK in Minion, ugly in other fonts:
\def\csin{\in}
\def\cssubset{\subset}

% per parentesi piu` basse;   uso: \low (  oppure \low )
% per cifre minuscole
\def\lowpar#1{\raisebox{-0.09ex}{$#1$}}

\def\acrol{{\makeatletter @ \makeatother}}  % used in Appendix only
%\def\discrimination{demarcation}

%----- \subsection{Guillemets - OK} ----

\def\csllguill{{\fontencoding{T1}\selectfont\guillemotright}}
\def\csrrguill{{\fontencoding{T1}\selectfont\guillemotleft} }
% \def\cslguill{{\fontencoding{T1}\selectfont\guilsinglright}}
% \def\csrguill{{\fontencoding{T1}\selectfont\guilsinglleft} }
       
%%% -------------------------------
%%% Typesetting Physical Quantities
%%% -------------------------------

% uso:  \csd{3\cstimes10^{-34}}{kg^{2}/m}
% smash added in Sep 2012
\def\csd#1#2{\leavevmode\hbox{$\smash{#1}$}\,\hbox{${\smash{\mathrm{#2}}}$}}
% needs leavevmode to work when alone in a para (Nov 2004)
% old comment: leave the inner parentheses!
% smash added in Sep 2012
\def\csdunit#1{\leavevmode\hbox{${\smash{\mathrm{#1}}}$}}
\def\muunit{\hbox{\textmu}} % uso:\csd{5}{\muunit}
\def\muunitindex{\hbox{\small\textmu}} % Oct 2011
\let\cstimes\cdot

\def\csdegrees{\kern -0.1em\hbox{\textdegree}} % uso: \csd{5}{\csdegrees}
\def\csminutes{{{}^\prime}}                    % uso: \csd{5}{\csminutes}
\def\csseconds{{{}^{\prime\prime}}}            % uso: \csd{5}{\csseconds}
\let\csdegree\csdegrees % new in Oct 2014
\let\csminute\csminutes % new in Oct 2014 
\let\cssecond\csseconds % new in Oct 2014
% 
%\def\degC{\hbox{\textcelsius}} % uso:\csd{5}{\degC} % bug in MinionPro
\def\degC{\kern -0.1em\hbox{\textdegree{\kern 0.08em}C}} % uso:\csd{5}{\degC}
\def\degF{\kern -0.1em\hbox{\textdegree{\kern 0.02em}F}} % uso:\csd{5}{\degF}

\DeclareRobustCommand\cutlambda{% made more beautiful by me for Minion
  \bgroup
    \def\@tempa{%
      \hbox{%
        \raise.73\ht\z@
        \hb@xt@\z@{%
          \kern.32\wd\z@  %orig: 0.25
          \vrule \@width.5\wd\z@\@height.125\p@\@depth.125\p@ % orig 2 x 0.1
          \hss
        }%
        \box\z@
      }%
    }%
    \mathchoice
      {\setbox\z@\hbox{$\displaystyle     \lambda$}\@tempa}%
      {\setbox\z@\hbox{$\textstyle        \lambda$}\@tempa}%
      {\setbox\z@\hbox{$\scriptstyle      \lambda$}\@tempa}%
      {\setbox\z@\hbox{$\scriptscriptstyle\lambda$}\@tempa}%
  \egroup}%


% ****************************************
% *           HYPHENATION                *
% ****************************************     OK Jun 2011, Dec 2014

\hyphenation{every-day} % from David Penrose
\hyphenation{elec-tro-dy-na-mics}
\hyphenation{Schwarz-schild}
\hyphenation{acce-le-ra-tion}
\hyphenation{evolu-tion}

% from Ulrich Dirr
\hyphenation{after ana-lyse ana-lysed an-aly-sis ap-preci-ate
             cat-egory cham-pion cham-pion-ship
             dis-pos-ition
             earl-ier elim-in-ate elim-in-ated eng-lish es-ti-mate
             fabu-lous fam-ous feas-ible focus
             globe-trot-ting
             in-nov-ation in-nov-ations
             me-mor-ial mem-ory mem-ories mem-or-able
             news-paper
             order or-gan-isa-tion or-gan-isa-tions ori-gin-al
             para-dise par-tici-pant par-tici-pants par-ticu-lar
             people
             pos-ition pos-itions pos-ition-al pos-ition-al-ly
             pre-vi-ous pre-vi-ous-ly prom-ise prom-ises
             real-ly
             ser-ious sim-ul-tan-eous-ly
             the-or-et-ician trans-pos-ition trans-pos-itions
             under-stand-ing under-esti-mate
             vari-ation}

			 
% ****************************************
% *           HELPFUL MACROS             *
% ****************************************     OK Jun 2011

\def\se#1{} % Aug 2003: this one takes the serial comma out, as is standard  
	    % in British English; you can easily put them back in.
            % Dec 2014: I slowly take the command out; British is now standard

\let\np=\noindent

\def\csmonyea{\ifcase\month\or
   January\or February\or March\or April\or May\or June\or
   July\or August\or September\or October\or November\or December\fi
   \space \number\year}

\comment{ %
}% from comment


% ****************************************
% *  PACKAGES THAT MUST BE AT THE END    *
% ****************************************     OK Jun 2011, Dec 2014
   
% Options from Dec 2014 (DVIoutput not needed, because of pdfoutput=0)
\usepackage[protrusion=false,babel=true, kerning=true, verbose=silent,final]{microtype} % must be after MinionPro
% Added in Dec 2014:
% verbose=silent    gets rid of the stupid \j (dotless j) 
% kerning=true      allows apostrophe correction, see last command
% !.!3 This is untested on old desktop computer

% Out in Dec 2014: 
% This (probably) disables character protrusion:
% \g@addto@macro\verbatim{\pdfprotrudechars=0\relax}

% hyperref must be the ``last'' package - options checked in Dec 2006
\usepackage[pagebackref=true,
unicode=true, % NEW IN APRIL 2017 - NEEDED FOR VIETNAMESE
breaklinks=true, % Since Dec 2014 this gives a warning
ps2pdf,          % Works for ps2pdf and also for Distiller, !!!2 but not for Xelatex
hyperindex, 
pdfpagelabels=true, % Dirr
colorlinks, 
linkcolor=cslinkcolor,
anchorcolor=red,
citecolor=cscitecolor,
filecolor=csfilecolor,
urlcolor=csurlcolor,
menucolor=csmenucolor,
%pagecolor=cspagecolor, % outdated
plainpages=false, % Dirr
pdfhighlight=/I,
bookmarks=true,
bookmarksopen=false, % overwritten by package bookmark
bookmarksnumbered=true,  % overwritten by package bookmark
linktocpage=true,
extension={pdf},
pdfauthor={Christoph Schiller},
pdfsubject={The free physics textbook from http://www.motionmountain.net},
%pdfstartview={XYZ null null 1},
pdfstartview={Fit},
pdfnewwindow,
pdftitle={Motion Mountain - The Adventure of Physics}, 
pdfkeywords={physics, foundations, space, time, motion, fundamentals, 
vacuum, matter, relativity, quantum theory},
pdfpagemode=UseOutlines,
pdfcreator={The Author},
pdfproducer={The Author}]{hyperref}   % must be the ``last'' package

\usepackage[open,openlevel=0]{bookmark}   % for good pdf bookmarks; corrects hyperref 
% bug and limitations -  Feb 2010: changed from -1 to 0  (chapters)

\usepackage{breakurl}  % only works for dvips, must be after hyperref
                       
% These lines must be here - if not, some links are to file: instead of http:
% (Feb 2015)
\def\url#1{\burlalt{http://#1}{{#1}}}        % Jan 2009, very tricky! for dvips
\def\urlhttps#1{\burlalt{https://#1}{{#1}}}  % Feb 2014

\usepackage[safe]{tipa}  % New in Oct 2017, phonetic alphabet

\usepackage[hyperpageref]{backref}
\renewcommand*{\backref}[1]{}
\renewcommand*{\backrefalt}[4]{%
 \ifcase #1 %
     No citations.%
     \or
     Cited on page #2.%
     \else
     Cited on pages #2.%
     \fi}

\def\MM@ref{Ref.}  % Useful for other languages, added in May 2017

\def\hyper@natanchorend{\hyper@anchorend}
\@ifundefined{NAT@parse}{%
  \providecommand*\@extra@binfo{}%
  \providecommand*\@extra@b@citeb{}%
  \def\bibcite#1#2{%
    \@newl@bel{b}{#1\@extra@binfo}{%
      \hyper@@link[cite]{}{cite.#1\@extra@b@citeb}{#2}%
    }%
  }%
  \gdef\@extra@binfo{}%
  \let\Hy@bibcite\bibcite
  \begingroup
    \@ifundefined{bbl@cite@choice}{}{%
      \g@addto@macro\bbl@cite@choice{%
        \let\bibcite\Hy@bibcite
      }%
    }%
  \endgroup
  \providecommand*{\@BIBLABEL}{\@biblabel}%
  \def\@lbibitem[#1]#2{%
    \@skiphyperreftrue
    \H@item[%
      \ifx\Hy@raisedlink\@empty
        \hyper@anchorstart{cite.#2\@extra@b@citeb}%
          \@BIBLABEL{#1}%
        \hyper@anchorend
      \else
        \Hy@raisedlink{%
          \hyper@anchorstart{cite.#2\@extra@b@citeb}\hyper@anchorend
        }%
        \@BIBLABEL{#1}%
      \fi
      \hfill
    ]%
    \@skiphyperreffalse
    \if@filesw
      \begingroup
        \let\protect\noexpand
        \immediate\write\@auxout{%
          \string\bibcite{#2}{#1}%
        }%
      \endgroup
    \fi
    \ignorespaces
  }%
  \def\@bibitem#1{%
    \@skiphyperreftrue\H@item\@skiphyperreffalse
    \Hy@raisedlink{%
      \hyper@anchorstart{cite.#1\@extra@b@citeb}\relax\hyper@anchorend
    }%
    \if@filesw
      \begingroup
        \let\protect\noexpand
        \immediate\write\@auxout{%
          \string\bibcite{#1}{\MM@ref~\the\value{\@listctr}}%
        }%
      \endgroup
    \fi
    \ignorespaces
  }%
}{}

% Hypcap must be after hyperref; it adjusts hyper-jumps landing points to floats
\usepackage[all]{hypcap}     

% % !!!3 The following is not compatible with the pageref redefinition
% \usepackage{refcheck} % must be after hyperref
% \norefnames
% \nocitenames
% \ignoreunlbld
\gdef\usedref#1{\relax}   % better do this if the previous lines are commented out


% ****************************************
% *           INITIALIZATION             *
% ****************************************     OK Jun 2011, Dec 2014

% Initialization of headers
\pagestyle{plain}\fancyhf{}\renewcommand{\headrulewidth}{0mm}
\floatpagestyle{nomovieheadings} % New in Dec 2015 - avoids running head
                                 % issues in \csepsfnb[p]

% These commands seem to be necessary at the end of the file - for
% unknown reasons (Sep 2005) - New version of Dec 2008
\renewcommand{\chaptermark}[1]{\markboth%
    {\MakeLowercase{\sscshape#1}}{\MakeLowercase{\sscshape#1}}}
\renewcommand{\sectionmark}[1]{\markright{\MakeLowercase{\sscshape#1}}{}}

\makeindex           % leave here (!)

\setlength\overfullrule{0cm}
\scrollmode      
%\errorstopmode                        % only for debugging
\tracingstats=1                        % mostra le statistiche se = 1
\tracingonline=0                       % semplifica il log window
\showboxbreadth=0 \showboxdepth=0      % semplificano il logfile ...
\hbadness=10000 \vbadness=10000  % semplificano il logfile, senza altro effetto
  
% TAKEN OUT IN DEC 2014, makes problems; taking it out solved problems
%
% \def\pdfmdfivesum file #1{#1} % added Oct 2008: for the movies for DISTILLER
% This command was given to me by some Adobe developer.

\cmidrulekern=0pt % April 2010, from the booktabs manual
% Solves a line poblem in the appendix

\def\csmysubtitle{{The Adventure of Physics}}  % Different for the colour edition!

\renewcommand*{\appendixname}{Appendix}
\addto{\extrasenglish}{\def\appendixname{Appendix}}
\addto{\extrasbritish}{\def\appendixname{Appendix}}
\addto{\extrasbritish}{\def\appendixname{Appendix}}

\selectlanguage{british}     % was UKenglish until Dec 2014, then changed to british

\pagenumbering{arabic} 
\onecolumn 
\frenchspacing               % !!!1 Do I really want this in my book?
\normalsize
\normalfont

% Jan 2015: use these for double quotes 
% Note: I use \qq{Expression}, with double quotes, for HUMOUR; otherwise 
% I use single quotes.
%
% CS version of a latex package command for double quotes
\providecommand{\qq}[1]{{\textquotedblleft#1\/\textquotedblright}}

% New in Dec 2014 - !.!3 all this is not yet tested on my desktop:
% These microtype details extend the kerning after the apostrophe
% and after the single quote that I usually use.

\DeclareMicrotypeBabelHook{french,francais,acadian,canadien,italian}
{kerning=french,spacing=}

% The following commands still do not work in luatex in May 2020.
% 
% This command easily bombs: check all final commata!
\SetExtraKerning       % For french and italian !
   [ context  = french,
     unit     = space   ]
   { encoding = {OT1,T1,LY1} }
   {
    % :  = {1000,}, % = \fontdimen2
    % ;  = {500, }, % ~ \thinspace
    % !  = {500, },
    % ?  = {500, }, % cs: last line has no final comma
    '  = {200,200}, % these numbers add kerning before and after the '
    `  = {200,200}, % same for `
    \textquotedblright = {200,200},
    \textquotedblleft = {200,200},
    \textquoteright = {200,200},
    \textquoteleft = {200,200}
   }

% This command easily bombs: check all final commata!
\SetExtraKerning        % Works on laptop, for ENGLISH and other lang.
   [ unit     = space   ]
   { encoding = {OT1,T1,LY1} }
   {
    % :  = {1000,}, % = \fontdimen2
    % ;  = {500, }, % ~ \thinspace
    % !  = {500, },
    % ?  = {500, }  % cs: last line has no final comma
     '  = {100,200}, % these numbers add kerning before and after the '
     `  = {200,100}, % these numbers add kerning before and after it
    \textquotedblright = {100,200},
    \textquotedblleft = {200,100},
    \textquoteright = {100,200},
    \textquoteleft = {200,100}
   }

% Do not put lines with " in the above: it bombs with french language
% (But maybe I had forgot the final comma when I tried it?)

% ****************************************
% *      CONTENT SWITCHES FOR FREE PDF   *
% ****************************************
% All new in Aug/Nov/Dec 2016 

\def\createspacetitlewordout#1{#1}   % Createspace does not want "Cosmology"
                                     % in title, but default is with it
                                     % Createspace is now (2020) KDP Amazon

% In MotionMountain-Part1-Begin.tex
% In MotionMountain-Part2-Begin.tex
% etc. ...
\long\def\titolocolorato#1{#1}          % yes: coloured title image
\long\def\schmutztitel#1{\relax}        % no schmutz title
\long\def\paginabianca#1{#1}            % yes: white page
%\long\def\titolointeriore#1{\relax}     % no: interior title page
\long\def\titolointeriore#1{#1}         % yes: interior title page
\def\cstitrick{\relax}                  % for A4, on titolo interiore
\def\cstigiutrick{\relax}               % for A4
\def\kindleout#1{#1}                    % text remains in, normally (in Begin & End)
\long\def\normamco#1#2{#1}              % text is normally #1, but #2 for amco
                                        % used to change Adventure to Colours
                                        % and split volume 1 in two
\long\def\normafourbw#1#2{#1}           % text is normally #1, but #2 for a4bw
                                        % needed for Amazon: Edition -> Version

% In MotionMountain-Begin-Diritti.tex
\long\def\csfreepdfrights#1{#1}         % Yes: free pdf rights
\long\def\cssalerights#1{\relax}        % No use rights for book for sale
\def\cssalerightsshift{\relax}          % Free rights require no downwards shift

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                        %
%   The End of the Book   -  different for web, for a4-bw and for amco   %
%                                                                        %
%   These are the default settings, for the pdf version.                 %
%                                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\long\def\csnonameindexinprint#1{#1}          % Yes: printing the Name index is default

% In MotionMountain-Part1-End.tex
% In MotionMountain-Part2-End.tex
% etc. ...
\long\def\csjustonefinalinnerpage#1{#1}       % Yes: just one inner page is default
\long\def\csfinalinnerpagestoodd#1{\relax}    % No:  inner page(s) up to odd
\long\def\csfinalinnerpagestoeven#1{\relax}   % No:  inner page(s) up to even
\long\def\csfinalgreenpage#1{#1}              % Yes: final green page is default

% (OK) green links to solutions move to the resulting position one line too low!
% (OK) define \jupiter without loading wasysym
% (OK) find better \cal font
% (OK) there is a spacing bug in the macros that typeset author names in sc!
% (OK) check top alignement of all figures and tables, esp. on float pages 
% (OK) shorten ``Strich''
% (DID, he will not do it) ask Arseneau to add `lower n lines' option to wrapfig
% (OK) change footnote macro in quotes, so that the star is counted!
% (NO, I refuse) put most greek citations in italic! (from Alec Edgington)
% (OK) ISO says: indices must be roman when they do not refer to variables, e.g.
%           when the index is an abbreviation
% (NO) compare wrapfig - floatflt - picins (i tre packages per i floats) 
% (STARTED) use psfrag to put formulas/fonts into eps figures by subsituting a string
% (OK) add contents bookmark to the file
% (OK) two figures
% (OK) lowercase page headers 
% (OK) change footnote font master (says Zedler)
% (OK) marginpar always left
% (OK) captions in colour
% (OK) improve sqrt
% (OK) change list of figures and tables
% (OK) left and right adjusted {quote}, put author to the right!
% (OK) improve the short TOC: alignment of titles
% (OK) improve the long TOC: layout
% (OK) marginpars aussen, nicht innen
% (OK) Einzug= Schriftgroesse + Durchschuss
% (OK) dy/dx must have roman d's (says ISO)
% (OK) ISO says: eV is all roman.
% (OK) define a font and a way to handle all caps abbreviations
% (OK) use the acronym package
% (OK) put ``c.'' in italics
% (OK) add breaking URL with Zedler
% (OK) exchange eqnarray with align, use bmatrix and pmatrix
% (NO) usare braket.sty per la meccanica quantistica
% (OK) togliere tutti i comandi miei, e usare quelli di latex     
% (OK) della larghezza della tavola: vedi C-6!
% (NO) per esempio: inserire il sitema bibitem (p.e. cstimes -> cdot)
% (OK) use rgb for jpeg, use jpeg2eps - no I use pdflatex
% (OK) tell Blumesath about the aleph beth gamel dileth fonts ...
% (OK) controlla i backref in CAppendix.tex (se no, write Heiko Oberdiek)
% (NO) rifare le stellette delle mie note con font postscript a 6 punte
% (NO) mettere il linespacing a 1.311111 volte il font size
% (NO) vorrei (forse) le tavole in sans serif
% (OK) migliorare il font della dedica
% (OK) in bibliografia, mettere parindent per il SECONDO paragrafo, ecc.
% (OK) usare il postscript come dice Zedler - MINION PRO
% (OK) ridefinire \copyright senza cambio di fonts
% (N0) ridurre il font Myriad a 93.3333 %
% (OK) font dei capitoli troppo scuro
% (OK) font delle sezioni troppo grasso (semibold???) e troppo tondo
% (SO?) dettaglio: \medskip has a bad dimension: it makes a page into 
%      a underfull \vbox, at this moment
% (OK) Times e Helvetica non vanno bene insieme, dicono gli esperti;
%      meglio Monotype Baskerville & cmss e/o Gill sans
% (OK) da fare: dettagli di estetica mathematica: segni piu` piccoli, acrol 
%      piu` bassi
% (OK) distinguere le lettere greche e i segni matematici greci
%      and why does \mu look italic, whereas \nu does not?
% (OK) Barbara e Edgar dicono di fare figure piu` belle - se no si 
%      abbassa il livello del testo 
% (OK) chiedere a Barbara e Edgar di rendere piu` bello il layout.
% (OK) in motionmountain.pdf: poter clickare in acroread da un capitolo ad un'altro
% (OK) non funziona il bookmark forward
% (OK in motionmountain.pdf) non funzionano i link dal toc
% (OK in motionmountain.pdf) non funzionano i ref e backref in altri file    
% (OK) le referenze devono essere all'interno del testo, le figure all'esterno
% (OK)  mettere tutti i film a destra, nessuno a sinistra 
% (NO) oppure Optima e Sabon (also called Classical Garamond)
% (NO) non usare Sabon; troppo spreco di carta e di bytes per il font
%      \renewcommand{\rmdefault}{msb} 
% (NO) non voglio introdurre \provoc nel testo.
%-----------------------------------------------------------------------------
% Tschichold's ideas are marked JT.
% Tschichold wants section and subsection titles in \rm and \it. 
% He also wants \sc at start of sections and subsections. 
% He probably would not like my running titles and my \marginpars either.
%-----------------------------------------------------------------------------

\typeout{--------------------------------------------------------} 
\typeout{Finished reading the motionmountain.cls class file}
\typeout{--------------------------------------------------------} 
\endinput