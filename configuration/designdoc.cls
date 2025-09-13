\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{designdoc}[2025/09/07 Design Document class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[a4paper]{report}

\usepackage{iftex}
%% Разрешить компиляцию только с движком LuaTex
\makeatletter
\ifLuaTeX
\else
  \ifXeTeX
  \else
    \newlinechar 64\relax
    \errorcontextlines -1\relax
    \immediate\write20{@
        *********************************************************@
        * LuaLaTex or XeTeX is required to compile this document.@
        * Sorry!@
        **********************************************************}%
    \batchmode\read -1 to \@tempa
  \fi
\fi
\makeatother

%% Для русификации достаточно подключить пакет fontspec и
%% выбрать Unicode шрифт в котором есть кириллические глифы. Ниже
%% основным шрифтом выбирается Unicode версия шрифта Computer Modern с заcечками
\RequirePackage{fontspec}
\setmainfont{CMU Serif}
\setsansfont{CMU Sans Serif}
\setmonofont{CMU Typewriter Text}

%% В LuaLaTeX альтернативой известного пакета babel является пакет polyglossia.
%% Теперь у нас будут переносы слов
\RequirePackage{polyglossia}
\setdefaultlanguage{russian}
\setotherlanguage{english}

\RequirePackage{fvextra}
\RequirePackage[autostyle]{csquotes} % Правильные кавычки в зависимости от языка

%Отключить предупреждения об кастномной использовании пакетов "You have requested package..."
\RequirePackage{silence}
\WarningFilter{latex}{You have requested package}



%%%%%%%%%%%%%%%%%
%% Page layout %%
%%%%%%%%%%%%%%%%%

\RequirePackage{rotating} % Повороты страницы
\RequirePackage{pdflscape} % Правильное отображение альбомной страницы в pdf файле
\RequirePackage[pagestyles]{titlesec}
\RequirePackage{fancyhdr} % Настройка колонтиутулов
\RequirePackage{geometry}


\geometry{%
  left=2cm,
  right=2cm,
  top=2cm,
  bottom=2cm,
  bindingoffset=0cm
}

\geometry{%
  a4paper,
  margin=1cm,
  includefoot,
  includehead
}

\titleformat{\chapter}[frame]{\Large}{%
  \filright
  \footnotesize
  \enspace Раздел~\arabic{chapter}\enspace%
}{1.5ex}{\bfseries\filcenter}


\usepackage{xparse}
\usepackage{macroses/references}
\usepackage{macroses/mathematics}
\usepackage{macroses/typesetting}
\usepackage{macroses/floats}

%\input{configuration/macroses/utils/references/knowledgeconf.tex}
\AtBeginDocument{%
    \allowdisplaybreaks
    \tikzset{every picture/.style={line width=0.75pt}} %set default line width to 0.75pt                
}
\sloppy
