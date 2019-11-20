default: renders/hype_button.stl renders/hype_button_w_text.stl

hype_button_w_text.scad: hype_button.scad

renders/%.stl: %.scad
	openscad -D 'FACETS=250' -o $@ $<


.PHONY: clean
clean:
	rm -r renders/*.stl
