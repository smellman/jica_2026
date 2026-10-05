SRC = jica-seminar-2026.md
HTML = $(SRC:%.md=%.html)
PDF = $(SRC:%.md=%.pdf)
PPTX = $(SRC:%.md=%.pptx)
MARP = npx -y @marp-team/marp-cli@latest

.PHONY: all html pdf pptx clean

all: html pdf pptx

html: $(HTML)
pdf: $(PDF)
pptx: $(PPTX)

$(HTML): $(SRC)
	$(MARP) $(SRC) -o $@

$(PDF): $(SRC)
	$(MARP) $(SRC) -o $@ --allow-local-files

$(PPTX): $(SRC)
	$(MARP) $(SRC) -o $@ --allow-local-files

clean:
	rm -f $(HTML) $(PDF) $(PPTX)
