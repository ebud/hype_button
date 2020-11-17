
renders/hype_button.stl renders/hype_button.png: hype_button.scad
	openscad -D 'FACETS=250' --colorscheme=DeepOcean --render --imgsize=2400,2400 -o $@ $<

.PHONY: clean
clean:
	rm -r renders/*
