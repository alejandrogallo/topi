include <constants.scad>;

module Top() {
  echo("Rendering the basis top");
  cube([basis_width + 2*thickness_1, basis_depth + 2*thickness_1, basis_height]);
}

