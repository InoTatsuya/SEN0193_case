use <module.scad>

height = 10;
width = 30;
length = 40;
thin = 1;
cube_round = 2;
margin_cut = 3;
margin_fitting = 5;

module body(){
//    union() { // OR
    difference() { // NOR?
//    intersection() { // AND
        rounded_cube([width,length + margin_cut,height], cube_round);
        translate([-margin_cut, length, -margin_cut])
        cube([width + margin_cut  * 2,length + margin_cut * 2,height + margin_cut * 2]);
        translate([thin, thin, thin])
        cube([width - thin * 2, length + 1, height - thin * 2]);
    }
}

body();
