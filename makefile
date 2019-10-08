renders/hype_button.stl: hype_button.scad
	openscad -D 'FACETS=250' -o $@ $<

