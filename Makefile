default: cv

cv:
	@mkdir -p tmp
	pdflatex -output-directory=tmp cv.tex && \
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -sOutputFile=public/cv.pdf tmp/cv.pdf

watch-cv:
	! pidof -s mupdf >/dev/null 2>&1 && mupdf tmp/cv.pdf >/dev/null 2>&1 &
	echo "cv.tex" | entr -s "pdflatex -output-directory=tmp cv.tex && pkill -HUP mupdf"

clean:
	rm -rf tmp

.PHONY: default cv watch-cv clean
