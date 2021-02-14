all: build-cv
.PHONY: all

build-cv:
	pdflatex -output-directory tmp cv.tex
.PHONY: build-cv

dev-cv:
	@! pidof -s mupdf >/dev/null 2>&1 && mupdf tmp/cv.pdf >/dev/null 2>&1 &
	echo "cv.tex" | entr -s "make build-cv && pkill -HUP mupdf"
.PHONY: dev-cv
