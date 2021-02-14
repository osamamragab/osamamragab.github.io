all: build-cv
.PHONY: all

build-cv:
	pdflatex -output-directory tmp cv.tex
.PHONY: build-cv

dev-cv:
	echo "cv.tex" | entr -s "make build-cv && pkill -HUP mupdf"
.PHONY: dev-cv
