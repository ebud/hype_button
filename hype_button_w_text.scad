use <hype_button.scad>

FACETS = 50;
$fn=FACETS;
echo(str("Facets: ", FACETS));

module label(){
    difference(){
        translate([0,0,13])
        linear_extrude(15)
        text("HYPE", halign="center", valign="center", size=15);
        shape();
    }
}

difference(){
    hype_button();
    translate([0,0,-2])
    label();
}
