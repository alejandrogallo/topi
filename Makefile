include $(wildcard src/*.deps)

SOURCES ?= $(wildcard src/*.scad)
MAIN ?= src/main.scad
OPENSCAD ?= openscad
IMGSIZE=2000,2000
STL_DIR=stl
SRC_DIR=src
PNG_DIR=png

watch:
	($(OPENSCAD) $(MAIN) &)&

png: $(patsubst %.scad,$(PNG_DIR)/%.png,$(patsubst $(SRC_DIR)/%,%,$(SOURCES))) ## create png file
stl: $(patsubst %.scad,$(STL_DIR)/%.stl,$(patsubst $(SRC_DIR)/%,%,$(SOURCES))) ## Create stl file

$(STL_DIR)/%.stl: $(SRC_DIR)/%.stl
	@mkdir -p $(dir $@)
	-cp $< $@

$(PNG_DIR)/%.png: $(SRC_DIR)/%.png
	@mkdir -p $(dir $@)
	-cp $< $@

%.stl %.off %.dxf: %.scad
	@mkdir -p $(dir $@)
	-$(OPENSCAD) -m make -d $*.deps -o $@ $<

%.png: %.scad
	@mkdir -p $(dir $@)
	-$(OPENSCAD) --imgsize=$(IMGSIZE) -m make -d $*.deps -o $@ $<

%.eps: %.svg
	@mkdir -p $(dir $@)
	inkscape -E $@ $<

%.dxf: %.eps
	@mkdir -p $(dir $@)
	pstoedit -dt -f dxf:-polyaslines\ -mm $< $@

clean:
	rm -rf \
		$(wildcard stl) \
		$(wildcard png)

help: ## Prints help for targets with comments
	@$(or $(AWK),awk) ' \
		BEGIN {FS = ":.*?## "}; \
		/^## *<<HELP/,/^## *HELP/ { \
			help=$$1; \
			gsub("#","",help); \
			if (! match(help, "HELP")) \
				print help ; \
		}; \
		/^[a-zA-Z0-9_\-.]+:.*?## .*$$/{ \
			printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 ; \
		};' \
		$(MAKEFILE_LIST)

