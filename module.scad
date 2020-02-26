cube_height = 10;
cube_width = 10;
cube_depth = 10;

$fs = 0.1;

module rounded_cube (size, d) {
    h = 0.0001;
    translate([d / 2, d / 2, d / 2])
    minkowski () {
        cube([size[0] - d, size[1] - d, size[2] - d], center = false);
        sphere(d = d);
    }
}