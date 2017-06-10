include $(wildcard src/*.deps)

SOURCES ?= $(wildcard src/*.scad)
MAIN ?= src/main.scad
OPENSCAD ?= openscad

watch:
	($(OPENSCAD) $(MAIN) &)&

png: $(patsubst %.scad,%.png,$(MAIN)) ## Create png image
stl: $(patsubst %.scad,%.stl,$(MAIN)) ## Create stl file

%.png %.stl %.off %.dxf: %.scad
	$(OPENSCAD) -m make -d $*.deps -o $@ $<

clean:
	rm \
		$(wildcard $(patsubst %.scad,%.png,$(SOURCES))) \
		$(wildcard $(patsubst %.scad,%.stl,$(SOURCES)))
