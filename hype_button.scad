$fn=50;

BUTTON_MID_RAD = 64.5/2;
BUTTON_MID_HEIGHT = 11;
BOTTOM_RAD = 71.5/2;
SHELL_THICKNESS = 1.5;

SIDE_SEGMENT = 24.85;
PUSHER_HEIGHT = 11;
PUSHER_RAD = 5;

CURVE_HEIGHT = 7;

module ring(r1, r2, h) {
    difference() {
        cylinder(r = r1, h = h);
        translate([ 0, 0, -1 ]) cylinder(r = r2, h = h+2);
    }
}

module sector(r, a1, a2, h){
    echo([a1:1:a2]);
    points = [
        for(a = [a1:1:a2]) [r * cos(a), r * sin(a)]
    ];
    linear_extrude(h)
    polygon(concat([[0, 0]], points));
}

module anchors(t){
    intersection(){
        ring(
            r1=BOTTOM_RAD,
            r2=BUTTON_MID_RAD-SHELL_THICKNESS,
            h=SHELL_THICKNESS);
        
        union(){
            sector(BOTTOM_RAD, 0, t, SHELL_THICKNESS);
            sector(BOTTOM_RAD, 180, t+180, SHELL_THICKNESS);
        }
    }
}

module top(){
    cylinder(h=BUTTON_MID_HEIGHT, r=BUTTON_MID_RAD);
    translate([0,0,BUTTON_MID_HEIGHT])
    resize([0,0,CURVE_HEIGHT*2])
    sphere(r=BUTTON_MID_RAD);
}

module pusher(){
    translate([0,0,CURVE_HEIGHT-1])
    cylinder(h=PUSHER_HEIGHT, r=PUSHER_RAD);
}

anchors(50);
ring(
    r1=BUTTON_MID_RAD,
    r2=BUTTON_MID_RAD-SHELL_THICKNESS,
    h=BUTTON_MID_HEIGHT);
top();

//union(){
//    difference(){
//        top();
//        translate([0,0,-SHELL_THICKNESS])
//        scale([0.95,0.95,0.95])
//        top();

//    }

//    pusher();
//}

//cylinder(h=SHELL_THICKNESS, r=BOTTOM_RAD);

