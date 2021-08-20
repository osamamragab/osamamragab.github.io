cv.pdf:
	pdflatex -output-directory=tmp cv.tex && \
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -sOutputFile=cv.pdf tmp/cv.pdf

watch-cv:
	! pidof -s mupdf >/dev/null 2>&1 && mupdf tmp/cv.pdf >/dev/null 2>&1 &
	echo "cv.tex" | entr -s "pdflatex -output-directory=tmp cv.tex && pkill -HUP mupdf"

clean:
	rm -rf cv.pdf tmp/*

.PHONY: watch-cv clean
