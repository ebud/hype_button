BUTTON_MID_RAD = 64.5/2;
BUTTON_MID_HEIGHT = 11;
BOTTOM_RAD = 72.5/2;
SHELL_THICKNESS = 2.5;
SIDE_SEGMENT = 24.85;
PUSHER_HEIGHT = 7.5;
PUSHER_RAD = 5;
CURVE_HEIGHT = 7;
ANCHOR_ANGLE=41;
LIP_OUTER_RAD=68.75/2;

FACETS = 50;

TEXT="HYPE";
TEXT_SIZE=70/len(TEXT);
FONT="Andale Mono:style=Regular";


$fn=FACETS;
echo(str("Facets: ", FACETS));

module ring(r1, r2, h) {
    difference() {
        cylinder(r = r1, h = h);
        translate([ 0, 0, -1 ]) cylinder(r = r2, h = h+2);
    }
}

module sector(r, a1, a2, h){
    points = [
        for(a = [a1:1:a2]) [r * cos(a), r * sin(a)]
    ];
    linear_extrude(h)
    polygon(concat([[0, 0]], points));
}

module anchors(){
    intersection(){
        ring(
            r1=BOTTOM_RAD,
            r2=BUTTON_MID_RAD-SHELL_THICKNESS,
            h=SHELL_THICKNESS);
        
        union(){
            sector(BOTTOM_RAD, 0, ANCHOR_ANGLE, SHELL_THICKNESS);
            sector(BOTTOM_RAD, 180, ANCHOR_ANGLE+180, SHELL_THICKNESS);
        }
    }
}

module shape(){
    cylinder(h=BUTTON_MID_HEIGHT, r=BUTTON_MID_RAD);
    translate([0,0,BUTTON_MID_HEIGHT])
    resize([0,0,CURVE_HEIGHT*2])
    sphere(r=BUTTON_MID_RAD);
}

module shell(){
    d = (BUTTON_MID_RAD-SHELL_THICKNESS)/BUTTON_MID_RAD;
    difference(){
        shape();
        translate([0,0,-SHELL_THICKNESS])
        scale([d,d,d])
        shape();
    }
} 

module pusher(){
    t = CURVE_HEIGHT + BUTTON_MID_HEIGHT - PUSHER_HEIGHT-1;
    translate([0,0, t])
    cylinder(h=PUSHER_HEIGHT, r=PUSHER_RAD);
}

module lip(){
    ring(
        r1=LIP_OUTER_RAD,
        r2=BUTTON_MID_RAD-SHELL_THICKNESS,
        h=SHELL_THICKNESS);
}

module hype_button(){
    union(){
        anchors();
        shell();
        pusher();
        lip();
    }
}

module label(){
    difference(){
        translate([0,0,13])
        linear_extrude(15)
        text(TEXT, halign="center", valign="center", size=TEXT_SIZE, font=FONT);
        shape();
    }
}

module hype_button_w_label(){
    difference(){
        hype_button();
        translate([0,0,-2])
        label();
    }
}

hype_button_w_label();

