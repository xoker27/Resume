\NeedsTeXFormat{LaTeX2e}
\usepackage{amssymb}
\usepackage[export]{adjustbox}
\LoadClass{extarticle}
\setlength{\parindent}{0mm}
\usepackage[hidelinks]{hyperref} 
\pagestyle{empty}
\usepackage{graphicx}
\usepackage{moresize}
\usepackage{fontawesome}
\usepackage{geometry}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[default]{raleway}
\usepackage{tikz}


\geometry{
	paper=a4paper,
	top=1.00cm,
	bottom=1.00cm,
	left=1cm,
	right=1cm,
	headheight=0.75cm,
	footskip=1cm, 
	headsep=0.5cm,
}

\usetikzlibrary{shapes, backgrounds}
\tikzset{x=1cm, y=1cm}

\newcommand{\vcenteredhbox}[1]{
	\begingroup
		\setbox0=\hbox{#1}\parbox{\wd0}{\box0}%
	\endgroup
}

\newcounter{barcount}

\newenvironment{barchart}[1]{
	\newcommand{\barwidth}{0.35}
	\newcommand{\barsep}{0.2}
	
	\newcommand{\baritem}[2]{ 
		\pgfmathparse{##2}
		\let\perc\pgfmathresult
		
		\pgfmathparse{#1}
		\let\barsize\pgfmathresult
		
		\pgfmathparse{\barsize*##2/100}
		\let\barone\pgfmathresult
		
		\pgfmathparse{(\barwidth*\thebarcount)+(\barsep*\thebarcount)}
		\let\barx\pgfmathresult
		
		\filldraw[fill=lightgray, draw=none] (0,-\barx) rectangle (\barone,-\barx-\barwidth);
		
		\node [label=180:\colorbox{white}{\textcolor{black}{##1}}] at (0,-\barx-0.175) {};
		\addtocounter{barcount}{1}
	}
	\begin{tikzpicture}
		\setcounter{barcount}{0}
}{
	\end{tikzpicture}
}


\newcounter{a}
\newcounter{b}
\newcounter{c}

\newcommand{\cvsect}[1]{
	\vspace{\baselineskip} 
	\colorbox{black}{\textcolor{white}{\textbf{#1}}}\\
}

\usepackage{longtable} 
\setlength{\LTpre}{0pt}
\setlength{\LTpost}{0pt}

\setlength{\tabcolsep}{0pt}

\newenvironment{entrylist}{
	\begin{longtable}[H]{l l}
}{
	\end{longtable}
}

\newcommand{\entry}[4]{
	\parbox[t]{0.175\textwidth}{
		#1
	}
	&\parbox[t]{0.825\textwidth}{
		\textbf{#2}
		\hfill
		{\footnotesize \textbf{\textcolor{black}{#3}}}\\
		#4
	}\\\\}

\newcommand{\slashsep}{\hspace{3mm}/\hspace{3mm}}
