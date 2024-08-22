% dsctemplate.sty
% --------------
% author: Justin Eldridge
% email: jeldridge@ucsd.edu
%
% This package provides commands and environments for the DSC homework/exam template.

\LoadClass{article}

\RequirePackage{environ}
\RequirePackage{mdframed}
\RequirePackage{tikz}
\RequirePackage{xparse}

% conditionally show solutions
\newif\ifshowsoln
\showsolntrue

% sizes and lengths
% -----------------

% separation between problems
\newcommand{\probsep}{0.5cm}

% separation between subproblems
\newcommand{\subprobsep}{.25cm}

% commands
% --------

% draw the problem set's title
\NewDocumentCommand{\pstitle}{ m m o }{
    \begin{center}
        \begin{tikzpicture}
            \node[align=center] (title) at (0,0) {
                    {
                        \fontsize{13pt}{13pt}\selectfont
                        \textbf{#1 - #2}
                    }
                    \IfNoValueTF{#3}{
                    }{
                        \\#3
                    }
                };
                \draw[line width=1] 
                    ([yshift=3]title.north west) 
                    -- 
                    ([yshift=3]title.north east);
            \draw[line width=1] 
                    ([yshift=-2]title.south west) 
                    -- 
                    ([yshift=-2]title.south east);
        \end{tikzpicture}
    \end{center}
    \vspace{2em}
}

% draw a box with text in it
\newcommand{\remarkbox}[1]{
    \begin{mdframed}
        #1
    \end{mdframed}
}

\newcommand{\solutiontext}{
    \textbf{Solution:}
}


% problem environments
% ------------------------------------------------------------------------------

\newcounter{probnum}
\newcounter{bonusprobnum}
\newcounter{progprobnum}
\newcounter{subprobnum}[probnum]

% create a new problem set environment with proper spacing
\newenvironment{probset}{
    \begin{list}{}{
        \leftmargin=0em
        \labelwidth=3cm
        \itemsep=\probsep
        \parindent=1cm
    }
}{
    \end{list}
}

% create a new block of subproblems, indented to the right
\newenvironment{subprobset}{
    \begin{list}{}{
        \leftmargin=1cm
        \labelwidth=1cm
        \itemsep=\subprobsep
    }
}{
    \end{list}
}

% create a new numbered problem
% the optional argument is meant for point totals, descriptions, etc. If empty,
% nothing will be printed next to the problem number.
\newenvironment{prob}[1][]{
    \stepcounter{probnum}
    \item \textbf{Problem \theprobnum.} #1%
        \ifcsname probdescription\endcsname%
            \probdescription{}
        \fi%

}{}

% create a new lettered subproblem
\newenvironment{subprob}{
    \stepcounter{subprobnum}
    \item[\textbf{\alph{subprobnum})}]%
}{}


\newenvironment{progprob}[1][]{
    \stepcounter{progprobnum}
    \setcounter{subprobnum}{0}
    \item \textbf{Programming Problem \theprogprobnum.} #1

}{}


% responses and solutions
% ------------------------------------------------------------------------------

% if showsoln is true: draws a box containing solution text
% if showsoln is false: does nothing
\NewEnviron{soln}{
    \mdfsetup{skipabove=1em, skipbelow=1em}
    \ifshowsoln
        \begin{mdframed}
             \solutiontext \BODY
        \end{mdframed}
    \fi
}

% if showsoln is true: draws a box containing solution text (same as soln)
% if showsoln is false: draws the box, but without the solution text
% This differs from soln above. It requires a size argument:

%    \begin{responsebox}{3in}
%       This is the solution
%    \end{responsebox}
\NewEnviron{responsebox}[1]{
    \mdfsetup{skipabove=1em, skipbelow=1em}
        \begin{mdframed}
            \ifshowsoln
                \solutiontext \BODY
            \else
                \vspace*{#1}
            \fi
        \end{mdframed}
}

% Draw an inline response box.
% if showsoln is true: draws the box and the included text
% if showsoln is false: draws the box only
\newcommand{\inlineresponsebox}[2][1.5in]{%
    \tikz[baseline=-.5em]{
        \node[
            draw, rectangle, inner sep=0, text centered, minimum height=3em, 
            text width=#1, align=center
        ] at (0,0) {
        \ifshowsoln
            #2
        \fi
        };
        \useasboundingbox 
            ([shift={(1mm,1mm)}]current bounding box.north east)
            rectangle 
            ([shift={(-1mm,-1mm)}]current bounding box.south west);
    }%
}

% draw a response bubble
\newcommand{\bubble}[2][]{
    \tikz[baseline=-.25em]{
        \node[circle, draw, #1] {};
    }
    #2
    \qquad
}

% draw a response bubble
% if showsoln is true: fills the bubble, showing that it is correct
% if showsoln is false: draws an unfilled bubble
\newcommand{\correctbubble}[1]{
    \ifshowsoln
        \bubble[fill=black!90]{#1}
    \else
        \bubble[]{#1}
    \fi
}

% configuration
% ------------------------------------------------------------------------------

% command to load problems from particular subdirectory
\newcommand{\inputproblem}[2][]{
    {
        \newcommand{\probdescription}{#1}
        \newcommand{\thisdir}{./problems-hw-08/#2/}
        \input{problems-hw-08/#2/problem.tex}
    }
}
