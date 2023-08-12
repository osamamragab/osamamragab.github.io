public/cv.pdf: tmp/cv.pdf
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -sOutputFile=$@ $^

tmp/cv.pdf: cv.tex
	@mkdir -p $(dir $@)
	pdflatex -interaction=nonstopmode -output-directory=$(dir $@) $^

watch-cv: tmp/cv.pdf
	pidof -qsx mupdf || setsid -f mupdf $^ &
	echo cv.tex | entr -s "make $^ && pkill -HUP mupdf"

clean:
	rm -rf tmp

.PHONY: watch-cv clean
