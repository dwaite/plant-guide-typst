TYPST   := $(shell command -v typst 2>/dev/null || echo /Users/david/.cargo/bin/typst)
SRC     := main.typ
OUT     := dist/plant_care_guide.pdf
IMGDIR  := images

.PHONY: all build watch open clean check images
.PHONY: generate generated-check lint-data consistency verify install-hooks chatgpt-snapshot

all: build

## Compile the PDF
build: generated-check
	mkdir -p dist
	$(TYPST) compile $(SRC) $(OUT)

## Watch for changes and recompile automatically
watch: generated-check
	mkdir -p dist
	$(TYPST) watch $(SRC) $(OUT)

## Compile then open the PDF (macOS)
open: build
	open $(OUT)

## Remove generated PDF
clean:
	rm -f $(OUT)

## Verify the document compiles without writing output (exit non-zero on error)
check: generated-check
	$(TYPST) compile --format pdf $(SRC) /dev/null

## Regenerate Typst include files from canonical data sources
generate:
	python3 scripts/generate_plant_data_typ.py
	python3 scripts/generate_reference_data_typ.py

## Build a clean Markdown/TOML/images snapshot for ChatGPT Project uploads
chatgpt-snapshot:
	python3 scripts/build_chatgpt_snapshot.py

## Fail if generated Typst include files are out of date
generated-check:
	python3 scripts/generate_plant_data_typ.py --check
	python3 scripts/generate_reference_data_typ.py --check

## Lint canonical plant data for required fields and style consistency
lint-data:
	python3 scripts/lint_plant_data.py

## Check that every image referenced in plant files exists on disk
images:
	@echo "Checking plant images..."
	@missing=0; \
	for stem in $$(grep -h 'plant-header' content/plants/*.typ \
	              | sed 's/.*plant-header("[^"]*", "[^"]*", "\([^"]*\)".*/\1/'); do \
	  if ! ls $(IMGDIR)/$$stem.* >/dev/null 2>&1; then \
	    echo "  MISSING: $(IMGDIR)/$$stem.*"; \
	    missing=$$((missing + 1)); \
	  fi; \
	done; \
	if [ $$missing -eq 0 ]; then echo "  All images present."; fi; \
	exit $$missing

## Check that plant files in content/ match canonical file keys in data/plants.toml
consistency:
	@echo "Checking content/data consistency..."
	@tmp_content=$$(mktemp); \
	tmp_data=$$(mktemp); \
	find content/plants -maxdepth 1 -type f -name '*.typ' -exec basename {} .typ \; | sort > $$tmp_content; \
	sed -n 's/^file[[:space:]]*=[[:space:]]*"\([^"]*\)".*/\1/p' data/plants.toml | sort > $$tmp_data; \
	missing_in_data=$$(comm -23 $$tmp_content $$tmp_data); \
	missing_in_content=$$(comm -13 $$tmp_content $$tmp_data); \
	status=0; \
	if [ -n "$$missing_in_data" ]; then \
	  echo "  Missing in data/plants.toml:"; \
	  echo "$$missing_in_data" | sed 's/^/    - /'; \
	  status=1; \
	fi; \
	if [ -n "$$missing_in_content" ]; then \
	  echo "  Missing in content/plants/:"; \
	  echo "$$missing_in_content" | sed 's/^/    - /'; \
	  status=1; \
	fi; \
	if [ $$status -eq 0 ]; then echo "  Plant lists are in sync."; fi; \
	rm -f $$tmp_content $$tmp_data; \
	exit $$status

## Full local validation pass
verify: lint-data generated-check check images consistency

## Configure repo-local git hooks
install-hooks:
	git config core.hooksPath .githooks
