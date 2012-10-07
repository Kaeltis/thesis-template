@echo off
SET RESULT_DIR="01_Thesis"
SET OUTPUT_DIR="00_Output"
SET FILE="thesis"
mkdir %RESULT_DIR%
cd tex
mkdir %OUTPUT_DIR%
pdflatex -output-directory=%OUTPUT_DIR% -synctex=1 -interaction=nonstopmode %FILE%.tex 
bibtex %OUTPUT_DIR%\%FILE%.aux
makeindex %OUTPUT_DIR%\%FILE%.idx
pdflatex -output-directory=%OUTPUT_DIR% -synctex=1 -interaction=nonstopmode %FILE%.tex
pdflatex -output-directory=%OUTPUT_DIR% -synctex=2 -interaction=nonstopmode %FILE%.tex
copy %OUTPUT_DIR%\%FILE%.pdf ..\%RESULT_DIR%\%FILE%.pdf
cd ..

