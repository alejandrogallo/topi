include $(wildcard src/*.deps)

SOURCES ?= $(wildcard src/*.scad)
MAIN ?= src/main.scad
OPENSCAD ?= openscad
IMGSIZE=2000,2000

watch:
	($(OPENSCAD) $(MAIN) &)&

png: $(patsubst %.scad,%.png,$(MAIN)) ## Create png image
stl: $(patsubst %.scad,%.stl,$(MAIN)) ## Create stl file

%.stl %.off %.dxf: %.scad
	$(OPENSCAD) -m make -d $*.deps -o $@ $<

%.png: %.scad
	$(OPENSCAD) --imgsize=$(IMGSIZE) -m make -d $*.deps -o $@ $<

%.eps: %.svg
	inkscape -E $@ $<

%.dxf: %.eps
	pstoedit -dt -f dxf:-polyaslines\ -mm $< $@

clean:
	rm \
		$(wildcard $(patsubst %.scad,%.png,$(SOURCES))) \
		$(wildcard $(patsubst %.scad,%.stl,$(SOURCES)))
		$(wildcard $(patsubst %.scad,%.off,$(SOURCES)))
		$(wildcard $(patsubst %.scad,%.dxf,$(SOURCES)))
		$(wildcard $(patsubst %.scad,%.deps,$(SOURCES)))
