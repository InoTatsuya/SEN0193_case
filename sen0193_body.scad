use <module.scad>

height = 10;
width = 30;
length = 40;
cube_round = 2;
margin_cut = 3;
margin_thin = 3;


module body(){
    difference() {
        rounded_cube([width,length + margin_cut,height], cube_round);
        translate([-margin_cut, length - cube_round / 2, -margin_cut])
        cube([width + margin_cut  * 2,length + margin_cut * 2,height + margin_cut * 2]);
        translate([0, 10, 0])
        cube([width - cube_round, length + 1, height - cube_round]);
    }
//    translate([0, length, 0])
//    cube([10 , 10, 10]);
}

translate([cube_round / 2, cube_round / 2, cube_round / 2])
body();
