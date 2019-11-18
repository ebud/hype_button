default: renders/hype_button.stl renders/hype_button_w_text.stl

renders/%.stl: %.scad
	openscad -D 'FACETS=250' -o $@ $<

.PHONY: clean
clean:
	rm -r renders/*.stl
