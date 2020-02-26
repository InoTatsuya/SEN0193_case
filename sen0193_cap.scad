use <module.scad>

cap_height = 15;
cap_width = 30;
cap_length = 25;
prug_height = 2.7;
prug_width = 8;
thin = 1;
cap_round = 2;
margin_cut = 3;
margin_fitting = 5;

module cap_fitting(){
    difference() {
        translate([thin / 2, cap_length - margin_fitting, thin / 2])
        cube([cap_width - thin, margin_fitting, cap_height - thin]);
        translate([thin, cap_length - margin_fitting, thin])
        cube([cap_width - thin * 2, margin_fitting, cap_height - thin * 2]);
    }
}

module cap_prug(){
    difference() {
        translate([cap_width / 2 , 0, cap_height / 2])
        color([1,0,0]) cube([prug_width, thin * 2, prug_height], center = true);
//        color([1,0,0]) cube([10, 10, 10], center = true);
    }
}

module cap(){
//    union() { // OR
    difference() { // NOR?
//    intersection() { // AND
        rounded_cube([cap_width,cap_length + margin_cut,cap_height], cap_round);
        translate([-margin_cut, cap_length, -margin_cut])
        cube([cap_width + margin_cut  * 2,cap_length + margin_cut * 2,cap_height + margin_cut * 2]);
        translate([thin, thin, thin])
        cube([cap_width - thin * 2, cap_length + 1, cap_height - thin * 2]);
        cap_fitting();
        cap_prug();
    }
}

cap();