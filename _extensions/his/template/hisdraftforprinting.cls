%%
%% Copyright 2016-2017 by Thomas Fischer <thomas.fischer@his.se>
%% Modified 2022 by Simon Lidberg <simon.lidberg@his.se>
%% 
%% This file has been released under the following license:
%% Creative Commons Attribution-Share Alike 4.0 Unported
%% (CC-BY-SA 4.0)
%%
%% hisdraftforprinting.cls is a LaTeX class to paper-efficiently print a dissertation
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hisdraftforprinting}[2016/11/14 University of Skovde Paper-efficiently Printing Dissertation class by Thomas Fischer]

\LoadClass{article}

%\RequirePackage{ifthen}% provides \ifthenelse and \newboolean

\newcommand{\missingparam}[1]{\colorbox{red!30}{{\normalfont\textbf{\textbackslash{}#1}\ not set}}}

\newcommand{\@seriesnumber}{\missingparam{seriesnumber}}
\newcommand{\seriesnumber}[1]{\renewcommand\@seriesnumber{#1}}

\newcommand{\@subtitle}{~}% subtitle cannot be empty, would give compilation errors
\newcommand{\@subtitleUC}{~}% subtitle cannot be empty, would give compilation errors
\newcommand{\subtitle}[1]{\renewcommand{\@subtitleUC}{\MakeUppercase{#1}}\renewcommand\@subtitle{#1}}

\newcommand\@subject{\missingparam{subject}}
\newcommand\subject[1]{\renewcommand\@subject{#1}}
\subject{Informatics}

\renewcommand{\@title}{\missingparam{title}}
\newcommand{\@titleUC}{\missingparam{title}}
\renewcommand{\title}[1]{\renewcommand{\@titleUC}{\MakeUppercase{#1}}\renewcommand{\@title}{#1}%
}
%
\renewcommand{\@author}{\missingparam{author}}
\newcommand{\@authorUC}{\missingparam{author}}
\renewcommand{\author}[1]{\renewcommand{\@authorUC}{\MakeUppercase{#1}}\renewcommand{\@author}{#1}%
}
%
\newcommand{\@dissertationarea}{\missingparam{dissertationarea}}
\newcommand{\dissertationarea}[1]{\renewcommand{\@dissertationarea}{#1}}
\dissertationarea{\@subject}
%
\newcommand{\@isbn}{\missingparam{isbn}}
\newcommand{\isbn}[1]{\renewcommand{\@isbn}{#1}}
%
\newcommand{\@printshop}{\missingparam{printshop}}
\newcommand{\printshop}[1]{\renewcommand{\@printshop}{#1}}
\printshop{Stema Specialtryck AB, Borås}

\newcommand{\@publicationtypelong}{\missingparam{publicationtypelong}}
\newcommand{\publicationtypelong}[1]{\renewcommand{\@publicationtypelong}{#1}}

\newcommand{\@publicationtype}{}
\newcommand{\publicationtype}[1]{%
	\renewcommand{\@publicationtype}{#1}%
}

% CHANGE Add partner company information and logo
\newcommand{\@partnercompany}{\missingparam{partnercompany}}
\newcommand{\partnercompany}[1]{\renewcommand{\@partnercompany}{#1}}

\newcommand{\@partnercompanylogo}{\missingparam{partnercompanylogo}}
\newcommand{\partnercompanylogo}[1]{\renewcommand{\@partnercompanylogo}{#1}}

% CHANGE Add thesis abstract for back cover and spik
\newcommand{\@thesissummary}{\missingparam{thesissummary}}
\newcommand{\thesissummary}[1]{\renewcommand{\@thesissummary}{#1}}

\newcommand{\@coverimage}{\missingparam{coverimage}}
\newcommand{\coverimage}[1]{\renewcommand{\@coverimage}{#1}}

\newcommand{\@coverphoto}{\missingparam{coverphoto}}
\newcommand{\coverphoto}[1]{\renewcommand{\@coverphoto}{#1}}

\input{metadata}

% For time stamp: \thistime
\RequirePackage{scrtime}

\RequirePackage[%
a4paper,% print on A4 paper
landscape% landscape mode to put two pages next to each other
]{geometry}
\RequirePackage{pdfpages}% package to include multi-page PDF files

\RequirePackage{rotating}% package to rotate text

\RequirePackage[absolute]{textpos}% package to position text anywhere on page
\setlength{\TPHorizModule}{1mm}% defines coordinate system for textpos
\setlength{\TPVertModule}{1mm}% defines coordinate system for textpos

\setlength{\parindent}{0pt}% no indention at paragraphs' start
\setlength{\parskip}{0pt}% no vertical separation between paragraphs

\usepackage{luatex85}

\pagestyle{empty}% no page numbers

\newcommand{\dissertationpdf}[2][Not for publication!]{%

\pdfximage{#2}% Read entire PDF
\edef\totalpages{\the\pdflastximagepages}% Store number of pages
\edef\lastbutonepage{\number\numexpr\totalpages-1}% Store last page - 1

\includepdf[%
openright,% put an empty page before the first logical page
nup=2x1,% two horizontally-aligned pages
delta={1cm 0},% separate both pages horizontally  1cm
pages={3-\lastbutonepage},% from first page all the way to the end
frame=true,% put a frame around each inserted page
trim={20mm 20mm 20mm 20mm},% CHANGE new margin size, cut away the margin around each page
clip=true,% do not show what has been cut away
scale=0.95,% make inserted pages smaller to have some margin on paper
pagecommand={%
\begin{textblock}{10}(150,190)%
\begin{rotate}{90}%
\today, \thistime% insert current date here
\hspace{1cm}%
\@author% insert author as specified above
\hspace{1cm}%
#1% insert comment as specified above
\end{rotate}
\end{textblock}
}%
]{%
#2% PDF file to insert pages from
}
}
