TYPST   := $(shell command -v typst 2>/dev/null || echo /Users/david/.cargo/bin/typst)
SRC     := main.typ
OUT     := plant_care_guide.pdf
IMGDIR  := images

.PHONY: all build watch open clean check images

all: build

## Compile the PDF
build:
	$(TYPST) compile $(SRC) $(OUT)

## Watch for changes and recompile automatically
watch:
	$(TYPST) watch $(SRC) $(OUT)

## Compile then open the PDF (macOS)
open: build
	open $(OUT)

## Remove generated PDF
clean:
	rm -f $(OUT)

## Verify the document compiles without writing output (exit non-zero on error)
check:
	$(TYPST) compile --format pdf $(SRC) /dev/null

## Check that every image referenced in plant files exists on disk
images:
	@echo "Checking plant images..."
	@missing=0; \
	for stem in $$(grep -h 'plant-header' content/plants/*.typ \
	              | sed 's/.*plant-header("[^"]*", "[^"]*", "\([^"]*\)").*/\1/'); do \
	  if ! ls $(IMGDIR)/$$stem.* >/dev/null 2>&1; then \
	    echo "  MISSING: $(IMGDIR)/$$stem.*"; \
	    missing=$$((missing + 1)); \
	  fi; \
	done; \
	if [ $$missing -eq 0 ]; then echo "  All images present."; fi; \
	exit $$missing
