include <constants.scad>;

module Top() {
  echo("Rendering the basis");
  translate([0, 0, main_body_thickness])
    translate([-thickness_1, -thickness_1, 0])
    cube([basis_width + 2*thickness_1, basis_depth + 2*thickness_1, basis_height]);
}

