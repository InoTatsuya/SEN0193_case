use <module.scad>

body_height = 17;
body_width = 32;
body_length = 25;
prug_height = 2;
prug_width = 24;
thin = 3;
body_round = 2;
margin_cut = 3;
margin_fitting = 5;
margin_thin =  0.0;

module body_fitting(){
    difference() {
        translate([0, body_length - margin_fitting, 0])
        cube([body_width, margin_fitting, body_height]);
        translate([(thin / 2) + margin_thin, body_length - margin_fitting, (thin / 2) + margin_thin])
        cube([body_width - thin - margin_thin * 2, margin_fitting, body_height - thin - margin_thin * 2]);
    }
}

module body_prug(){
    difference() {
        translate([body_width / 2 , 0, body_height * 3 / 9])
        color([1,0,0]) cube([prug_width, thin * 2, prug_height], center = true);
//        color([1,0,0]) cube([10, 10, 10], center = true);
    }
}

module body(){
//    union() { // OR
    difference() { // NOR?
//    intersection() { // AND
        rounded_cube([body_width,body_length + margin_cut,body_height], body_round);
        translate([-margin_cut, body_length, -margin_cut])
        cube([body_width + margin_cut  * 2,body_length + margin_cut * 2,body_height + margin_cut * 2]);
        translate([thin, thin, thin])
        cube([body_width - thin * 2, body_length + 1, body_height - thin * 2]);
        body_fitting();
        body_prug();
    }
}

body();