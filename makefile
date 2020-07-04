default: \
  renders/hype_button.stl \
	renders/hype_button.png \
  renders/hype_button_w_text.stl \
	renders/hype_button_w_text.png

renders/hype_button.stl renders/hype_button.png: hype_button.scad
	openscad -D 'FACETS=250' --colorscheme=DeepOcean -o $@ $<

renders/hype_button_w_text.stl renders/hype_button_w_text.png: hype_button.scad
	openscad -D 'FACETS=250' -D 'TEXT="HYPE"' --colorscheme=DeepOcean -o $@ $<

.PHONY: clean
clean:
	rm -r renders/*
